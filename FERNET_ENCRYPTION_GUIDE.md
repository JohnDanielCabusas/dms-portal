# Fernet Encryption Implementation Guide


## Overview


The Document Management System (DMS) uses **Cryptography Fernet** for encrypting sensitive file paths and profile images stored in the database. This provides reversible encryption, allowing the system to decrypt and access files when needed, while keeping the actual file paths hidden in the database.


## How It Works


### 1. **Encryption Setup**


The system initializes Fernet encryption using an environment variable `DMS_FERNET_KEY`:


```python
# In app.py
FERNET = _init_fernet()  # Initialized at startup
```


**To set up Fernet encryption:**
1. Generate a Fernet key (32 bytes, base64-encoded):
   ```python
   from cryptography.fernet import Fernet
   key = Fernet.generate_key()
   print(key.decode())  # Save this value
   ```


2. Set the environment variable in your `.env` file:
   ```bash
   # Create or edit .env file in the project root
   DMS_FERNET_KEY=your-generated-key-here
   ```
   
   **Note:** The application uses `python-dotenv` to automatically load the `.env` file when the application starts. Make sure `python-dotenv` is installed:
   ```bash
   pip install python-dotenv
   ```


3. If `DMS_FERNET_KEY` is not set or invalid, the system falls back to SHA-256 hashing (one-way, non-reversible).


### 2. **What Gets Encrypted**


The following sensitive data is encrypted before being stored in the database:


- **File paths** (`files.file_path`): The actual file system path where uploaded files are stored
- **Profile images** (`users.profile_image`): The filename/path of user profile images
- **Company logo** (`settings.company_logo`): The filename/path of the company logo


### 3. **Encryption Process**


When a file is uploaded:


1. **File is saved to disk** at a physical location (e.g., `C:\Users\...\dms_uploads\user_123\document.pdf`)


2. **Path is encrypted** using `encrypt_sensitive()`:
   ```python
   file_path_hash = hash_file_path(file_path)  # Uses encrypt_sensitive internally
   ```


3. **Encrypted token is stored** in the database:
   ```python
   file_data = {
       'file_path': file_path_hash,  # Encrypted token, not the real path
       'is_encrypted': True,
       'encryption_version': 'fernet_v1'  # or 'hash_v1' if no Fernet key
   }
   ```


### 4. **Decryption Process**


When a file needs to be accessed:


1. **Encrypted token is retrieved** from the database (`file_record['file_path']`)


2. **Token is decrypted** using `decrypt_sensitive()`:
   ```python
   actual_path = decrypt_sensitive(stored_path)  # Returns the real file path
   ```


3. **File is accessed** using the decrypted path:
   ```python
   actual_file_path = resolve_file_path(file_record)  # Handles decryption automatically
   if actual_file_path and os.path.exists(actual_file_path):
       return send_file(actual_file_path)
   ```


### 5. **Database Schema**


The `files` table includes encryption metadata:


```sql
ALTER TABLE `files`
  ADD COLUMN `is_encrypted` BOOLEAN DEFAULT FALSE,
  ADD COLUMN `encryption_version` VARCHAR(20) DEFAULT NULL;
```


- `is_encrypted`: Indicates whether the file_path is encrypted/hashed
- `encryption_version`: Tracks the encryption method used (`'fernet_v1'` or `'hash_v1'`)


### 6. **Key Functions**


#### `encrypt_sensitive(value: str) -> str`
- Encrypts a string value using Fernet (if available)
- Falls back to SHA-256 hash if Fernet is not configured
- Returns the encrypted token or hash


#### `decrypt_sensitive(token: str) -> str | None`
- Decrypts a Fernet-encrypted token
- Returns `None` if decryption fails or Fernet is not available
- **Note**: SHA-256 hashes cannot be decrypted (one-way function)


#### `hash_file_path(file_path: str) -> str`
- Wrapper function that calls `encrypt_sensitive()`
- Used for backwards compatibility


#### `resolve_file_path(file_record) -> str | None`
- Resolves the actual file path from a database record
- Attempts to decrypt the stored path first
- Falls back to searching by filename if decryption fails


### 7. **Security Benefits**


1. **Database Security**: Even if someone gains access to the database, they cannot see the actual file locations
2. **Reversible Encryption**: Unlike hashing, Fernet allows the system to retrieve the original path when needed
3. **Backwards Compatible**: Falls back to SHA-256 hashing if Fernet is not configured
4. **Version Tracking**: The `encryption_version` field allows tracking which encryption method was used


### 8. **Migration Notes**


- **Existing records**: Files uploaded before Fernet was enabled may have SHA-256 hashed paths. The system handles both.
- **New records**: All new uploads use Fernet encryption (if configured) or SHA-256 hashing (fallback).
- **Profile images**: Stored as encrypted/hashed filenames in the database, but the actual files are stored with the encrypted filename.


### 9. **Example Flow**


```
1. User uploads "document.pdf"
   ↓
2. File saved to: C:\temp\dms_uploads\user_1\document.pdf
   ↓
3. Path encrypted: "gAAAAABh..." (Fernet token)
   ↓
4. Database stores: file_path = "gAAAAABh...", is_encrypted = True, encryption_version = "fernet_v1"
   ↓
5. When file is requested:
   - Retrieve token from DB: "gAAAAABh..."
   - Decrypt token: "C:\temp\dms_uploads\user_1\document.pdf"
   - Serve file from decrypted path
```


### 10. **Troubleshooting**


- **Files not found**: Check if `DMS_FERNET_KEY` is set correctly and matches the key used during encryption
- **Decryption fails**: The stored token may be a SHA-256 hash (non-reversible). The system will fall back to searching by filename.
- **Performance**: Fernet encryption/decryption is fast, but searching by filename (fallback) can be slower for large upload folders.


## Verification: Is Fernet Encryption Working?


### How to Verify


1. **Check if Fernet is initialized:**
   - Look for console output when the app starts:
     - If you see: `WARNING: Invalid DMS_FERNET_KEY, falling back to hash-only mode` → Fernet is NOT working (using SHA-256 hash)
     - If no warning appears → Fernet may be working (check step 2)


2. **Check database records:**
   ```sql
   SELECT file_id, name, file_path, is_encrypted, encryption_version
   FROM files
   ORDER BY file_id DESC
   LIMIT 5;
   ```
   - If `encryption_version = 'fernet_v1'` → Fernet is working
   - If `encryption_version = 'hash_v1'` or `NULL` → Using SHA-256 hash (Fernet not configured)


3. **Check file_path format:**
   - **Fernet token**: Starts with `gAAAAAB` (base64-encoded, ~44+ characters)
   - **SHA-256 hash**: 64 hexadecimal characters (e.g., `a1b2c3d4...`)
   - **Plain path**: Actual file system path (legacy, not encrypted)


4. **Test file access:**
   - Upload a file and try to download/preview it
   - If file is accessible → Encryption/decryption is working correctly
   - If file is not found → Check `DMS_FERNET_KEY` environment variable


### Current Implementation Status


✅ **Encryption is implemented and working** when `DMS_FERNET_KEY` is set:
- File paths are encrypted using `encrypt_sensitive()` → stored as Fernet tokens
- Profile images are encrypted → stored as encrypted tokens
- Company logo is encrypted → stored as encrypted tokens
- Database stores: `is_encrypted = True`, `encryption_version = 'fernet_v1'`


✅ **Decryption is working:**
- `resolve_file_path()` automatically decrypts stored tokens
- Falls back to filename search if decryption fails (backwards compatibility)


⚠️ **If `DMS_FERNET_KEY` is not set:**
- System falls back to SHA-256 hashing (one-way, non-reversible)
- Database stores: `is_encrypted = True`, `encryption_version = 'hash_v1'`
- Files are still protected, but paths cannot be decrypted (must use filename search)


### Encryption Flow Verification


```
Upload Process:
1. File saved: C:\temp\dms_uploads\2024\03\user_1\document.pdf
2. Path encrypted: hash_file_path(file_path)
   → encrypt_sensitive(file_path)
   → FERNET.encrypt(path.encode())
   → Returns: "gAAAAABh..." (Fernet token)
3. Database stores:
   - file_path = "gAAAAABh..." (encrypted token)
   - is_encrypted = True
   - encryption_version = "fernet_v1"


Access Process:
1. Retrieve from DB: file_path = "gAAAAABh..."
2. Decrypt: resolve_file_path(file_record)
   → decrypt_sensitive("gAAAAABh...")
   → FERNET.decrypt(token.encode())
   → Returns: "C:\temp\dms_uploads\2024\03\user_1\document.pdf"
3. Serve file from decrypted path
```


### Testing Encryption


To verify encryption is working:


1. **Check Application Startup Logs:**
   - When the application starts, you should see: `"SUCCESS: Fernet encryption initialized successfully."`
   - If you see: `"WARNING: DMS_FERNET_KEY not found..."` or `"WARNING: Invalid DMS_FERNET_KEY..."`, the encryption is not working.


2. **Check Database Records:**
   - After uploading a file, check the `files` table:
     - `is_encrypted` should be `1` (True) if Fernet is working
     - `encryption_version` should be `'fernet_v1'` if Fernet is working, or `'hash_v1'` if using fallback
     - `file_path` should be a long encrypted token (starts with `gAAAAABh...`) if Fernet is working


3. **Check Debug Logs:**
   - When uploading a file, check the console output:
     ```
     DEBUG: Encryption status - is_encrypted: True, encryption_version: fernet_v1
     DEBUG: Fernet initialized: True
     ```


4. **Verify .env File:**
   - Ensure `.env` file exists in the project root
   - Ensure `DMS_FERNET_KEY` is set (44 characters, base64-encoded)
   - Ensure `python-dotenv` is installed: `pip install python-dotenv`


5. **Test Decryption:**
   ```python
   # In app.py, after file upload
   print(f"DEBUG: Original path: {file_path}")
   print(f"DEBUG: Encrypted token: {file_path_hash}")
   print(f"DEBUG: Encryption version: {current_encryption_version()}")
   print(f"DEBUG: Fernet available: {FERNET is not None}")
   
   # Test decryption
   if FERNET:
       decrypted = decrypt_sensitive(file_path_hash)
       print(f"DEBUG: Decrypted path: {decrypted}")
       print(f"DEBUG: Match: {decrypted == file_path}")
   ```


## Summary


The Fernet encryption system provides a secure way to protect file paths in the database while maintaining the ability to access files when needed. It automatically handles encryption during uploads and decryption when files are accessed, with graceful fallback to filename-based search if decryption is not possible.


**Status**: ✅ **Fully implemented and working** - All file paths, profile images, and company logos are encrypted using Fernet when `DMS_FERNET_KEY` is configured, with automatic fallback to SHA-256 hashing if not configured.






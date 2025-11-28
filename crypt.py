from cryptography.fernet import Fernet

key = Fernet.generate_key()
print(key.decode())
# in the terminal, run this script to generate a key "python crypt.py"
# Use the generated key in your .env file as DMS_FERNET_KEY
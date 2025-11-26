def hash_file_path(file_path):
    """Return a SHA-256 hash of the file path as a hex string."""
    return hashlib.sha256(file_path.encode('utf-8')).hexdigest()
from flask import Flask, request, jsonify, send_file
from flask_cors import CORS
import os
import tempfile
from document_classifier import extract_text_from_file, classify_document
from database.database_config import DatabaseConfig
import json
from datetime import datetime
import hashlib
import secrets
# File storage and download routes
import os
import tempfile
import shutil
from werkzeug.utils import secure_filename
import requests 
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

app = Flask(__name__)
CORS(app)

# Define UPLOAD_FOLDER outside your code directory
UPLOAD_FOLDER = os.path.join(tempfile.gettempdir(), 'dms_uploads')  # Or use a custom path like '/var/dms/uploads'
ALLOWED_EXTENSIONS = {
    'txt', 'pdf',
    'png', 'jpg', 'jpeg', 'gif', 'bmp',
    'doc', 'docx',
    'xls', 'xlsx',
    'ppt', 'pptx',
    'zip'
}

# Add configuration for file storage
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = 50 * 1024 * 1024  # 50MB max file size

# Now check and create the upload folder
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

def save_uploaded_file(file, user_id):
    try:
        if not file or file.filename == '':
            return None, None, "No file selected"
            
        if not allowed_file(file.filename):
            return None, None, "File type not allowed"
        
        # Keep original filename but make it safe
        original_filename = secure_filename(file.filename)
        
        # Create organized folder structure to avoid conflicts
        today = datetime.now()
        year = today.year
        month = today.month
        user_folder = f"user_{user_id}"
        
        # Create folder path: uploads/2024/03/user_1/
        folder_path = os.path.join(app.config['UPLOAD_FOLDER'], str(year), str(month).zfill(2), user_folder)
        os.makedirs(folder_path, exist_ok=True)
        
        # Get only ACTIVE files from database to check for name conflicts
        query = "SELECT name FROM files WHERE user_id = %s AND status = 'active' AND name LIKE %s"
        connection = DatabaseConfig.get_connection()
        cursor = connection.cursor(dictionary=True)
        
        base_name = original_filename.rsplit('.', 1)[0]
        extension = original_filename.rsplit('.', 1)[1].lower()
        
        # Check if file with same name exists in user's ACTIVE files
        like_pattern = f"{base_name}%.{extension}"
        cursor.execute(query, (user_id, like_pattern))
        existing_files = cursor.fetchall()
        cursor.close()
        connection.close()
        
        final_filename = original_filename
        counter = 1
        
        # If file exists in active files, add (1), (2), etc.
        existing_names = [f['name'] for f in existing_files]
        while final_filename in existing_names:
            final_filename = f"{base_name} ({counter}).{extension}"
            counter += 1
        
        file_path = os.path.join(folder_path, final_filename)
        
        # Actually save the file
        file.save(file_path)
        
        # Verify file was saved
        if not os.path.exists(file_path):
            return None, None, "Failed to save file to server"
            
        print(f"DEBUG: File successfully saved at: {file_path}")
        file_path_hash = hash_file_path(file_path)
        return final_filename, file_path, file_path_hash, None
        
    except Exception as e:
        print(f"Error saving file: {e}")
        return None, None, f"File save error: {str(e)}"

# Update the upload-file route
@app.route('/api/upload-file', methods=['POST'])
def upload_file():
    try:
        print(f"DEBUG: Upload request received")
        print(f"DEBUG: Files in request: {list(request.files.keys())}")
        
        if 'file' not in request.files:
            return jsonify({'error': 'No file provided'}), 400
        
        file = request.files['file']
        print(f"DEBUG: File received: {file.filename}")
        
        if file.filename == '':
            return jsonify({'error': 'Please select a file to upload'}), 400
        
        user_id = request.form.get('user_id')
        workspace_ids = request.form.getlist('workspace_ids')  # Get multiple workspace IDs
        category_id = request.form.get('category_id')
        
        print(f"DEBUG: User ID: {user_id}, Workspace IDs: {workspace_ids}, Category ID: {category_id}")
        
        if not user_id:
            return jsonify({'error': 'User ID is required'}), 400
        
        # Check file size
        file.seek(0, 2)
        file_size = file.tell()
        file.seek(0)
        
        settings = DMSDatabase.get_settings()
        max_file_size = (settings.get('max_file_mb') or 50) * 1024 * 1024
        
        if file_size > max_file_size:
            max_mb = settings.get('max_file_mb') or 50
            return jsonify({'error': f'File size exceeds maximum allowed size of {max_mb}MB'}), 400
        
        # Check file type
        if not allowed_file(file.filename):
            allowed_types = settings.get('allowed_types', 'pdf,doc,docx,jpg,jpeg,png,txt')
            return jsonify({'error': f'File type not allowed. Allowed types: {allowed_types}'}), 400
        
        # Save the file

        final_filename, file_path, file_path_hash, error_msg = save_uploaded_file(file, user_id)
        if not file_path:
            return jsonify({'error': error_msg or 'Failed to save file'}), 400

        print(f"DEBUG: File saved successfully: {final_filename} at {file_path}")

        # Document classification logic
        classification_result = {}
        try:
            extracted_text = extract_text_from_file(file_path)
            if extracted_text:
                document_type = classify_document(extracted_text)
                confidence = calculate_confidence(extracted_text, document_type)
                classification_result = {
                    'document_type': document_type,
                    'confidence': confidence,
                    'text_sample': extracted_text[:200] + '...' if len(extracted_text) > 200 else extracted_text
                }
                
                # Auto-create category if it doesn't exist
                if document_type and document_type != "Unclassified":
                    existing_category = DMSDatabase.get_category_by_name(document_type)
                    if not existing_category:
                        DMSDatabase.create_category(
                            name=document_type,
                            description=f"Auto-created category for {document_type}",
                            auto_created=True,
                            is_unclassified=False
                        )
        except Exception as e:
            print(f"Classification error: {e}")
            classification_result = {
                'document_type': 'Unclassified',
                'confidence': 'Low',
                'error': str(e)
            }
        
        # Create file record in database - set workspace_id to NULL initially
        file_data = {
            'name': final_filename,
            'original_name': file.filename,
            'size': os.path.getsize(file_path),
            'type': file.filename.rsplit('.', 1)[1].lower(),
            'user_id': user_id,
            'workspace_id': None,  # Set to NULL - we use file_workspaces table now
            'category_id': category_id if category_id and category_id != 'null' else None,
            'document_type': classification_result.get('document_type'),
            'classification_confidence': classification_result.get('confidence'),
            'classification_error': classification_result.get('error'),
            'text_sample': classification_result.get('text_sample'),
            'shared': False,
            'document_type_category_id': None,
            'file_path': file_path_hash  # Store only the hash in the DB
        }

        print(f"DEBUG: Creating file record with data: {file_data}")
        print(f"DEBUG: Real file path: {file_path} | Hash stored: {file_path_hash}")

        file_id = DMSDatabase.create_file(file_data)

        if file_id:
            print(f"DEBUG: File created successfully with ID: {file_id}")
            
            # Add file to selected workspaces (many-to-many)
            workspace_additions = []
            for workspace_id in workspace_ids:
                if workspace_id and workspace_id != 'null':
                    workspace_id_int = int(workspace_id)
                    success = DMSDatabase.add_file_to_workspace(file_id, workspace_id_int)
                    workspace_additions.append({
                        'workspace_id': workspace_id_int,
                        'success': success
                    })
                    print(f"DEBUG: Added file {file_id} to workspace {workspace_id_int}: {success}")
            
            return jsonify({
                'success': True,
                'file_id': file_id,
                'filename': final_filename,
                'original_name': file.filename,
                'workspace_additions': workspace_additions,
                'file_path': file_path_hash,
                'classification': classification_result
            })
        else:
            # Clean up the saved file if database insertion failed
            print(f"DEBUG: Database insertion failed, cleaning up file")
            if os.path.exists(file_path):
                os.remove(file_path)
            return jsonify({'error': 'Failed to save file information to database'}), 500
        
    except Exception as e:
        print(f"DEBUG: Upload failed with exception: {str(e)}")
        return jsonify({'error': f'Upload failed: {str(e)}'}), 500
    
    
# Fix the download route in app.py
@app.route('/api/download-file/<int:file_id>', methods=['GET'])
def download_file(file_id):
    try:
        file_record = DMSDatabase.get_file_by_id(file_id)
        if not file_record:
            return jsonify({'error': 'File not found in database'}), 404
        
        file_path = file_record.get('file_path')
        print(f"DEBUG: Download requested for file_id {file_id}")
        print(f"DEBUG: File path from database: {file_path}")
        
        if not file_path:
            return jsonify({'error': 'File path not found in database'}), 404
            
        if not os.path.exists(file_path):
            print(f"DEBUG: File not found at path: {file_path}")
            # Try alternative locations
            upload_folder = app.config['UPLOAD_FOLDER']
            
            # Search recursively in upload folder
            for root, dirs, files in os.walk(upload_folder):
                for file in files:
                    if file == file_record['name'] or file == file_record['original_name']:
                        file_path = os.path.join(root, file)
                        print(f"DEBUG: Found file at alternative path: {file_path}")
                        break
            
            if not os.path.exists(file_path):
                return jsonify({'error': 'File not found on server. Please re-upload the file.'}), 404
        
        # Use the current stored `name` for download (this is the visible/current filename)
        # Fallback to `original_name` if `name` is missing
        download_name = file_record.get('name') or file_record.get('original_name')
        
        print(f"DEBUG: Sending file: {file_path} as {download_name}")
        return send_file(
            file_path,
            as_attachment=True,
            download_name=download_name
        )
        
    except Exception as e:
        print(f"Download error: {e}")
        return jsonify({'error': f'Download failed: {str(e)}'}), 500
    

# New route for file preview
# Visual file preview route - converts everything to PDF for exact visual representation
@app.route('/api/file-preview/<int:file_id>', methods=['GET'])
def file_preview(file_id):
    try:
        file_record = DMSDatabase.get_file_by_id(file_id)
        if not file_record:
            return jsonify({'error': 'File not found'}), 404
        
        # file_path in DB is stored as a hash. Search the upload folder for the actual file.
        file_path = file_record.get('file_path')
        actual_file_path = None
        
        # Try to find the real file by searching for the filename in the upload folder
        if not file_path or not os.path.exists(file_path):
            upload_folder = app.config.get('UPLOAD_FOLDER')
            if upload_folder and os.path.exists(upload_folder):
                target_names = [file_record.get('name'), file_record.get('original_name')]
                for root, dirs, files in os.walk(upload_folder):
                    for f in files:
                        if f in target_names:
                            actual_file_path = os.path.join(root, f)
                            break
                    if actual_file_path:
                        break
        else:
            actual_file_path = file_path
        
        if not actual_file_path or not os.path.exists(actual_file_path):
            return jsonify({'error': 'File not found on server'}), 404

        file_type = file_record['type'].lower()
        file_name = file_record.get('original_name') or file_record.get('name')
        
        print(f"DEBUG: Visual preview requested for {file_name} (type: {file_type})")
        print(f"DEBUG: Actual file path resolved: {actual_file_path}")

        # For PDFs - serve directly inline (perfect visual)
        if file_type == 'pdf':
            return send_file(actual_file_path, mimetype='application/pdf', as_attachment=False)
        
        # For images - convert to PDF for consistent preview
        elif file_type in ['png', 'jpg', 'jpeg', 'gif', 'bmp']:
            try:
                pdf_path = convert_image_to_pdf(actual_file_path)
                if pdf_path and os.path.exists(pdf_path):
                    return send_file(pdf_path, mimetype='application/pdf', as_attachment=False)
                else:
                    # Fallback: serve image directly inline
                    # Normalize common image mimetypes
                    image_mimetypes = {
                        'jpg': 'image/jpeg',
                        'jpeg': 'image/jpeg',
                        'png': 'image/png',
                        'gif': 'image/gif',
                        'bmp': 'image/bmp'
                    }
                    mimetype = image_mimetypes.get(file_type, f'image/{file_type}')
                    return send_file(actual_file_path, mimetype=mimetype, as_attachment=False)
            except Exception as e:
                print(f"Image to PDF conversion error: {e}")
                image_mimetypes = {
                    'jpg': 'image/jpeg',
                    'jpeg': 'image/jpeg',
                    'png': 'image/png',
                    'gif': 'image/gif',
                    'bmp': 'image/bmp'
                }
                mimetype = image_mimetypes.get(file_type, f'image/{file_type}')
                return send_file(actual_file_path, mimetype=mimetype, as_attachment=False)
        
        # For Word documents - convert to PDF for exact visual
        elif file_type in ['doc', 'docx']:
            try:
                pdf_path = convert_word_to_pdf_visual(actual_file_path, file_type)
                if pdf_path and os.path.exists(pdf_path):
                    return send_file(pdf_path, mimetype='application/pdf', as_attachment=False)
                else:
                    return create_fallback_preview(actual_file_path, file_type, "Word Document")
            except Exception as e:
                print(f"Word to PDF conversion error: {e}")
                return create_fallback_preview(actual_file_path, file_type, "Word Document")
        
        # For Excel files - convert to PDF for exact visual
        elif file_type in ['xls', 'xlsx']:
            try:
                pdf_path = convert_excel_to_pdf_visual(actual_file_path, file_type)
                if pdf_path and os.path.exists(pdf_path):
                    return send_file(pdf_path, mimetype='application/pdf', as_attachment=False)
                else:
                    return create_fallback_preview(actual_file_path, file_type, "Excel Spreadsheet")
            except Exception as e:
                print(f"Excel to PDF conversion error: {e}")
                return create_fallback_preview(actual_file_path, file_type, "Excel Spreadsheet")
        
        # For PowerPoint files - convert to PDF for exact visual
        elif file_type in ['ppt', 'pptx']:
            try:
                pdf_path = convert_powerpoint_to_pdf_visual(actual_file_path, file_type)
                if pdf_path and os.path.exists(pdf_path):
                    return send_file(pdf_path, mimetype='application/pdf', as_attachment=False)
                else:
                    return create_fallback_preview(actual_file_path, file_type, "PowerPoint Presentation")
            except Exception as e:
                print(f"PowerPoint to PDF conversion error: {e}")
                return create_fallback_preview(actual_file_path, file_type, "PowerPoint Presentation")
        
        # For text files - create formatted PDF
        elif file_type == 'txt':
            try:
                pdf_path = convert_text_to_pdf(actual_file_path)
                if pdf_path and os.path.exists(pdf_path):
                    return send_file(pdf_path, mimetype='application/pdf', as_attachment=False)
                else:
                    return create_fallback_preview(actual_file_path, file_type, "Text File")
            except Exception as e:
                print(f"Text to PDF conversion error: {e}")
                return create_fallback_preview(actual_file_path, file_type, "Text File")
        
        # For ZIP files - create informative PDF
        elif file_type == 'zip':
            try:
                pdf_path = convert_zip_to_pdf(actual_file_path)
                if pdf_path and os.path.exists(pdf_path):
                    return send_file(pdf_path, mimetype='application/pdf', as_attachment=False)
                else:
                    return create_fallback_preview(actual_file_path, file_type, "ZIP Archive")
            except Exception as e:
                print(f"ZIP to PDF conversion error: {e}")
                return create_fallback_preview(actual_file_path, file_type, "ZIP Archive")
        
        # Unsupported file types
        else:
            return create_unsupported_preview(file_type)
            
    except Exception as e:
        return jsonify({'error': f'Preview failed: {str(e)}'}), 500
    
import tempfile
import os
from PIL import Image
import zipfile

def convert_image_to_pdf(image_path):
    """Convert image to PDF for perfect visual preview"""
    try:
        pdf_path = tempfile.NamedTemporaryFile(delete=False, suffix='.pdf').name
        
        # Open image and convert to PDF
        with Image.open(image_path) as img:
            # Convert to RGB if necessary (for JPEG)
            if img.mode in ('RGBA', 'P'):
                img = img.convert('RGB')
            
            # Save as PDF
            img.save(pdf_path, 'PDF', resolution=100.0)
        
        print(f"DEBUG: Image converted to PDF: {pdf_path}")
        return pdf_path
        
    except Exception as e:
        print(f"Image to PDF conversion error: {e}")
        return None

def convert_word_to_pdf_visual(file_path, file_type):
    """Convert Word documents to PDF using LibreOffice (or fallback to COM)"""
    try:
        pdf_path = tempfile.NamedTemporaryFile(delete=False, suffix='.pdf').name
        # First try LibreOffice (most reliable)
        try:
            import subprocess, shutil
            output_dir = os.path.dirname(pdf_path)
            os.makedirs(output_dir, exist_ok=True)

            # Try common LibreOffice locations and PATH
            soffice_candidates = [
                r"C:\Program Files\LibreOffice\program\soffice.exe",
                r"C:\Program Files (x86)\LibreOffice\program\soffice.exe",
            ]
            soffice_path = None
            for candidate in soffice_candidates:
                if os.path.exists(candidate):
                    soffice_path = candidate
                    break

            if not soffice_path:
                soffice_path = shutil.which('soffice')

            if soffice_path:
                cmd = [soffice_path, "--headless", "--convert-to", "pdf", "--outdir", output_dir, file_path]
                result = subprocess.run(cmd, capture_output=True, timeout=60)

                base_name = os.path.splitext(os.path.basename(file_path))[0]
                libreoffice_pdf = os.path.join(output_dir, base_name + ".pdf")

                if result.returncode == 0 and os.path.exists(libreoffice_pdf):
                    os.rename(libreoffice_pdf, pdf_path)
                    print(f"DEBUG: Word document converted to PDF via LibreOffice: {pdf_path}")
                    return pdf_path
                else:
                    print("DEBUG: LibreOffice returned non-zero or PDF not found")
                    print(f"DEBUG: soffice_path={soffice_path}, returncode={getattr(result, 'returncode', None)}")
                    print(f"DEBUG: stdout={getattr(result, 'stdout', b'').decode('utf-8', 'ignore')}")
                    print(f"DEBUG: stderr={getattr(result, 'stderr', b'').decode('utf-8', 'ignore')}")
            else:
                print("DEBUG: LibreOffice 'soffice' binary not found on system PATH or common locations")
        except Exception as lo_error:
            print(f"LibreOffice conversion failed: {lo_error}")
        
        # Fallback to Windows COM if LibreOffice not available
        try:
            import comtypes.client
            word = comtypes.client.CreateObject("Word.Application")
            word.Visible = False

            # Open document (read-only recommended)
            doc = word.Documents.Open(os.path.abspath(file_path), ReadOnly=1)
            doc.SaveAs(os.path.abspath(pdf_path), FileFormat=17)  # 17 = wdFormatPDF
            doc.Close()
            word.Quit()
            print(f"DEBUG: Word document converted to PDF via COM: {pdf_path}")
            return pdf_path
        except Exception as com_error:
            print(f"COM conversion also failed: {com_error}")
            return None
            
    except Exception as e:
        print(f"Word to PDF conversion error: {e}")
        return None

def convert_excel_to_pdf_visual(file_path, file_type):
    """Convert Excel files to PDF using LibreOffice (or fallback to COM)"""
    try:
        pdf_path = tempfile.NamedTemporaryFile(delete=False, suffix='.pdf').name
        # First try LibreOffice
        try:
            import subprocess, shutil
            output_dir = os.path.dirname(pdf_path)
            os.makedirs(output_dir, exist_ok=True)

            soffice_candidates = [
                r"C:\Program Files\LibreOffice\program\soffice.exe",
                r"C:\Program Files (x86)\LibreOffice\program\soffice.exe",
            ]
            soffice_path = None
            for candidate in soffice_candidates:
                if os.path.exists(candidate):
                    soffice_path = candidate
                    break
            if not soffice_path:
                soffice_path = shutil.which('soffice')

            if soffice_path:
                cmd = [soffice_path, "--headless", "--convert-to", "pdf", "--outdir", output_dir, file_path]
                result = subprocess.run(cmd, capture_output=True, timeout=60)

                base_name = os.path.splitext(os.path.basename(file_path))[0]
                libreoffice_pdf = os.path.join(output_dir, base_name + ".pdf")

                if result.returncode == 0 and os.path.exists(libreoffice_pdf):
                    os.rename(libreoffice_pdf, pdf_path)
                    print(f"DEBUG: Excel file converted to PDF via LibreOffice: {pdf_path}")
                    return pdf_path
                else:
                    print("DEBUG: LibreOffice returned non-zero or PDF not found for Excel")
                    print(f"DEBUG: stdout={getattr(result, 'stdout', b'').decode('utf-8', 'ignore')}")
                    print(f"DEBUG: stderr={getattr(result, 'stderr', b'').decode('utf-8', 'ignore')}")
            else:
                print("DEBUG: LibreOffice 'soffice' binary not found on system PATH or common locations")
        except Exception as lo_error:
            print(f"LibreOffice conversion failed: {lo_error}")
        
        # Fallback to Windows COM
        try:
            import comtypes.client

            excel = comtypes.client.CreateObject("Excel.Application")
            excel.Visible = False

            workbook = excel.Workbooks.Open(os.path.abspath(file_path))
            workbook.ExportAsFixedFormat(0, os.path.abspath(pdf_path))  # 0 = xlTypePDF
            workbook.Close()
            excel.Quit()

            print(f"DEBUG: Excel workbook converted to PDF via COM: {pdf_path}")
            return pdf_path
        except Exception as com_error:
            print(f"COM conversion also failed: {com_error}")
            return None
            
    except Exception as e:
        print(f"Excel to PDF conversion error: {e}")
        return None

def convert_powerpoint_to_pdf_visual(file_path, file_type):
    """Convert PowerPoint to PDF using LibreOffice (or fallback to COM)"""
    try:
        pdf_path = tempfile.NamedTemporaryFile(delete=False, suffix='.pdf').name
        # First try LibreOffice
        try:
            import subprocess, shutil
            output_dir = os.path.dirname(pdf_path)
            os.makedirs(output_dir, exist_ok=True)

            soffice_candidates = [
                r"C:\Program Files\LibreOffice\program\soffice.exe",
                r"C:\Program Files (x86)\LibreOffice\program\soffice.exe",
            ]
            soffice_path = None
            for candidate in soffice_candidates:
                if os.path.exists(candidate):
                    soffice_path = candidate
                    break
            if not soffice_path:
                soffice_path = shutil.which('soffice')

            if soffice_path:
                cmd = [soffice_path, "--headless", "--convert-to", "pdf", "--outdir", output_dir, file_path]
                result = subprocess.run(cmd, capture_output=True, timeout=60)

                base_name = os.path.splitext(os.path.basename(file_path))[0]
                libreoffice_pdf = os.path.join(output_dir, base_name + ".pdf")

                if result.returncode == 0 and os.path.exists(libreoffice_pdf):
                    os.rename(libreoffice_pdf, pdf_path)
                    print(f"DEBUG: PowerPoint file converted to PDF via LibreOffice: {pdf_path}")
                    return pdf_path
                else:
                    print("DEBUG: LibreOffice returned non-zero or PDF not found for PowerPoint")
                    print(f"DEBUG: stdout={getattr(result, 'stdout', b'').decode('utf-8', 'ignore')}")
                    print(f"DEBUG: stderr={getattr(result, 'stderr', b'').decode('utf-8', 'ignore')}")
            else:
                print("DEBUG: LibreOffice 'soffice' binary not found on system PATH or common locations")
        except Exception as lo_error:
            print(f"LibreOffice conversion failed: {lo_error}")
        
        # Fallback to Windows COM
        try:
            import comtypes.client

            powerpoint = comtypes.client.CreateObject("PowerPoint.Application")
            powerpoint.Visible = False

            presentation = powerpoint.Presentations.Open(os.path.abspath(file_path), WithWindow=False)
            presentation.SaveAs(os.path.abspath(pdf_path), 32)  # 32 = ppSaveAsPDF
            presentation.Close()
            powerpoint.Quit()

            print(f"DEBUG: PowerPoint file converted to PDF via COM: {pdf_path}")
            return pdf_path
        except Exception as com_error:
            print(f"COM conversion also failed: {com_error}")
            return None
            
    except Exception as e:
        print(f"PowerPoint to PDF conversion error: {e}")
        return None

def convert_text_to_pdf(file_path):
    """Convert text file to formatted PDF"""
    try:
        pdf_path = tempfile.NamedTemporaryFile(delete=False, suffix='.pdf').name
        
        # Read text content
        with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
        
        # Create PDF with formatted text
        from reportlab.pdfgen import canvas
        from reportlab.lib.pagesizes import letter
        from reportlab.lib.units import inch
        
        c = canvas.Canvas(pdf_path, pagesize=letter)
        c.setFont("Courier", 10)  # Monospace font for text files
        
        # Simple text wrapping
        lines = content.split('\n')
        y_position = 750
        line_height = 12
        
        for line in lines[:100]:  # Limit to first 100 lines
            if y_position < 50:
                c.showPage()
                c.setFont("Courier", 10)
                y_position = 750
            
            # Truncate long lines
            if len(line) > 120:
                line = line[:117] + "..."
            
            c.drawString(50, y_position, line)
            y_position -= line_height
        
        c.save()
        print(f"DEBUG: Text file converted to PDF: {pdf_path}")
        return pdf_path
        
    except Exception as e:
        print(f"Text to PDF conversion error: {e}")
        return None

def convert_zip_to_pdf(file_path):
    """Create PDF showing ZIP file contents"""
    try:
        pdf_path = tempfile.NamedTemporaryFile(delete=False, suffix='.pdf').name
        
        from reportlab.pdfgen import canvas
        from reportlab.lib.pagesizes import letter
        
        c = canvas.Canvas(pdf_path, pagesize=letter)
        c.setFont("Helvetica-Bold", 16)
        c.drawString(50, 750, "ZIP File Contents")
        
        c.setFont("Helvetica", 10)
        y_position = 720
        
        # List files in ZIP
        with zipfile.ZipFile(file_path, 'r') as zip_ref:
            file_list = zip_ref.namelist()
        
        for i, file_name in enumerate(file_list[:50]):  # First 50 files
            if y_position < 50:
                c.showPage()
                c.setFont("Helvetica", 10)
                y_position = 750
            
            c.drawString(70, y_position, f"{i+1}. {file_name}")
            y_position -= 15
        
        # Add summary
        if len(file_list) > 50:
            y_position -= 10
            c.drawString(70, y_position, f"... and {len(file_list) - 50} more files")
        
        c.save()
        print(f"DEBUG: ZIP file converted to PDF: {pdf_path}")
        return pdf_path
        
    except Exception as e:
        print(f"ZIP to PDF conversion error: {e}")
        return None

def create_simple_pdf_from_content(file_path, file_type):
    """Create a simple PDF when COM conversion fails"""
    try:
        pdf_path = tempfile.NamedTemporaryFile(delete=False, suffix='.pdf').name
        
        from reportlab.pdfgen import canvas
        from reportlab.lib.pagesizes import letter
        
        c = canvas.Canvas(pdf_path, pagesize=letter)
        
        # Header
        c.setFont("Helvetica-Bold", 16)
        c.drawString(50, 750, f"{file_type} Preview")
        c.setFont("Helvetica", 10)
        c.drawString(50, 730, f"File: {os.path.basename(file_path)}")
        
        # Content message
        c.drawString(50, 700, "This file is being displayed in preview mode.")
        c.drawString(50, 680, "For exact visual representation, please download the file.")
        
        # File info
        file_size = os.path.getsize(file_path)
        c.drawString(50, 650, f"File size: {file_size} bytes")
        
        c.save()
        return pdf_path
        
    except Exception as e:
        print(f"Simple PDF creation error: {e}")
        return None

def create_fallback_preview(file_path, file_type, description):
    """Create fallback PDF preview"""
    pdf_path = create_simple_pdf_from_content(file_path, description)
    if pdf_path and os.path.exists(pdf_path):
        return send_file(pdf_path, mimetype='application/pdf', as_attachment=False)
    else:
        return jsonify({
            'type': 'unsupported',
            'message': f'Preview not available for {file_type.upper()} files'
        })

def create_unsupported_preview(file_type):
    """Create PDF for unsupported file types"""
    try:
        pdf_path = tempfile.NamedTemporaryFile(delete=False, suffix='.pdf').name
        
        from reportlab.pdfgen import canvas
        from reportlab.lib.pagesizes import letter
        
        c = canvas.Canvas(pdf_path, pagesize=letter)
        c.setFont("Helvetica-Bold", 16)
        c.drawString(50, 750, "File Preview Not Available")
        c.setFont("Helvetica", 12)
        c.drawString(50, 720, f"File type: {file_type.upper()}")
        c.drawString(50, 700, "This file type cannot be previewed in the system.")
        c.drawString(50, 680, "Please download the file to view its contents.")
        
        c.save()
        return send_file(pdf_path, mimetype='application/pdf', as_attachment=False)
        
    except Exception as e:
        return jsonify({
            'type': 'unsupported',
            'message': f'Preview not available for {file_type.upper()} files'
        })

class DMSDatabase:
    # User operations
    @staticmethod
    def get_user_by_id(user_id):
        query = "SELECT * FROM users WHERE user_id = %s"
        return DatabaseConfig.execute_query(query, (user_id,), fetch_one=True)

    @staticmethod
    def get_user_by_email(email):
        query = "SELECT * FROM users WHERE email = %s"
        return DatabaseConfig.execute_query(query, (email,), fetch_one=True)

    @staticmethod
    def get_all_users():
        query = "SELECT u.*, d.name as department_name FROM users u LEFT JOIN departments d ON u.department_id = d.department_id"
        return DatabaseConfig.execute_query(query, fetch=True)

    @staticmethod
    def create_user(name, email, password, role, department_id):
        # Get the maximum existing user_id and increment by 1
        max_id_query = "SELECT MAX(user_id) as max_id FROM users"
        result = DatabaseConfig.execute_query(max_id_query, fetch_one=True)
        next_id = (result['max_id'] + 1) if result['max_id'] else 1
        
        query = """INSERT INTO users (user_id, name, email, password, role, department_id) 
                VALUES (%s, %s, %s, %s, %s, %s)"""
        return DatabaseConfig.execute_query(query, (next_id, name, email, password, role, department_id), lastrowid=True)

    @staticmethod
    def update_user(user_id, name, email, role, department_id, status, profile_image=None, password=None):
        """Update user information - including password if provided"""
        try:
            connection = DatabaseConfig.get_connection()
            cursor = connection.cursor()
            
            if password:
                # Update including password
                query = """UPDATE users SET name=%s, email=%s, role=%s, department_id=%s, 
                        status=%s, profile_image=%s, password=%s, updated_at=NOW() 
                        WHERE user_id=%s"""
                params = (name, email, role, department_id, status, profile_image, password, user_id)
            else:
                # Update without password
                query = """UPDATE users SET name=%s, email=%s, role=%s, department_id=%s, 
                        status=%s, profile_image=%s, updated_at=NOW() 
                        WHERE user_id=%s"""
                params = (name, email, role, department_id, status, profile_image, user_id)
            
            cursor.execute(query, params)
            connection.commit()
            affected_rows = cursor.rowcount
            cursor.close()
            connection.close()
            
            print(f"DEBUG: Updated user {user_id}, affected rows: {affected_rows}")
            return affected_rows > 0
            
        except Exception as e:
            print(f"Error updating user: {e}")
            if 'connection' in locals():
                connection.rollback()
            return False
        
    @staticmethod
    def archive_user(user_id, reason, notes=None):
        query = """UPDATE users SET status='archived', archive_reason=%s, archive_notes=%s, archived_at=NOW() 
                   WHERE user_id=%s"""
        return DatabaseConfig.execute_query(query, (reason, notes, user_id))
    
    @staticmethod
    def delete_user(user_id):
        try:
            # In a production system, you might want to:
            # 1. Check if user has any files or dependencies
            # 2. Use soft delete instead of hard delete
            # 3. Handle related records in other tables
            
            query = "DELETE FROM users WHERE user_id = %s"
            connection = DatabaseConfig.get_connection()
            cursor = connection.cursor()
            cursor.execute(query, (user_id,))
            connection.commit()
            cursor.close()
            connection.close()
            return True
        except Exception as e:
            print(f"Error deleting user: {e}")
            return False

    # File operations
    @staticmethod
    def get_all_files():
        query = """SELECT f.*, u.name as owner_name, c.name as category_name 
                   FROM files f 
                   LEFT JOIN users u ON f.user_id = u.user_id 
                   LEFT JOIN categories c ON f.category_id = c.category_id 
                   WHERE f.status = 'active'"""
        return DatabaseConfig.execute_query(query, fetch=True)

    @staticmethod
    def get_active_files_by_user(user_id):
        query = "SELECT * FROM files WHERE user_id = %s AND status = 'active'"
        return DatabaseConfig.execute_query(query, (user_id,), fetch=True)

    @staticmethod
    def get_file_by_id(file_id):
        query = "SELECT * FROM files WHERE file_id = %s"
        return DatabaseConfig.execute_query(query, (file_id,), fetch_one=True)

    @staticmethod
    def create_file(file_data):
        query = """INSERT INTO files (name, original_name, size, type, user_id, workspace_id, category_id, 
                document_type, classification_confidence, classification_error, text_sample, 
                shared, document_type_category_id, file_path) 
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""
        params = (
            file_data['name'], file_data['original_name'], file_data['size'], file_data['type'],
            file_data['user_id'], file_data.get('workspace_id'), file_data.get('category_id'),
            file_data.get('document_type'), file_data.get('classification_confidence'),
            file_data.get('classification_error'), file_data.get('text_sample'),
            file_data.get('shared', False), file_data.get('document_type_category_id'),
            file_data.get('file_path')  
        )
        return DatabaseConfig.execute_query(query, params, lastrowid=True)

    
    @staticmethod
    def update_file(file_id, updates):
        try:
            set_clause = ", ".join([f"{key}=%s" for key in updates.keys()])
            query = f"UPDATE files SET {set_clause} WHERE file_id=%s"
            params = list(updates.values()) + [file_id]
            return DatabaseConfig.execute_query(query, params)
        except Exception as e:
            print(f"Error updating file: {e}")
            return None

    @staticmethod
    def delete_file(file_id):
        try:
            # First get the file path
            file_record = DMSDatabase.get_file_by_id(file_id)
            if file_record and file_record.get('file_path'):
                # Delete the physical file
                try:
                    if os.path.exists(file_record['file_path']):
                        os.remove(file_record['file_path'])
                except Exception as e:
                    print(f"Warning: Could not delete physical file: {e}")
            
            # Then update the database status
            query = "UPDATE files SET status='deleted' WHERE file_id=%s"
            return DatabaseConfig.execute_query(query, (file_id,))
        except Exception as e:
            print(f"Error deleting file: {e}")
            return None

    @staticmethod
    def archive_file(file_id):
        try:
            print(f"DEBUG: Starting archive process for file {file_id}")
            
            # First get the file details
            file_record = DMSDatabase.get_file_by_id(file_id)
            if not file_record:
                print(f"DEBUG: File {file_id} not found in database")
                return False
            
            print(f"DEBUG: Found file: {file_record['name']} (current status: {file_record.get('status', 'unknown')})")
            
            # If file is already archived, return True
            if file_record.get('status') == 'archived':
                print(f"DEBUG: File {file_id} is already archived")
                return True
            
            # Generate unique name for archive
            original_name = file_record['original_name']
            user_id = file_record['user_id']
            
            # Get unique filename for archive
            base_name = original_name.rsplit('.', 1)[0]
            extension = original_name.rsplit('.', 1)[1].lower()
            
            query = "SELECT name FROM files WHERE user_id = %s AND status = 'archived' AND name LIKE %s"
            connection = DatabaseConfig.get_connection()
            cursor = connection.cursor(dictionary=True)
            
            like_pattern = f"{base_name}%.{extension}"
            cursor.execute(query, (user_id, like_pattern))
            existing_files = cursor.fetchall()
            cursor.close()
            connection.close()
            
            final_filename = original_name
            counter = 1
            
            existing_names = [f['name'] for f in existing_files]
            while final_filename in existing_names:
                final_filename = f"{base_name} ({counter}).{extension}"
                counter += 1
            
            print(f"DEBUG: Updating file {file_id} to archived with name: {final_filename}")
            
            # Update status and name for archive - USE DIRECT DATABASE CONNECTION
            query = "UPDATE files SET status='archived', name=%s WHERE file_id=%s"
            connection = DatabaseConfig.get_connection()
            cursor = connection.cursor()
            cursor.execute(query, (final_filename, file_id))
            affected_rows = cursor.rowcount
            connection.commit()
            cursor.close()
            connection.close()
            
            print(f"DEBUG: Archive query affected {affected_rows} rows")
            
            # Verify the update worked by checking the file status
            updated_file = DMSDatabase.get_file_by_id(file_id)
            if updated_file and updated_file.get('status') == 'archived':
                print(f"DEBUG: File {file_id} successfully archived - status confirmed")
                return True
            else:
                print(f"DEBUG: File {file_id} archive failed - status not updated")
                return False
                
        except Exception as e:
            print(f"Error in archive_file for file {file_id}: {str(e)}")
            return False
        
    @staticmethod
    def is_file_in_workspace(file_id, workspace_id):
        """Check if file is already in a specific workspace"""
        try:
            query = "SELECT file_id FROM files WHERE file_id = %s AND workspace_id = %s AND status = 'active'"
            result = DatabaseConfig.execute_query(query, (file_id, workspace_id), fetch_one=True)
            return result is not None
        except Exception as e:
            print(f"Error checking file in workspace: {e}")
            return False

# ========== WORKSPACE METHODS - COMPLETE REPLACEMENT ==========

    @staticmethod
    def add_file_to_workspace(file_id, workspace_id):
        """Add file to a workspace (many-to-many relationship)"""
        try:
            print(f"🚀 DEBUG: Adding file {file_id} to workspace {workspace_id}")
            
            # Check if relationship already exists
            check_query = "SELECT * FROM file_workspaces WHERE file_id = %s AND workspace_id = %s"
            existing = DatabaseConfig.execute_query(check_query, (file_id, workspace_id), fetch_one=True)
            
            if existing:
                print(f"✅ DEBUG: File {file_id} already in workspace {workspace_id}")
                return True
                
            # Add new relationship
            query = "INSERT INTO file_workspaces (file_id, workspace_id) VALUES (%s, %s)"
            result = DatabaseConfig.execute_query(query, (file_id, workspace_id))
            print(f"✅ DEBUG: Added file {file_id} to workspace {workspace_id}: {result is not None}")
            return result is not None
        except Exception as e:
            print(f"❌ Error adding file to workspace: {e}")
            return False

    @staticmethod
    def remove_file_from_workspace(file_id, workspace_id):
        """Remove file from a specific workspace"""
        try:
            print(f"🚀 DEBUG: Removing file {file_id} from workspace {workspace_id}")
            query = "DELETE FROM file_workspaces WHERE file_id = %s AND workspace_id = %s"
            result = DatabaseConfig.execute_query(query, (file_id, workspace_id))
            print(f"✅ DEBUG: Removed file {file_id} from workspace {workspace_id}: {result is not None}")
            return result is not None
        except Exception as e:
            print(f"❌ Error removing file from workspace: {e}")
            return False

    @staticmethod
    def get_file_workspaces(file_id):
        """Get all workspaces where a file exists"""
        try:
            query = """SELECT w.workspace_id, w.name, w.description 
                    FROM workspaces w 
                    JOIN file_workspaces fw ON w.workspace_id = fw.workspace_id 
                    WHERE fw.file_id = %s"""
            workspaces = DatabaseConfig.execute_query(query, (file_id,), fetch=True) or []
            print(f"📁 DEBUG: File {file_id} is in {len(workspaces)} workspaces: {[w['workspace_id'] for w in workspaces]}")
            return workspaces
        except Exception as e:
            print(f"❌ Error getting file workspaces: {e}")
            return []

    @staticmethod
    def get_files_by_workspace(workspace_id):
        """Get all files in a specific workspace - USING NEW MANY-TO-MANY"""
        try:
            print(f"🚀 DEBUG: Getting files for workspace {workspace_id} from file_workspaces table")
            
            query = """SELECT f.*, u.name as owner_name 
                    FROM files f 
                    JOIN file_workspaces fw ON f.file_id = fw.file_id 
                    LEFT JOIN users u ON f.user_id = u.user_id 
                    WHERE fw.workspace_id = %s AND f.status = 'active'"""
            files = DatabaseConfig.execute_query(query, (workspace_id,), fetch=True) or []
            
            print(f"✅ DEBUG: Found {len(files)} files in workspace {workspace_id}")
            for file in files:
                print(f"   - File: {file['file_id']} - {file['name']}")
            
            return files
        except Exception as e:
            print(f"❌ Error getting files by workspace: {e}")
            return []

    @staticmethod
    def update_file_workspaces(file_id, workspace_ids):
        """Update all workspace relationships for a file"""
        try:
            print(f"🚀 DEBUG: Updating workspaces for file {file_id} to: {workspace_ids}")
            
            connection = DatabaseConfig.get_connection()
            cursor = connection.cursor()
            
            # Get current workspaces
            current_query = "SELECT workspace_id FROM file_workspaces WHERE file_id = %s"
            cursor.execute(current_query, (file_id,))
            current_workspaces = [row[0] for row in cursor.fetchall()]
            
            print(f"📊 DEBUG: Current workspaces: {current_workspaces}")
            print(f"📊 DEBUG: New workspaces: {workspace_ids}")
            
            # Workspaces to add
            to_add = [wid for wid in workspace_ids if wid not in current_workspaces]
            # Workspaces to remove  
            to_remove = [wid for wid in current_workspaces if wid not in workspace_ids]
            
            print(f"➕ DEBUG: To add: {to_add}")
            print(f"➖ DEBUG: To remove: {to_remove}")
            
            # Add new relationships
            added_count = 0
            for workspace_id in to_add:
                insert_query = "INSERT IGNORE INTO file_workspaces (file_id, workspace_id) VALUES (%s, %s)"
                cursor.execute(insert_query, (file_id, workspace_id))
                added_count += 1
                print(f"✅ DEBUG: Added file {file_id} to workspace {workspace_id}")
            
            # Remove old relationships
            removed_count = 0
            for workspace_id in to_remove:
                delete_query = "DELETE FROM file_workspaces WHERE file_id = %s AND workspace_id = %s"
                cursor.execute(delete_query, (file_id, workspace_id))
                removed_count += 1
                print(f"✅ DEBUG: Removed file {file_id} from workspace {workspace_id}")
            
            connection.commit()
            cursor.close()
            connection.close()
            
            print(f"🎉 DEBUG: Successfully updated - Added: {added_count}, Removed: {removed_count}")
            return True
        except Exception as e:
            print(f"❌ Error updating file workspaces: {e}")
            if 'connection' in locals():
                connection.rollback()
            return False

    @staticmethod
    def get_all_workspaces():
        """Get all workspaces with their files count"""
        try:
            query = """SELECT w.*, u.name as creator_name,
                            (SELECT COUNT(*) FROM file_workspaces fw WHERE fw.workspace_id = w.workspace_id) as file_count
                    FROM workspaces w 
                    LEFT JOIN users u ON w.user_id = u.user_id"""
            workspaces = DatabaseConfig.execute_query(query, fetch=True)
            
            print(f"🚀 DEBUG: Found {len(workspaces) if workspaces else 0} workspaces")
            
            # Add members to each workspace
            if workspaces:
                for workspace in workspaces:
                    members = DMSDatabase.get_workspace_members(workspace['workspace_id'])
                    workspace['members'] = [member['user_id'] for member in members] if members else []
                    print(f"👥 DEBUG: Workspace {workspace['workspace_id']} '{workspace['name']}' has {len(workspace['members'])} members and {workspace['file_count']} files")
            
            return workspaces
        except Exception as e:
            print(f"❌ Error getting workspaces: {e}")
            return []
        
    # Department operations
    @staticmethod
    def get_all_departments():
        query = "SELECT * FROM departments"
        return DatabaseConfig.execute_query(query, fetch=True)

    @staticmethod
    def create_department(name, user_id):
        # Get the maximum existing department_id and increment by 1
        max_id_query = "SELECT MAX(department_id) as max_id FROM departments"
        result = DatabaseConfig.execute_query(max_id_query, fetch_one=True)
        next_id = (result['max_id'] + 1) if result['max_id'] else 4001
        
        # Insert with explicit department_id
        query = "INSERT INTO departments (department_id, name, user_id) VALUES (%s, %s, %s)"
        DatabaseConfig.execute_query(query, (next_id, name, user_id))
        return next_id

    @staticmethod
    def delete_department(department_id):
        query = "DELETE FROM departments WHERE department_id = %s"
        return DatabaseConfig.execute_query(query, (department_id,))

    # Category operations
    @staticmethod
    def get_all_categories():
        query = "SELECT * FROM categories ORDER BY name"
        return DatabaseConfig.execute_query(query, fetch=True)

    @staticmethod
    def create_category(name, description=None, auto_created=False, is_unclassified=False):
        query = "INSERT INTO categories (name, description, auto_created, is_unclassified) VALUES (%s, %s, %s, %s)"
        return DatabaseConfig.execute_query(query, (name, description, auto_created, is_unclassified), lastrowid=True)

    @staticmethod
    def update_category(category_id, name, description):
        query = "UPDATE categories SET name=%s, description=%s WHERE category_id=%s"
        return DatabaseConfig.execute_query(query, (name, description, category_id))

    @staticmethod
    def get_category_by_name(name):
        query = "SELECT * FROM categories WHERE name = %s"
        return DatabaseConfig.execute_query(query, (name,), fetch_one=True)

    # Workspace operations
    @staticmethod
    def get_all_workspaces():
        try:
            query = """SELECT w.*, u.name as creator_name 
                    FROM workspaces w 
                    LEFT JOIN users u ON w.user_id = u.user_id"""
            workspaces = DatabaseConfig.execute_query(query, fetch=True)
            
            print(f"DEBUG: Found {len(workspaces) if workspaces else 0} workspaces")
            
            # Add members to each workspace
            if workspaces:
                for workspace in workspaces:
                    members = DMSDatabase.get_workspace_members(workspace['workspace_id'])
                    workspace['members'] = [member['user_id'] for member in members] if members else []
                    print(f"DEBUG: Workspace {workspace['workspace_id']} '{workspace['name']}' has members: {workspace['members']}")
            
            return workspaces
        except Exception as e:
            print(f"Error getting workspaces: {e}")
            return []

    @staticmethod
    def create_workspace(name, description, user_id, members):
        try:
            connection = DatabaseConfig.get_connection()
            cursor = connection.cursor(dictionary=True)
            
            # Get the maximum existing workspace_id
            cursor.execute("SELECT MAX(workspace_id) as max_id FROM workspaces")
            result = cursor.fetchone()
            next_id = (result['max_id'] + 1) if result and result['max_id'] else 2001
            
            print(f"DEBUG: Creating workspace with ID {next_id}, members: {members}")
            
            # Insert workspace
            query = "INSERT INTO workspaces (workspace_id, name, description, user_id) VALUES (%s, %s, %s, %s)"
            cursor.execute(query, (next_id, name, description, user_id))
            
            # Add members (ensure user_id is included and all are integers)
            all_members = set()
            if members:
                for member_id in members:
                    all_members.add(int(member_id))
            all_members.add(int(user_id))  # Always include creator
            
            print(f"DEBUG: Final members to add: {all_members}")
            
            for member_id in all_members:
                add_query = "INSERT IGNORE INTO workspace_members (workspace_id, user_id) VALUES (%s, %s)"
                cursor.execute(add_query, (next_id, member_id))
                print(f"DEBUG: Added member {member_id} to workspace {next_id}")
            
            connection.commit()
            cursor.close()
            connection.close()
            
            return next_id
        except Exception as e:
            print(f"Error creating workspace: {e}")
            if 'connection' in locals():
                connection.rollback()
            return None

    @staticmethod
    def add_workspace_member(workspace_id, user_id):
        query = "INSERT IGNORE INTO workspace_members (workspace_id, user_id) VALUES (%s, %s)"
        return DatabaseConfig.execute_query(query, (workspace_id, user_id))

    @staticmethod
    def get_workspace_members(workspace_id):
        try:
            query = """SELECT u.user_id, u.name, u.email 
                    FROM workspace_members wm 
                    JOIN users u ON wm.user_id = u.user_id 
                    WHERE wm.workspace_id = %s"""
            members = DatabaseConfig.execute_query(query, (workspace_id,), fetch=True)
            print(f"DEBUG: get_workspace_members for workspace {workspace_id} returned: {members}")
            return members
        except Exception as e:
            print(f"Error getting workspace members: {e}")
            return []
    
    # Add these methods to the DMSDatabase class

    @staticmethod
    def get_workspace_by_id(workspace_id):
        query = """SELECT w.*, u.name as creator_name 
                FROM workspaces w 
                LEFT JOIN users u ON w.user_id = u.user_id 
                WHERE w.workspace_id = %s"""
        return DatabaseConfig.execute_query(query, (workspace_id,), fetch_one=True)

    @staticmethod
    def update_workspace(workspace_id, name, description, members):
        try:
            connection = DatabaseConfig.get_connection()
            cursor = connection.cursor()
            
            # Update workspace basic info
            query = "UPDATE workspaces SET name=%s, description=%s, updated_at=NOW() WHERE workspace_id=%s"
            cursor.execute(query, (name, description, workspace_id))
            
            # Update members if provided
            if members is not None:
                print(f"DEBUG: Updating members for workspace {workspace_id}: {members}")
                
                # Clear current members
                delete_query = "DELETE FROM workspace_members WHERE workspace_id = %s"
                cursor.execute(delete_query, (workspace_id,))
                
                # Add new members (convert all to integers)
                for member_id in members:
                    member_id_int = int(member_id)
                    insert_query = "INSERT IGNORE INTO workspace_members (workspace_id, user_id) VALUES (%s, %s)"
                    cursor.execute(insert_query, (workspace_id, member_id_int))
                    print(f"DEBUG: Added member {member_id_int} to workspace {workspace_id}")
            
            connection.commit()
            cursor.close()
            connection.close()
            return True
        except Exception as e:
            print(f"Error updating workspace: {e}")
            if 'connection' in locals():
                connection.rollback()
            return False

    @staticmethod
    def delete_workspace(workspace_id):
        # First remove workspace members
        delete_members_query = "DELETE FROM workspace_members WHERE workspace_id = %s"
        DatabaseConfig.execute_query(delete_members_query, (workspace_id,))
        
        # Then delete the workspace
        query = "DELETE FROM workspaces WHERE workspace_id = %s"
        return DatabaseConfig.execute_query(query, (workspace_id,))

    @staticmethod
    def create_reset_code(email, code):
        query = "INSERT INTO reset_codes (email, code) VALUES (%s, %s)"
        return DatabaseConfig.execute_query(query, (email, code))

    # Settings operations
    @staticmethod
    def get_settings():
        query = "SELECT * FROM settings WHERE settings_id = 6001"
        return DatabaseConfig.execute_query(query, fetch_one=True)

    @staticmethod
    def update_settings(company, max_file_mb, allowed_types):
        query = "UPDATE settings SET company=%s, max_file_mb=%s, allowed_types=%s WHERE settings_id=6001"
        return DatabaseConfig.execute_query(query, (company, max_file_mb, allowed_types))

    # Activity log operations
    @staticmethod
    def log_activity(user_id, activity):
        query = "INSERT INTO activity_log (user_id, activity) VALUES (%s, %s)"
        return DatabaseConfig.execute_query(query, (user_id, activity))

    @staticmethod
    def get_recent_activities(limit=10):
        query = """SELECT al.*, u.name as user_name 
                   FROM activity_log al 
                   LEFT JOIN users u ON al.user_id = u.user_id 
                   ORDER BY al.timestamp DESC 
                   LIMIT %s"""
        return DatabaseConfig.execute_query(query, (limit,), fetch=True)

    # Session operations
    @staticmethod
    def create_session(user_id, email):
        query = "INSERT INTO sessions (user_id, email) VALUES (%s, %s)"
        return DatabaseConfig.execute_query(query, (user_id, email), lastrowid=True)

    @staticmethod
    def get_session(user_id):
        query = "SELECT * FROM sessions WHERE user_id = %s ORDER BY timestamp DESC LIMIT 1"
        return DatabaseConfig.execute_query(query, (user_id,), fetch_one=True)

# API Routes
@app.route('/api/classify-document', methods=['POST'])
def classify_document_api():
    try:
        if 'file' not in request.files:
            return jsonify({'error': 'No file provided'}), 400
        
        file = request.files['file']
        if file.filename == '':
            return jsonify({'error': 'No file selected'}), 400
        
        with tempfile.NamedTemporaryFile(delete=False, suffix=os.path.splitext(file.filename)[1]) as temp_file:
            file.save(temp_file.name)
            temp_path = temp_file.name
        
        try:
            extracted_text = extract_text_from_file(temp_path)
            
            if not extracted_text:
                return jsonify({
                    'documentType': 'Unclassified',
                    'confidence': 'Low',
                    'error': 'Could not extract text from file'
                }), 200
            
            document_type = classify_document(extracted_text)
            confidence = calculate_confidence(extracted_text, document_type)
            
            return jsonify({
                'documentType': document_type,
                'confidence': confidence,
                'textSample': extracted_text[:200] + '...' if len(extracted_text) > 200 else extracted_text
            })
            
        finally:
            if os.path.exists(temp_path):
                os.unlink(temp_path)
                
    except Exception as e:
        return jsonify({'error': f'Classification failed: {str(e)}'}), 500

def calculate_confidence(text, document_type):
    classification_rules = {
        "Resume / CV": ["resume", "curriculum vitae", "cv", "education", "work experience", "skills"],
        "Offer Letter / Employment Contract": ["offer of employment", "employment contract", "salary", "job title"],
        "Resignation Letter": ["resign", "resignation", "last day", "notice of resignation"],
        "Leave Request": ["leave request", "time off", "vacation", "sick leave"],
        "Employee Warning / Disciplinary Action": ["disciplinary action", "written warning", "misconduct"],
        "Performance Review": ["performance review", "evaluation", "goals", "feedback"]
    }
    
    if document_type == "Unclassified":
        return "Low"
    
    keywords = classification_rules.get(document_type, [])
    matches = sum(1 for keyword in keywords if keyword in text.lower())
    
    if matches >= 5:
        return "High"
    elif matches >= 3:
        return "Medium"
    else:
        return "Low"
def get_unique_filename_for_archive(original_name, user_id):
    """Generate unique filename when moving to archive"""
    # Removed: not used in current codebase. Keep placeholder for future archive-restore logic.
    return original_name

def get_unique_filename_for_restore(original_name, user_id):
    """Generate unique filename when restoring from archive"""
    # Removed: not used in current codebase. Keep placeholder for future archive-restore logic.
    return original_name

# Database API Routes

@app.route('/api/send-reset-email', methods=['POST'])
def send_reset_email():
    try:
        data = request.json
        email = data.get('email')
        code = data.get('code')
        
        if not email or not code:
            return jsonify({'success': False, 'error': 'Email and code are required'}), 400
        
        # Get user name for email
        user = DMSDatabase.get_user_by_email(email)
        user_name = user['name'] if user else 'User'
        
        # Send email directly using Python
        result = send_email_python(email, user_name, code)
        
        return jsonify(result)
            
    except Exception as e:
        print(f"Email sending error: {e}")
        return jsonify({'success': False, 'error': str(e)}), 500

def send_email_python(to_email, user_name, code):
    try:
        # Email configuration - USING YOUR GMAIL CREDENTIALS
        smtp_server = "smtp.gmail.com"
        smtp_port = 587
        sender_email = "plp.dmshr@gmail.com"
        sender_password = "thpn ttsr pxcw zchi"
        
        # Create message
        message = MIMEMultipart("alternative")
        message["Subject"] = "Password Reset Code - DMS Portal"
        message["From"] = "DOCUMENT MANAGEMENT SYSTEM <plp.dmshr@gmail.com>"
        message["To"] = to_email
        
        # Create HTML content
        html_content = f"""
        <!DOCTYPE html>
        <html>
        <head>
            <style>
                body {{ font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px; }}
                .container {{ max-width: 600px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }}
                .header {{ text-align: center; margin-bottom: 30px; }}
                .code {{ font-size: 32px; font-weight: bold; text-align: center; color: #3b82f6; margin: 20px 0; padding: 15px; background: #f8fafc; border-radius: 8px; letter-spacing: 5px; }}
                .footer {{ margin-top: 30px; text-align: center; color: #64748b; font-size: 14px; }}
            </style>
        </head>
        <body>
            <div class='container'>
                <div class='header'>
                    <h2>Password Reset Request</h2>
                </div>
                <p>Hello {user_name},</p>
                <p>You requested a password reset for your DMS Portal account. Use the verification code below:</p>
                <div class='code'>{code}</div>
                <p>This code will expire in 10 minutes.</p>
                <p>If you didn't request this reset, please ignore this email.</p>
                <div class='footer'>
                    <p>&copy; 2025 DMS Portal. All rights reserved.</p>
                </div>
            </div>
        </body>
        </html>
        """
        
        # Create plain text content
        text_content = f"""Password Reset Code: {code}
This code will expire in 10 minutes."""
        
        # Turn these into plain/html MIMEText objects
        part1 = MIMEText(text_content, "plain")
        part2 = MIMEText(html_content, "html")
        
        # Add HTML/plain-text parts to MIMEMultipart message
        message.attach(part1)
        message.attach(part2)
        
        # Create secure connection with server and send email
        server = smtplib.SMTP(smtp_server, smtp_port)
        server.starttls()  # Secure the connection
        server.login(sender_email, sender_password)
        server.sendmail(sender_email, to_email, message.as_string())
        server.quit()
        
        print(f"✅ Email sent successfully to {to_email}")
        return {'success': True, 'message': 'Email sent successfully'}
        
    except Exception as e:
        print(f"❌ Email error: {e}")
        return {'success': False, 'message': f'Email error: {str(e)}'}

@app.route('/api/debug/user/<int:user_id>', methods=['GET'])
def debug_user(user_id):
    """Debug endpoint to check user data"""
    user = DMSDatabase.get_user_by_id(user_id)
    if user:
        return jsonify({
            'success': True,
            'user': {
                'user_id': user['user_id'],
                'name': user['name'],
                'email': user['email'],
                'password': user['password'],  # This will show current password
                'role': user['role'],
                'status': user['status']
            }
        })
    else:
        return jsonify({'success': False, 'error': 'User not found'})
    
@app.route('/api/users', methods=['GET'])
def get_users():
    users = DMSDatabase.get_all_users()
    return jsonify(users or [])

@app.route('/api/users', methods=['POST'])
def create_user():
    data = request.json
    user_id = DMSDatabase.create_user(
        data['name'], data['email'], data['password'], 
        data['role'], data['department_id']
    )
    return jsonify({'user_id': user_id})

@app.route('/api/users/<int:user_id>', methods=['PUT'])
def update_user(user_id):
    try:
        data = request.json
        print(f"DEBUG: Updating user {user_id} with data: {data}")
        
        # Check if password is being updated
        password = data.get('password')
        
        result = DMSDatabase.update_user(
            user_id, 
            data['name'], 
            data['email'], 
            data['role'],
            data['department_id'], 
            data['status'], 
            data.get('profile_image'),
            password  # Pass password if provided
        )
        
        if result:
            return jsonify({'success': True, 'message': 'User updated successfully'})
        else:
            return jsonify({'success': False, 'error': 'Failed to update user'}), 500
            
    except Exception as e:
        print(f"Error in update_user API: {e}")
        return jsonify({'success': False, 'error': f'Failed to update user: {str(e)}'}), 500
    

@app.route('/api/users/<int:user_id>/archive', methods=['POST'])
def archive_user(user_id):
    data = request.json
    DMSDatabase.archive_user(user_id, data['reason'], data.get('notes'))
    return jsonify({'success': True})

@app.route('/api/files', methods=['GET'])
def get_files():
    # Return ALL files including archived for the frontend to handle filtering
    query = """SELECT f.*, u.name as owner_name, c.name as category_name 
               FROM files f 
               LEFT JOIN users u ON f.user_id = u.user_id 
               LEFT JOIN categories c ON f.category_id = c.category_id"""
    files = DatabaseConfig.execute_query(query, fetch=True)
    return jsonify(files or [])

@app.route('/api/all-files', methods=['GET'])
def get_all_files_including_archived():
    query = """SELECT f.*, u.name as owner_name, c.name as category_name 
               FROM files f 
               LEFT JOIN users u ON f.user_id = u.user_id 
               LEFT JOIN categories c ON f.category_id = c.category_id"""
    files = DatabaseConfig.execute_query(query, fetch=True)
    return jsonify(files or [])

@app.route('/api/files', methods=['POST'])
def create_file():
    data = request.json
    file_id = DMSDatabase.create_file(data)
    return jsonify({'file_id': file_id})

@app.route('/api/files/<int:file_id>', methods=['PUT'])
def update_file(file_id):
    try:
        data = request.json
        result = DMSDatabase.update_file(file_id, data)
        return jsonify({'success': True})
    except Exception as e:
        return jsonify({'error': f'Failed to update file: {str(e)}'}), 500

@app.route('/api/files/<int:file_id>/archive', methods=['POST'])
def archive_file_api(file_id):
    try:
        print(f"DEBUG: API - Archiving file {file_id}")
        
        # First check if file exists
        file_record = DMSDatabase.get_file_by_id(file_id)
        if not file_record:
            print(f"DEBUG: API - File {file_id} not found")
            return jsonify({'success': False, 'error': 'File not found'}), 404
        
        print(f"DEBUG: API - File found: {file_record['name']}")
        
        # Archive the file using the database method
        result = DMSDatabase.archive_file(file_id)
        
        if result:
            print(f"DEBUG: API - File {file_id} archived successfully")
            return jsonify({'success': True, 'message': 'File archived successfully'})
        else:
            print(f"DEBUG: API - Database method returned false for file {file_id}")
            # Double check if the file was actually archived
            updated_file = DMSDatabase.get_file_by_id(file_id)
            if updated_file and updated_file.get('status') == 'archived':
                print(f"DEBUG: API - File {file_id} is archived despite method returning false")
                return jsonify({'success': True, 'message': 'File archived successfully'})
            else:
                return jsonify({'success': False, 'error': 'Failed to archive file'}), 500
            
    except Exception as e:
        print(f"API Archive error for file {file_id}: {str(e)}")
        return jsonify({'success': False, 'error': f'Archive failed: {str(e)}'}), 500
    
@app.route('/api/files/<int:file_id>/update-workspaces', methods=['POST'])
def update_file_workspaces_api(file_id):
    """Update all workspace relationships for a file"""
    try:
        data = request.json
        workspace_ids = data.get('workspace_ids', [])
        
        print(f"DEBUG: API - Updating workspaces for file {file_id} to: {workspace_ids}")
        
        # Convert all workspace IDs to integers
        workspace_ids = [int(wid) for wid in workspace_ids]
        
        result = DMSDatabase.update_file_workspaces(file_id, workspace_ids)
        
        if result:
            return jsonify({
                'success': True, 
                'message': f'File updated in {len(workspace_ids)} workspace(s)',
                'workspace_ids': workspace_ids
            })
        else:
            return jsonify({'error': 'Failed to update file workspaces'}), 500
            
    except Exception as e:
        print(f"Error in update_file_workspaces_api: {e}")
        return jsonify({'error': f'Failed to update file workspaces: {str(e)}'}), 500
    
@app.route('/api/debug/file-status/<int:file_id>', methods=['GET'])
def debug_file_status(file_id):
    """Debug endpoint to check file status"""
    file_record = DMSDatabase.get_file_by_id(file_id)
    if file_record:
        return jsonify({
            'success': True,
            'file_id': file_id,
            'name': file_record.get('name'),
            'original_name': file_record.get('original_name'),
            'status': file_record.get('status', 'unknown'),
            'user_id': file_record.get('user_id')
        })
    else:
        return jsonify({'success': False, 'error': 'File not found'})

@app.route('/api/files/<int:file_id>', methods=['DELETE'])
def delete_file(file_id):
    DMSDatabase.delete_file(file_id)
    return jsonify({'success': True})

@app.route('/api/files/<int:file_id>/restore', methods=['POST'])
def restore_file(file_id):
    try:
        print(f"DEBUG: Restoring file {file_id}")
        
        # First get the file details
        file_record = DMSDatabase.get_file_by_id(file_id)
        if not file_record:
            print(f"DEBUG: File {file_id} not found")
            return jsonify({'success': False, 'error': 'File not found'}), 404
        
        # Generate unique name for restore
        original_name = file_record['original_name']
        user_id = file_record['user_id']
        
        # Get unique filename for active files
        base_name = original_name.rsplit('.', 1)[0]
        extension = original_name.rsplit('.', 1)[1].lower()
        
        query = "SELECT name FROM files WHERE user_id = %s AND status = 'active' AND name LIKE %s"
        connection = DatabaseConfig.get_connection()
        cursor = connection.cursor(dictionary=True)
        
        like_pattern = f"{base_name}%.{extension}"
        cursor.execute(query, (user_id, like_pattern))
        existing_files = cursor.fetchall()
        cursor.close()
        connection.close()
        
        final_filename = original_name
        counter = 1
        
        existing_names = [f['name'] for f in existing_files]
        while final_filename in existing_names:
            final_filename = f"{base_name} ({counter}).{extension}"
            counter += 1
        
        print(f"DEBUG: Updating file {file_id} to active with name: {final_filename}")
        
        # Update status and name for restore - USING DIRECT DATABASE CONNECTION
        query = "UPDATE files SET status='active', name=%s WHERE file_id=%s"
        connection = DatabaseConfig.get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (final_filename, file_id))
        affected_rows = cursor.rowcount
        connection.commit()
        cursor.close()
        connection.close()
        
        print(f"DEBUG: Restore query affected {affected_rows} rows")
        
        if affected_rows > 0:
            print(f"DEBUG: File {file_id} restored successfully as {final_filename}")
            return jsonify({'success': True, 'message': 'File restored successfully', 'new_name': final_filename})
        else:
            print(f"DEBUG: No rows affected when restoring file {file_id}")
            return jsonify({'success': False, 'error': 'Failed to restore file'}), 500
            
    except Exception as e:
        print(f"Restore error for file {file_id}: {e}")
        return jsonify({'success': False, 'error': f'Restore failed: {str(e)}'}), 500

@app.route('/api/debug/file/<int:file_id>', methods=['GET'])
def debug_file(file_id):
    """Debug endpoint to check file status"""
    file_record = DMSDatabase.get_file_by_id(file_id)
    if file_record:
        return jsonify({
            'success': True,
            'file': file_record,
            'status': file_record.get('status', 'unknown')
        })
    else:
        return jsonify({'success': False, 'error': 'File not found'})
    
@app.route('/api/debug/workspace/<int:workspace_id>/files-count', methods=['GET'])
def debug_workspace_files_count(workspace_id):
    """Debug endpoint to check files in workspace"""
    try:
        # Check old way
        old_query = "SELECT COUNT(*) as count FROM files WHERE workspace_id = %s AND status = 'active'"
        old_count = DatabaseConfig.execute_query(old_query, (workspace_id,), fetch_one=True)
        
        # Check new way
        new_query = "SELECT COUNT(*) as count FROM file_workspaces WHERE workspace_id = %s"
        new_count = DatabaseConfig.execute_query(new_query, (workspace_id,), fetch_one=True)
        
        # Get actual files
        files = DMSDatabase.get_files_by_workspace(workspace_id)
        
        return jsonify({
            'workspace_id': workspace_id,
            'old_way_count': old_count['count'] if old_count else 0,
            'new_way_count': new_count['count'] if new_count else 0,
            'actual_files_count': len(files),
            'files': [f['file_id'] for f in files]
        })
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/debug/file/<int:file_id>/workspaces', methods=['GET'])
def debug_file_workspaces(file_id):
    """Debug endpoint to check which workspaces a file is in"""
    try:
        # Check file_workspaces table
        query = "SELECT workspace_id FROM file_workspaces WHERE file_id = %s"
        workspaces = DatabaseConfig.execute_query(query, (file_id,), fetch=True) or []
        
        # Check files table
        file_record = DMSDatabase.get_file_by_id(file_id)
        
        return jsonify({
            'file_id': file_id,
            'in_file_workspaces': [w['workspace_id'] for w in workspaces],
            'files_table_workspace_id': file_record.get('workspace_id') if file_record else None,
            'file_status': file_record.get('status') if file_record else None
        })
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/files/<int:file_id>/workspaces', methods=['GET'])
def get_file_workspaces(file_id):
    """Get all workspaces where a file exists"""
    try:
        workspaces = DMSDatabase.get_file_workspaces(file_id)
        return jsonify(workspaces)
    except Exception as e:
        return jsonify({'error': f'Failed to get file workspaces: {str(e)}'}), 500

@app.route('/api/files/<int:file_id>/remove-from-workspace', methods=['POST'])
def remove_file_from_workspace_api(file_id):
    """Remove file from a specific workspace"""
    try:
        data = request.json
        workspace_id = data.get('workspace_id')
        
        if not workspace_id:
            return jsonify({'error': 'Workspace ID is required'}), 400
        
        result = DMSDatabase.remove_file_from_workspace(file_id, workspace_id)
        
        if result:
            return jsonify({'success': True, 'message': 'File removed from workspace'})
        else:
            return jsonify({'error': 'Failed to remove file from workspace'}), 500
            
    except Exception as e:
        return jsonify({'error': f'Failed to remove file from workspace: {str(e)}'}), 500

@app.route('/api/files/<int:file_id>/check-workspace/<int:workspace_id>', methods=['GET'])
def check_file_in_workspace(file_id, workspace_id):
    """Check if file is in a specific workspace"""
    try:
        is_in_workspace = DMSDatabase.is_file_in_workspace(file_id, workspace_id)
        return jsonify({'in_workspace': is_in_workspace})
    except Exception as e:
        return jsonify({'error': f'Failed to check file in workspace: {str(e)}'}), 500
    
@app.route('/api/departments', methods=['GET'])
def get_departments():
    departments = DMSDatabase.get_all_departments()
    return jsonify(departments or [])

@app.route('/api/departments', methods=['POST'])
def create_department():
    data = request.json
    department_id = DMSDatabase.create_department(data['name'], data['user_id'])
    return jsonify({'department_id': department_id})

@app.route('/api/departments/<int:department_id>', methods=['DELETE'])
def delete_department(department_id):
    DMSDatabase.delete_department(department_id)
    return jsonify({'success': True})

@app.route('/api/categories', methods=['GET'])
def get_categories():
    categories = DMSDatabase.get_all_categories()
    return jsonify(categories or [])

@app.route('/api/categories', methods=['POST'])
def create_category():
    data = request.json
    category_id = DMSDatabase.create_category(
        data['name'], data.get('description'), 
        data.get('auto_created', False), data.get('is_unclassified', False)
    )
    return jsonify({'category_id': category_id})

@app.route('/api/categories/<int:category_id>', methods=['PUT'])
def update_category(category_id):
    data = request.json
    DMSDatabase.update_category(category_id, data['name'], data.get('description'))
    return jsonify({'success': True})

@app.route('/api/workspaces', methods=['GET'])
def get_workspaces():
    workspaces = DMSDatabase.get_all_workspaces()
    return jsonify(workspaces or [])

@app.route('/api/workspaces', methods=['POST'])
def create_workspace():
    try:
        data = request.json
        print(f"DEBUG: Creating workspace with data: {data}")
        
        workspace_id = DMSDatabase.create_workspace(
            data['name'], 
            data.get('description'), 
            data['user_id'], 
            data.get('members', [])
        )
        
        if workspace_id:
            return jsonify({'success': True, 'workspace_id': workspace_id})
        else:
            return jsonify({'error': 'Failed to create workspace'}), 500
            
    except Exception as e:
        print(f"Error in create_workspace API: {e}")
        return jsonify({'error': f'Failed to create workspace: {str(e)}'}), 500

@app.route('/api/settings', methods=['GET'])
def get_settings():
    settings = DMSDatabase.get_settings()
    return jsonify(settings or {})

@app.route('/api/settings', methods=['PUT'])
def update_settings():
    data = request.json
    DMSDatabase.update_settings(data['company'], data['max_file_mb'], data['allowed_types'])
    return jsonify({'success': True})

@app.route('/api/activities', methods=['GET'])
def get_activities():
    activities = DMSDatabase.get_recent_activities()
    return jsonify(activities or [])

@app.route('/api/activities', methods=['POST'])
def log_activity():
    data = request.json
    DMSDatabase.log_activity(data['user_id'], data['activity'])
    return jsonify({'success': True})

@app.route('/api/sessions', methods=['POST'])
def create_session():
    data = request.json
    session_id = DMSDatabase.create_session(data['user_id'], data['email'])
    return jsonify({'session_id': session_id})

@app.route('/api/reset-codes', methods=['POST'])
def create_reset_code():
    data = request.json
    # In a real app, you'd store this in the database and send via email
    # For demo, we'll just return success
    return jsonify({'success': True, 'code': data.get('code')})

@app.route('/api/users/<int:user_id>', methods=['GET'])
def get_user(user_id):
    user = DMSDatabase.get_user_by_id(user_id)
    if user:
        return jsonify(user)
    return jsonify({'error': 'User not found'}), 404

@app.route('/api/workspaces/<int:workspace_id>', methods=['GET'])
def get_workspace(workspace_id):
    workspaces = DMSDatabase.get_all_workspaces()
    workspace = next((w for w in workspaces if w['workspace_id'] == workspace_id), None)
    if workspace:
        workspace['members'] = DMSDatabase.get_workspace_members(workspace_id)
        return jsonify(workspace)
    return jsonify({'error': 'Workspace not found'}), 404

@app.route('/api/workspaces/<int:workspace_id>', methods=['PUT'])
def update_workspace(workspace_id):
    try:
        data = request.json
        print(f"DEBUG: Updating workspace {workspace_id} with data: {data}")
        
        # Update workspace with members
        result = DMSDatabase.update_workspace(
            workspace_id, 
            data.get('name'), 
            data.get('description'),
            data.get('members')  # Pass members directly
        )
        
        if result:
            return jsonify({'success': True})
        else:
            return jsonify({'error': 'Failed to update workspace'}), 500
            
    except Exception as e:
        print(f"Error in update_workspace API: {e}")
        return jsonify({'error': f'Failed to update workspace: {str(e)}'}), 500
    
    
@app.route('/api/workspaces/<int:workspace_id>', methods=['DELETE'])
def delete_workspace(workspace_id):
    # Delete workspace logic would go here
    return jsonify({'success': True})

@app.route('/api/files/<int:file_id>/add-to-workspace', methods=['POST'])
def add_file_to_workspace_api(file_id):
    """Add file to a workspace"""
    try:
        data = request.json
        workspace_id = data.get('workspace_id')
        
        if not workspace_id:
            return jsonify({'error': 'Workspace ID is required'}), 400
        
        result = DMSDatabase.add_file_to_workspace(file_id, workspace_id)
        
        if result:
            return jsonify({'success': True, 'message': 'File added to workspace'})
        else:
            return jsonify({'error': 'Failed to add file to workspace'}), 500
            
    except Exception as e:
        return jsonify({'error': f'Failed to add file to workspace: {str(e)}'}), 500

@app.route('/api/workspaces/<int:workspace_id>/files', methods=['GET'])
def get_workspace_files_api(workspace_id):
    """Get all files in a workspace using the new many-to-many relationship"""
    try:
        print(f"🚀 DEBUG: API - Getting files for workspace {workspace_id}")
        files = DMSDatabase.get_files_by_workspace(workspace_id)
        return jsonify(files)
    except Exception as e:
        print(f"❌ Error getting workspace files: {e}")
        return jsonify({'error': f'Failed to get workspace files: {str(e)}'}), 500
    
    
@app.route('/api/users/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    # In a real application, you might want to soft delete or handle dependencies
    # For now, we'll do a hard delete
    try:
        # First check if user exists
        user = DMSDatabase.get_user_by_id(user_id)
        if not user:
            return jsonify({'error': 'User not found'}), 404
            
        # You might want to add additional checks here, like:
        # - Prevent deleting the last admin
        # - Handle user's files and other dependencies
        
        # For demo purposes, we'll do a hard delete
        query = "DELETE FROM users WHERE user_id = %s"
        connection = DatabaseConfig.get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (user_id,))
        connection.commit()
        cursor.close()
        connection.close()
        
        return jsonify({'success': True})
    except Exception as e:
        return jsonify({'error': f'Failed to delete user: {str(e)}'}), 500

@app.route('/api/health', methods=['GET'])
def health_check():
    return jsonify({'status': 'healthy', 'service': 'document-classifier'})

if __name__ == '__main__':
    app.run(debug=True, port=5000)
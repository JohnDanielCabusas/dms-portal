import os
import pdfplumber
import docx
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# ==============================================================================
# Extract Text
# ==============================================================================

def extract_text_from_file(file_path):
    text = ""
    if not os.path.exists(file_path):
        print(f"Error: File not found at '{file_path}'")
        return None

    if file_path.endswith('.pdf'):
        try:
            with pdfplumber.open(file_path) as pdf:
                for page in pdf.pages:
                    page_text = page.extract_text()
                    if page_text:
                        text += page_text
        except Exception as e:
            print(f"Could not read PDF file '{file_path}': {e}")
            return None
    elif file_path.endswith('.docx'):
        try:
            doc = docx.Document(file_path)
            for para in doc.paragraphs:
                text += para.text + "\n"
        except Exception as e:
            print(f"Could not read DOCX file '{file_path}': {e}")
            return None
    elif file_path.endswith('.txt'):
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                text = f.read()
        except Exception as e:
            print(f"Could not read TXT file '{file_path}': {e}")
            return None
    else:
        print(f"Unsupported file type: '{file_path}'")
        return None
        
    return text.lower()

# ==============================================================================
# (KEYWORD-BASED)
# ==============================================================================

def classify_document(text):

    try: 
        if not text or not text.strip():
            return "Unclassified (Empty)"

        classification_rules = {
            "Resume / CV": [
                "resume", "curriculum vitae", "cv", "education", "work experience", 
                "professional experience", "skills", "references", "objective", 
                "summary", "qualifications", "employment history"
            ],
            "Offer Letter / Employment Contract": [
                "offer of employment", "employment contract", "start date", "salary", 
                "job title", "terms and conditions", "probationary period", "compensation",
                "benefits", "offer letter", "position", "at-will employment"
            ],
            "Resignation Letter": [
                "resign", "resignation", "last day", "two weeks notice", "final day",
                "notice of resignation", "leaving the company", "effective date",
                "termination of employment"
            ],
            "Leave Request Form": [
                "leave request", "time off", "vacation", "sick leave", "dates of leave",
                "request for leave", "leave of absence", "annual leave", "personal leave",
                "maternity leave", "paternity leave", "medical leave"
            ],
            "Employee Warning / Disciplinary Action": [
                "disciplinary action", "written warning", "performance improvement",
                "misconduct", "violation", "corrective action", "policy violation",
                "disciplinary notice", "reprimand", "behavioral issues"
            ],
            "Performance Review": [
                "performance review", "evaluation", "goals", "objectives", "feedback",
                "self-assessment", "performance appraisal", "performance evaluation",
                "key performance indicators", "kpi", "performance goals",
                "strengths and weaknesses", "career development"
            ]
        }

        scores = {label: 0 for label in classification_rules}
        
        for label, keywords in classification_rules.items():
            for keyword in keywords:
                if keyword in text:
                    scores[label] += 1
        
        highest_score = 0
        best_label = "Unclassified"
        
        for label, score in scores.items():
            if score > highest_score:
                highest_score = score
                best_label = label
        
        if highest_score == 0:
            return "Unclassified"
                
        return best_label
    
    except Exception as e:
        logger.error(f"Classification error: {str(e)}")
        return "Unclassified (Error)"

# ==============================================================================
# MAIN EXECUTION
# ==============================================================================

if __name__ == "__main__":
    
    # file path
    file_to_test = "C:/Users/PLPASIG/Downloads/DMS/OCR file type/dummy-R.docx" 
    
    print("--- Document Classification System ---")
    print(f"\nProcessing file: '{file_to_test}'")
    
    extracted_text = extract_text_from_file(file_to_test)
    
    if extracted_text:
        document_label = classify_document(extracted_text)
        print("\n" + "="*40)
        print(f"✅  Result: This document is classified as: {document_label}")
        print("="*40)
    else:
        print("\n" + "="*40)
        print("❌ Result: Could not process the file.")
        print("="*40)

    print("\n--- Process Finished ---")
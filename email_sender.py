import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

class EmailSender:
    def __init__(self):
        self.smtp_server = "smtp.gmail.com"
        self.smtp_port = 587
        self.sender_email = "plp.dmshr@gmail.com"
        self.sender_password = "thpn ttsr pxcw zchi"
    
    def send_reset_code(self, to_email, user_name, code):
        try:
            # Create message
            message = MIMEMultipart("alternative")
            message["Subject"] = "Password Reset Code - DMS Portal"
            message["From"] = self.sender_email
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
            server = smtplib.SMTP(self.smtp_server, self.smtp_port)
            server.starttls()  # Secure the connection
            server.login(self.sender_email, self.sender_password)
            server.sendmail(self.sender_email, to_email, message.as_string())
            server.quit()
            
            print(f"Email sent successfully to {to_email}")
            return {'success': True, 'message': 'Email sent successfully'}
            
        except Exception as e:
            print(f"Email error: {e}")
            return {'success': False, 'message': f'Email error: {str(e)}'}

# For testing
if __name__ == "__main__":
    sender = EmailSender()
    result = sender.send_reset_code("test@example.com", "Test User", "123456")
    print(result)
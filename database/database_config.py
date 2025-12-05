import mysql.connector
from mysql.connector import Error
import os  # <--- IMPORTANT: This allows reading variables from Render

class DatabaseConfig:
    @staticmethod
    def get_connection():
        try:
            # Check if we are running in the cloud (DB_HOST will exist)
            # If not, fall back to your specific local settings
            connection = mysql.connector.connect(
                host=os.environ.get('DB_HOST', 'localhost'),
                database=os.environ.get('DB_NAME', 'db_dms'),
                user=os.environ.get('DB_USER', 'root'),
                password=os.environ.get('DB_PASSWORD', 'admin5002'),
                port=int(os.environ.get('DB_PORT', 3306))
                # Note: 'auth_plugin' is removed here to ensure compatibility with Aiven Cloud.
                # If your local XAMPP stops working, let me know!
            )
            return connection
        except Error as e:
            print(f"Error connecting to MySQL: {e}")
            return None

    @staticmethod
    def execute_query(query, params=None, fetch=False, fetch_one=False, lastrowid=False):
        connection = DatabaseConfig.get_connection()
        if connection is None:
            return None
            
        cursor = None
        try:
            cursor = connection.cursor(dictionary=True)
            cursor.execute(query, params or ())
            
            if fetch:
                result = cursor.fetchall()
            elif fetch_one:
                result = cursor.fetchone()
            elif lastrowid:
                result = cursor.lastrowid
            else:
                result = None
                
            if not fetch and not fetch_one:
                connection.commit()
                
            return result
        except Error as e:
            print(f"Database error: {e}")
            if connection:
                connection.rollback()
            return None
        finally:
            if cursor:
                cursor.close()
            if connection:
                connection.close()
import mysql.connector
from mysql.connector import Error

class DatabaseConfig:
    @staticmethod
    def get_connection():
        try:
            connection = mysql.connector.connect(
                host='localhost',
                database='db_dms',
                user='root',
                password='',
                charset='utf8mb4',
                collation='utf8mb4_unicode_ci'
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
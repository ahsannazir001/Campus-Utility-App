import os

class Config:
    # Get base directory of the backend folder
    BASE_DIR = os.path.abspath(os.path.dirname(__file__))
    
    # SQLite database configuration
    SQLALCHEMY_DATABASE_URI = 'sqlite:///' + os.path.join(BASE_DIR, 'database.db')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    
    # Secret Key for JWT signature (In production, load this from environment variables)
    SECRET_KEY = os.environ.get('SECRET_KEY', 'campus_utility_app_super_secret_key_12345')
    
    # Upload folder configuration for marketplace items
    UPLOAD_FOLDER = os.path.join(BASE_DIR, 'uploads')
    
    # Maximum upload size - 16 Megabytes
    MAX_CONTENT_LENGTH = 16 * 1024 * 1024
    
    # Allowed file extensions for image uploads
    ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}

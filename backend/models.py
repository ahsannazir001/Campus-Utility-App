from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import bcrypt

db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'users'
    
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password_hash = db.Column(db.String(128), nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    # Relationship with marketplace items
    items = db.relationship('MarketplaceItem', backref='seller', lazy=True)

    def set_password(self, password):
        # Generate salt and hash the password
        salt = bcrypt.gensalt()
        hashed = bcrypt.hashpw(password.encode('utf-8'), salt)
        self.password_hash = hashed.decode('utf-8')

    def check_password(self, password):
        # Check password against hash
        return bcrypt.checkpw(password.encode('utf-8'), self.password_hash.encode('utf-8'))

    def to_dict(self):
        return {
            'id': self.id,
            'username': self.username,
            'email': self.email,
            'created_at': self.created_at.isoformat()
        }

class Timetable(db.Model):
    __tablename__ = 'timetable'
    
    id = db.Column(db.Integer, primary_key=True)
    course_name = db.Column(db.String(100), nullable=False)
    instructor = db.Column(db.String(100), nullable=False)
    room_number = db.Column(db.String(20), nullable=False)
    day_of_week = db.Column(db.String(15), nullable=False) # e.g. Monday, Tuesday
    start_time = db.Column(db.String(20), nullable=False)  # e.g. 09:00 AM
    end_time = db.Column(db.String(20), nullable=False)    # e.g. 10:30 AM

    def to_dict(self):
        return {
            'id': self.id,
            'course_name': self.course_name,
            'instructor': self.instructor,
            'room_number': self.room_number,
            'day_of_week': self.day_of_week,
            'start_time': self.start_time,
            'end_time': self.end_time
        }

class MarketplaceItem(db.Model):
    __tablename__ = 'marketplace_items'
    
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text, nullable=False)
    price = db.Column(db.Float, nullable=False)
    image_url = db.Column(db.String(200), nullable=True) # relative path to served image
    seller_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)

    def to_dict(self):
        return {
            'id': self.id,
            'title': self.title,
            'description': self.description,
            'price': self.price,
            'image_url': self.image_url,
            'seller_id': self.seller_id,
            'seller_name': self.seller.username if self.seller else "Unknown",
            'seller_email': self.seller.email if self.seller else "",
            'created_at': self.created_at.isoformat()
        }

class Event(db.Model):
    __tablename__ = 'events'
    
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(150), nullable=False)
    description = db.Column(db.Text, nullable=False)
    location = db.Column(db.String(100), nullable=False)
    event_date = db.Column(db.String(50), nullable=False)  # e.g. "June 15, 2026"
    event_time = db.Column(db.String(50), nullable=False)  # e.g. "10:00 AM"
    created_at = db.Column(db.DateTime, default=datetime.utcnow)

    def to_dict(self):
        return {
            'id': self.id,
            'title': self.title,
            'description': self.description,
            'location': self.location,
            'event_date': self.event_date,
            'event_time': self.event_time,
            'created_at': self.created_at.isoformat()
        }

class LostFoundItem(db.Model):
    __tablename__ = 'lost_found_items'
    
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text, nullable=False)
    item_type = db.Column(db.String(20), nullable=False) # 'lost' or 'found'
    location = db.Column(db.String(100), nullable=False)
    image_url = db.Column(db.String(200), nullable=True) # relative path to served image
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)

    # Relationships
    user = db.relationship('User', backref=db.backref('lost_found_items', lazy=True))

    def to_dict(self):
        return {
            'id': self.id,
            'title': self.title,
            'description': self.description,
            'item_type': self.item_type,
            'location': self.location,
            'image_url': self.image_url,
            'user_id': self.user_id,
            'username': self.user.username if self.user else "Unknown",
            'user_email': self.user.email if self.user else "",
            'created_at': self.created_at.isoformat()
        }

class LostFoundReply(db.Model):
    __tablename__ = 'lost_found_replies'
    
    id = db.Column(db.Integer, primary_key=True)
    item_id = db.Column(db.Integer, db.ForeignKey('lost_found_items.id'), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    content = db.Column(db.Text, nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)

    # Relationships
    user = db.relationship('User', backref=db.backref('lost_found_replies', lazy=True))
    item = db.relationship('LostFoundItem', backref=db.backref('replies', cascade="all, delete-orphan", lazy=True))

    def to_dict(self):
        return {
            'id': self.id,
            'item_id': self.item_id,
            'user_id': self.user_id,
            'username': self.user.username if self.user else "Unknown",
            'user_email': self.user.email if self.user else "",
            'content': self.content,
            'created_at': self.created_at.isoformat()
        }


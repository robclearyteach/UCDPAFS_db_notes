from sqlalchemy import  Column, Integer, Text, TIMESTAMP
from datetime import datetime
from flask_sqlalchemy import SQLAlchemy							

db = SQLAlchemy()												

class User(db.Model):
    id          = db.Column(db.Integer, primary_key=True)
    username    = db.Column(db.Text, nullable=False)
    email       = db.Column(db.Text, unique=True, nullable=False)
	##WARNING: SECURITY: Do NOT store a password like this: just for play here
    password    = db.Column(db.Text, nullable=False)
    created_at  = db.Column(db.TIMESTAMP, default=datetime.utcnow, nullable=False)

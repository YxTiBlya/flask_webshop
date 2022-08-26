from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager


app = Flask(__name__)
app.secret_key = 'SUPER PUPER SECRET SALT'
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:Lalka12322@localhost/flask-webshop'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
manager = LoginManager(app)
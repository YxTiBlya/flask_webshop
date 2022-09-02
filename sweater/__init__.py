from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
import os


BASE_DIR = os.path.abspath(os.curdir)
UPLOAD_FOLDER =  BASE_DIR + '\sweater\static\img'
ALLOWED_EXTENSIONS = set(['jpg', 'jpeg', 'png'])

print('BASE-DIR: ' + BASE_DIR)
print('UPLOAD_FOLDER-DIR: ' + UPLOAD_FOLDER)

app = Flask(__name__)
app.secret_key = 'SUPER PUPER SECRET SALT'
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:Lalka12322@localhost/flask-webshop'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
db = SQLAlchemy(app)
manager = LoginManager(app)
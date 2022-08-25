from urllib import request
from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgress://postgres'
db = SQLAlchemy(app)

@app.route('/')
def main_page():
    return render_template('main_page.html')

@app.route('/shop')
def shop_page():
    return render_template('shop_page.html')

@app.route('/shop_getRequest', methods=['GET'])
def shop_getRequest():
    if request.method == "GET":
        print(request.args.get('text'))
        print(request.args.get('category'))
        return render_template('shop_page.html')

if __name__ == "__main__":
    app.run(debug=True)
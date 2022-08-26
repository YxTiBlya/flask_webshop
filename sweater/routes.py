from flask import render_template, request

from sweater import db, app
from models import Profile

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

@app.route('/profile')
def profile():
    return render_template('')
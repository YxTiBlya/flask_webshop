from flask import render_template, request, redirect, flash, url_for
from flask_login import login_user, login_required, logout_user, current_user
from werkzeug.security import check_password_hash, generate_password_hash
from werkzeug.utils import secure_filename
import os

from sweater import db, app, manager, ALLOWED_EXTENSIONS, UPLOAD_FOLDER
from sweater.models import User, Сategories, Items


@manager.user_loader
def load_user(user_id):
    return User.query.get(user_id)

def get_user():
    return current_user

@app.route('/')
def main_page():
    return render_template('main_page.html')


@app.route('/shop', methods=['GET'])
def shop_page():
    text = request.args.get('text')
    category = request.args.get('category')
    categories = Сategories.query.all()

    if text and category:
        items = Items.query.filter_by(name=text)
    elif category:
        if category == "all":
            items = Items.query.all()
        else:
            items = Items.query.filter_by(category=category)
    else:
        items = Items.query.all()

    return render_template('shop_page.html', categories = categories, items=items)


@app.route('/shop_getRequest', methods=['GET'])
def shop_getRequest():
    if request.method == "GET":
        return render_template('shop_page.html')


@app.route('/login', methods=['GET', 'POST'])
def login_page():
    login = request.form.get('login')
    password = request.form.get('password')
    next_page = request.args.get('next')

    if not (login or password):
        flash('Please fill login and password fields')
    else:
        user = User.query.filter_by(login=login).first()

        if user and check_password_hash(user.password, password):
            login_user(user)

            if next_page != None:
                return redirect(next_page)
        else:
            flash('Login or password is not correct')
        
    return render_template('login_page.html')
    

@app.route('/register', methods=['GET', 'POST'])
def register():
    login = request.form.get('login')
    password = request.form.get('password')
    password2 = request.form.get('password2')

    if request.method == 'POST':
        if not (login or password or password2):
            flash('Please, fill all fields!')
        elif password != password2:
            flash("Passwords are not equal!")
        elif User.query.filter_by(login=login).first():
            flash('Account with this login already exists')
        else:
            hash_pwd = generate_password_hash(password)
            new_user = User(login=login, password=hash_pwd)
            db.session.add(new_user)
            db.session.commit()

            return redirect(url_for('login_page'))
    
    return render_template('register_page.html')

@app.route('/logout', methods=['GET', 'POST'])
@login_required
def logout():
    logout_user()
    return redirect(url_for('main_page'))


@app.route('/profile')
@login_required
def profile():
    return render_template("profile_page.html")


#next_page generate
@app.after_request
def redirect_to_signin(response):
    if response.status_code == 401:
        return redirect(url_for('login_page') + '?next=' + request.url)
    
    return response


#admin urls
def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1] in ALLOWED_EXTENSIONS

@app.route('/admin')
@login_required
def admin():
    if get_user().admin == True:
        categories = Сategories.query.all()
        items = Items.query.all()

        return render_template("admin_page.html", categories=categories, items=items)

@app.route('/add_category', methods=['POST'])
def add_category():
    category = request.form.get('category')
    category_option = request.form.get('category_option')

    if category and category_option:
        db.session.add(Сategories(category=category, option=category_option))
        db.session.commit()
    else:
        flash('PLEASE FILL ALL FIELDS')

    return redirect(url_for('admin'))

@app.route('/add_item', methods=['POST'])
def add_item():
    name = request.form.get('name')
    description = request.form.get('description')
    category = request.form.get('category')
    price = request.form.get('price')
    file = request.files['file']

    if file and allowed_file(file.filename) and name and description and price:
        filename = secure_filename(file.filename)
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))

        path = f"{app.config['UPLOAD_FOLDER']}\{filename}"
        slice = path.find('static')
        path = path[slice:]

        db.session.add(Items(name=name, description=description, category=category, price=price, photo_path=path))
        db.session.commit()
    else:
        flash('PLEASE FILL ALL FIELDS')

    return redirect(url_for('admin'))

@app.route('/del_category', methods=['POST'])
def del_category():
    category = request.form.get('category')

    Сategories.query.filter_by(category=category).delete()
    db.session.commit()

    return redirect(url_for('admin'))

@app.route('/del_item', methods=['POST'])
def del_item():
    item = request.form.get('item')

    Items.query.filter_by(name=item).delete()
    db.session.commit()

    return redirect(url_for('admin'))


if __name__ == "__main__":
    db.create_all()
    app.run(debug=True, host='0.0.0.0')
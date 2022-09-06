## **Flask WebShop**
The front of this site is written for 1920x1080 resolution and has no adaptive* 

# How to install

### Installation with Docker
##### *if docker is already installed**  

1. Clone docker-compose.yaml with .env files.
2. Enter the desired vars in the .env file (recommended name for `POSTGRES_USER=postgres`).
3. Then in the console go to the directory with the compose.yaml file.
4. Enter the command `docker-compose up` and wait for the launch of the containers, after go to localhost:5000.

### Installion without Docker
##### *if postgres db is already installed**
##### *use the default branch**

1. Clone the repository and optionally install venv.
2. To install the required modules use the command `pip install -r requerements.txt`.
3. In postgres create database(without tables), after enter variables in .env file.
4. In `sweater/__init__.py` file in the postgres connection link change host from db to localhost (13 line).
5. Use `postgres_dump.sql` for restore postgres dump.
6. Enter the command `python app.py` and go to localhost:5000.

### Admin
Login and password from admin user = admin:admin.

Admin page - host:5000/admin.

### Languages and Tolls in this repository
![Python](https://img.shields.io/badge/-Python-090909?style=for-the-badge&logo=python)
![Sql](https://img.shields.io/badge/-POSTGRES-090909?style=for-the-badge&logo=postgresql)
![Framework](https://img.shields.io/badge/-FLASK-090909?style=for-the-badge&logo=flask)
![Docker](https://img.shields.io/badge/-DOCKER-090909?style=for-the-badge&logo=docker)
![Sqlalchemy](https://img.shields.io/badge/-SQLALCHEMY-090909?style=for-the-badge)
![Git](https://img.shields.io/badge/-GIT-090909?style=for-the-badge&logo=Git)
![Html](https://img.shields.io/badge/-HTML-090909?style=for-the-badge&logo=html5)
![Css](https://img.shields.io/badge/-CSS-090909?style=for-the-badge&logo=css3)
![Nginx](https://img.shields.io/badge/-NGINX-090909?style=for-the-badge&logo=nginx&logoColor=11d43e)
# -*- coding: utf-8 -*-
"""
Created on Fri Aug 28 10:14:42 2020

@author: Neeraj
"""
from typing import TextIO

from flask import Flask, render_template, request, session,redirect,g
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from werkzeug.utils import secure_filename
import json , os,math
from flask_mail import Mail, Message

with open('config.json','r') as con:
    conf = json.load(con)
app = Flask(__name__)
app.secret_key = "abc"
""" #these configurations are for email
app.config.update(
	#DEBUG=True,
	#EMAIL SETTINGS
	MAIL_SERVER='smtp.gmail.com',
	MAIL_PORT=465,
	#MAIL_USE_SSL=True,
	MAIL_USERNAME = 'your@gmail.com',
	MAIL_PASSWORD = 'yourpassword'
	)
mail= Mail(app)  """
app.config["UPLOAD_FOLDER"]	= 'D:\\D drive\\JK mtech\\program\\Website Development\\website 2\\static\\uploader'        # Defines path for upload folder
app.config["MAX_CONTENT_PATH"]= 2048*2048
app.config["SQLALCHEMY_DATABASE_URI"] = conf["params"]["local_uri"]
db = SQLAlchemy(app)



class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True, nullable=False)
    name = db.Column(db.String(8), unique=False, nullable=False)
    email = db.Column(db.String(12), unique=False, nullable=False)
    phone = db.Column(db.String(12), unique=False, nullable=False)
    msg = db.Column(db.String(80), unique=False, nullable=False)
    time = db.Column(db.String(12), unique=False, nullable=True)
class Post(db.Model):
    sno = db.Column(db.Integer, primary_key=True, nullable=False)
    slug = db.Column(db.String(20), unique=False, nullable=False)
    title = db.Column(db.String(12), unique=False, nullable=False)
    content = db.Column(db.String(500), unique=False, nullable=False)
    Posted_By = db.Column(db.String(80), unique=False, nullable=False)
    img_file = db.Column(db.String(12), unique=False, nullable=True)
    date = db.Column(db.String(12), unique=False, nullable=True)
@app.route('/') 
def home():
    posts=Post.query.filter_by().all()
    #[0:conf["params"]["no_of_post"]]
    last=math.ceil(len(posts)/int(conf["params"]['no_of_post']))
    page=request.args.get('page')
    if(not str(page).isnumeric()):
        page=1
    page=int(page)
    posts=posts[(page-1) * (int(conf["params"]["no_of_post"])): (page-1) * (int(conf["params"]["no_of_post"])) + int(conf["params"]["no_of_post"])]
    #first page
    if(page==1):
     prev="#"
     next="/?page=" + str(page + 1)
    #last page
    elif(page==last):
     next = "#"
     prev = "/?page=" + str(page - 1)
    #middle page
    else:
     prev = "/?page=" + str(page - 1)
     next = "/?page=" + str(page + 1)

    return render_template('index.html',conf=conf,post=posts, prev=prev, next=next)

@app.route('/uploader',methods = ['GET', 'POST'])
def upload_file():
    if ("user" in session and session['user'] == conf["params"]["admin_user"]):
     if request.method == 'POST':
      f = request.files['file']
      filename = secure_filename(f.filename)
      f.save(os.path.join(app.config["UPLOAD_FOLDER"], filename))
      return "file uploaded"

@app.route('/add_post',methods = ['GET', 'POST'])
def add_post():
   if ("user" in session and session['user'] == conf["params"]["admin_user"]):
    if (request.method == 'POST'):
        slug = request.form.get('slug')
        title = request.form.get('title')
        content = request.form.get('content')
        posted_by = request.form.get('posted_by')
        img_file = request.form.get('img_file')
        feed = Post(slug=slug, title=title, content=content, Posted_By=posted_by, img_file=img_file, date=datetime.now())
        db.session.add(feed)
        db.session.commit()
        return redirect('/dashboard')


    return render_template('add_post.html',conf=conf)


@app.route('/dashboard',methods = ['GET', 'POST'])
def dashboard():
     post = Post.query.all()
     if ("user" in session and session['user']== conf["params"]["admin_user"]):
         return render_template('dashboard.html', conf=conf, post=post)
     if (request.method == 'POST'):
         user_id=request.form.get('user')
         password=request.form.get('pass')
         if (user_id== conf["params"]["admin_user"] and password== conf["params"]["admin_password"]):
             session['user'] = user_id
             return render_template('dashboard.html', conf=conf,post=post)
     return render_template('admin.html', conf=conf)

@app.route('/edit/<string:sno>',methods = ['GET', 'POST'])
def edit(sno):
     if ("user" in session and session['user']== conf["params"]["admin_user"]):
        if (request.method == 'POST'):
            post=Post.query.filter_by(sno=sno).first()
            post.slug = request.form.get('slug')
            post.title = request.form.get('title')
            post.content = request.form.get('content')
            post.posted_by = request.form.get('posted_by')
            post.img_file = request.form.get('img_file')
            post.date=datetime.now()
            db.session.commit()
            post1 = Post.query.all()
            return render_template('dashboard.html',conf=conf,post=post1)
        post = Post.query.filter_by(sno=sno).first()
        return render_template('edit.html', conf=conf, post=post)

@app.route('/delete/<string:sno>',methods = ['GET', 'POST'])
def delete(sno):
     if ("user" in session and session['user']== conf["params"]["admin_user"]):
         post= Post.query.filter_by(sno=sno).first()
         db.session.delete(post)
         db.session.commit()
     return redirect('/dashboard')


@app.route('/logout')
def logout():
       # remove the username from the session if it is there
        session.pop('user')
        return redirect('/dashboard')

@app.route('/about')
def about():
    # name= 'Guest'
    return render_template('about.html',conf=conf)


@app.route("/post/<string:slug_post>", methods=['GET'])
def post_fn(slug_post):
    post = Post.query.filter_by(slug=slug_post).first()
    return render_template('post.html',conf=conf,post=post)


@app.route('/contact', methods=['GET', 'POST'])
def Contact():
    if (request.method == 'POST'):

        name=request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        feed = Contacts(name=name, email=email,phone=phone, msg=message, time=datetime.now() )
        db.session.add(feed)
        db.session.commit()
        """ # these are for email
        msg = Message('Hello', sender='email', recipients=['someone1@gmail.com'])
        msg.body = "Hello Flask message sent from Flask-Mail"
        mail.send(msg)   """
    return render_template('contact.html',conf=conf)
# for Sql Alchemy QueuePool limit overflow
@app.teardown_request
def checkin_db(exc):
 try:
  g.db.close()
 except AttributeError:
  pass

if __name__ == '__main__':
    app.run(debug=True)

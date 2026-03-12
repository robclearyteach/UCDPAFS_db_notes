from flask import Flask, render_template
from flask import request, redirect, url_for
from sqlalchemy import text  


from models import db, User
app = Flask(__name__)

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///project.db" 
db.init_app(app)												


@app.route("/")
def index():
    user_data = User.query.all()                             #new: db.Model classes have '.query' attribute
    return render_template("index.html", users=user_data)       

# add form.html

# 1. test: visit /user
@app.route("/user", methods=["GET"])
def user_form():
    return render_template("form.html")



@app.route("/user", methods=["POST"])
def user_insert():
    username = request.form.get("username", 'empty')
    email    = request.form.get("email", 'empty')
    password = request.form.get("password", 'empty')
    new_user = User(        
        username = request.form["username"]
        , email    = request.form["email"]
        , password = request.form["password"]
    )
    db.session.add(new_user)
    db.session.commit()
    return redirect( url_for('index') )

# using FlaskSQLALchemy db.session.delete
@app.route("/user_delete/<int:user_id>")
def user_delete(user_id):
    user = User.query.get_or_404(user_id)
    db.session.delete(user)
    db.session.commit()
    return redirect( url_for('index'))


#Added: user_edit.html (copy of form.html ~)
# GET request serves new user_edit form with values populated
@app.route("/user_edit/<int:user_id>")
def user_edit(user_id):
    user_data = User.query.get_or_404(user_id)
    return render_template("user_edit.html", user=user_data)


@app.route("/user_update/<int:user_id>", methods=["POST"])
def user_update(user_id):
    user = User.query.get_or_404(user_id)
    new_username = request.form["username"]
    new_email    = request.form["email"]
    new_password = request.form["password"]
    user.username = new_username				#py assignment is update
    user.email    = new_email					#py assignment is update
    user.password = new_password				#py assignment is update
    db.session.commit()

    return redirect( url_for('index') )


if __name__ == '__main__':
    app.run(debug=True)
"""Blogly application."""

from flask import Flask, render_template, redirect
from models import db, connect_db, Pet
from forms import AddPetForm, PetForm

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///adopt'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True
app.config['SECRET_KEY'] = 'mydoghasfleas'
connect_db(app)


@app.route('/')
def home_page():
    return (redirect('/pets/'))


@app.route('/pets/')
def pets_page():
    pets = Pet.query.all()
    sorted_pets = sorted(pets, key=lambda x: x.name)
    return (render_template('home.html', is_petlist=True, pets=sorted_pets))

@app.route("/pets/add", methods=["GET", "POST"])
def add_pet():
    """Pet add form; handle adding."""

    form = AddPetForm()

    if form.validate_on_submit():
        name = form.name.data
        species = form.species.data
        age = form.age.data
        photo = form.photo.data
        notes = form.notes.data
        available = form.available.data
        if (photo != ''):
            pet = Pet(name=name, species=species, age=age, photo_url=photo, notes=notes, available=available)
        else:
            pet = Pet(name=name, species=species, age=age, notes=notes, available=available)
        db.session.add(pet)
        db.session.commit()
        return redirect("/")

    else:
        return render_template(
            "pet_add_form.html", form=form)
    


@app.route("/pets/<int:id>", methods=["GET", "POST"])
def view_pet(id):
    """Pet add form; handle adding."""

    pet = Pet.query.get_or_404(id)
    form = PetForm(obj=pet)
    if form.validate_on_submit():
        pet.photo_url = form.photo_url.data
        pet.notes = form.notes.data
        pet.available = form.available.data
        db.session.commit()
        return redirect("/")
    else:
        print("viewing pet", id)
        return render_template(
            "pet_view.html", form=form)
    
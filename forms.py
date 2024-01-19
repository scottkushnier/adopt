
from flask_wtf import FlaskForm
from wtforms import StringField, IntegerField, TextAreaField, BooleanField
from wtforms.validators import Optional, NumberRange, URL, AnyOf

class AddPetForm(FlaskForm):
    """Form for adding pets."""

    name = StringField("Pet Name")
    species = StringField("Species", validators=[AnyOf(['cat','dog','porcupine'])])
    age = IntegerField("Age", validators=[NumberRange(min=0, max=30)])
    photo = StringField("photo", validators=[Optional(), URL()])
    available = BooleanField("available", default=True)
    notes = TextAreaField("notes", render_kw={'rows': 3})

class PetForm(FlaskForm):
    """Form for modifying pets, less stringent on input fields"""
    name = StringField("Pet Name")
    species = StringField("Species")
    age = IntegerField("Age", validators=[NumberRange(min=0, max=30)])
    photo_url = StringField("photo", validators=[Optional()])
    available = BooleanField("available", default=True)
    notes = TextAreaField("notes", render_kw={'rows': 3})

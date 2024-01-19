"""Models for Adopt."""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


def connect_db(app):
    db.app = app
    db.init_app(app)
    app.app_context().push()


class Pet(db.Model):
    __tablename__ = 'pets'

    def __repr__(self):
        u = self
        return f"<Pet {u.name}>"

    id = db.Column(db.Integer,
                   primary_key=True,
                   autoincrement=True)

    name = db.Column(db.String(50),
                        nullable=False)

    species = db.Column(db.String(50),
                          nullable=False)

    photo_url = db.Column(db.Text,
                          default='images/pet.png')

    age = db.Column(db.Integer)

    notes = db.Column(db.Text)

    available = db.Column(db.Boolean, default=True)




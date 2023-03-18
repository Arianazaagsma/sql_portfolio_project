from flask import Blueprint, jsonify, abort, request
from ..cm_models import User, db
import hashlib
import secrets
import sqlalchemy

def scramble(password: str):
    """Hash and salt the given password"""
    salt = secrets.token_hex(16)
    return hashlib.sha512((password + salt).encode('utf-8')).hexdigest()

bp = Blueprint('user_accounts', __name__, url_prefix='/user_accounts')

@bp.route('/<int:id>', methods=['PUT', 'PATCH'])
def update(id:int):
    u = User.query.get_or_404(id)
    if 'username' not in request.json:
        return abort(400)
    if 'password' not in request.json:
        return abort(400)
    if 'password' in request.json:
        u.password=scramble(request.json['password'])
    try:
        db.session.commit()
        return jsonify(u.serialize())
    except:
        return jsonify(False)


@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    users = User.query.all() # ORM performs SELECT query
    result = []
    for u in users:
        result.append(u.serialize()) # build list of Users as dictionaries
    return jsonify(result) # return JSON response
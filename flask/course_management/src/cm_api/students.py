from re import S
from flask import Blueprint, jsonify, abort, request
from ..cm_models import Course, Student, db
import sqlalchemy

bp = Blueprint('students', __name__, url_prefix='/students')    
    

@bp.route('', methods=['POST'])
def create():
    # req body must contain username and password
    if 'first_name' not in request.json: 
        return abort(400)
    if 'last_name' not in request.json:
        return abort(400)
    if 'email' not in request.json:
        return abort(400)
    if 'major_department' not in request.json:
        return abort(400)

    s = Student(
        first_name=request.json['first_name'],
        last_name=request.json['last_name'], 
        email=request.json['email'],
        major_department=request.json['major_department'])
    

    db.session.add(s) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(s.serialize())


@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    s = Student.query.get_or_404(id)
    try:
        db.session.delete(s) # prepare DELETE statement
        db.session.commit() #execute DELETE statement
        return jsonify(True)
    except:
        #something went wrong
        return jsonify(False)
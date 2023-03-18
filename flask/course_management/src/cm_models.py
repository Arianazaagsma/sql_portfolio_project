from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Course(db.Model):
    __tablename__ = 'courses'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String, nullable=False)
    description = db.Column(db.String, nullable=True)
    meeting_schedule = db.Column(db.String, nullable=False)
    meeting_location = db.Column(db.String, nullable=False)
    max_enrollment = db.Column(db.Integer, nullable=False)
    credits = db.Column(db.Integer, nullable=False)
    instructor_id = db.Column(db.Integer, db.ForeignKey('instructors.id'), nullable=False)
    department_id = db.Column(db.Integer, db.ForeignKey('departments.id'), nullable=False)
    
    def __init__(self, name, description, meeting_schedule, meeting_location, max_enrollment, credits, instructor_id, department_id):
        self.name = name
        self.description = description
        self.meeting_schedule = meeting_schedule
        self.meeting_location = meeting_location
        self.max_enrollment = max_enrollment
        self.credits = credits
        self.instructor_id = instructor_id
        self.department_id = department_id

    def serialize(self):
        return {
            'course name': self.name,
            'course description': self.description,
            'course meeting schedule': self.meeting_schedule,
            'course meeting location': self.meeting_location,
            'course credits': self.credits
        }


class Department(db.Model):
    __tablename__ = 'departments'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String, nullable=False)
    
    def __init__(self, name):
        self.name = name

    def serialize(self):
        return {
            'department name': self.name,
        }


class Instructor(db.Model):
    __tablename__ = 'instructors'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.String, nullable=False)
    last_name = db.Column(db.String, nullable=False)
    email = db.Column(db.String, nullable=False)
    
    def __init__(self, first_name, last_name, email):
        self.first_name = first_name
        self.last_name = last_name
        self.email = email

    def serialize(self):
        return {
            'instructor name': self.first_name + self.last_name,
            'instructor email': self.email
        }



class Student(db.Model):
    __tablename__ = 'students'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.String, nullable=False)
    last_name = db.Column(db.String, nullable=False)
    email = db.Column(db.String, nullable=False)
    major_department = db.Column(db.Integer, db.ForeignKey('departments.id'), nullable=True)
    
    def __init__(self, first_name, last_name, email, major_department):
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.major_department = major_department

    def serialize(self):
        return {
            'student name': self.first_name + self.last_name,
            'student email': self.email
        }
    
    


class User(db.Model):
    __tablename__ = 'user_accounts'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String, nullable=False)
    password = db.Column(db.String, nullable=False)
    student_id = db.Column(db.Integer, db.ForeignKey('students.id'), nullable=False)

    def __init__(self, username, password, student_id):
        self.username = username
        self.password = password
        self.student_id = student_id

    def serialize(self):
        return {
            'username': self.username,
            'password': self.password,
        }
    


courses_students = db.Table(
    'courses_students', 
    db.Column(
        'course_id', db.Integer,
        db.ForeignKey('courses.id'), 
        primary_key=True
    ),
    db.Column(
        'student_id', db.Integer,
        db.ForeignKey('students.id'), 
        primary_key=True
    ), 
)
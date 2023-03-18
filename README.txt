Title: Course Management Database

Description: This database is designed to be used by students and administrators regarding course offerings and registration. There are five different tables for each factor in the course management process: Departments, Courses, Instructors, Students and User Accounts. There is also a courses_students table to demonstrate the many-to-many relationship between students and courses. 

API Reference Table:

| Endpoint Paths                    | Methods   | Parameters                                     |
--------------------------------------------------------------------------------------------------
| course_management/user_accounts   | GET       | n/a                                            |
--------------------------------------------------------------------------------------------------
| course_management/user_accounts/1 | PUT/PATCH | User ID, Password                              |
--------------------------------------------------------------------------------------------------
| course_management/students        | POST      | First Name, Last Name, Email, Major Department |
--------------------------------------------------------------------------------------------------
| course_management/students/21     | DELETE    | Student ID                                     |
--------------------------------------------------------------------------------------------------

1. How did the project's design evolve over time?
	The database itself did not change drastically once I finalized my ER diagram. The biggest changes occurred when I was developing the database's models and routes. I had to change around the routes that I initially wanted to run, but managed to establish four different routes that all work. Learning about indexes also affected my perception of my database, and I established an index for the Courses table on the Course Name column to make searching for specific courses easier. 

2. Did you choose to use an ORM or raw SQL? Why?
	I chose to use an ORM because I felt the least comfortable with those methods and concepts. I wanted to push myself into more unfamiliar territory to expand my foundation of knowledge, rather than sticking with a method where I felt more confident about my abilities. I am grateful that I chose this path, as I definitely feel that I have a stronger grasp on ORM and how it connects to my database. 

3. What future improvements are in store, if any?
	If I am able to continue to refine this project and this database, I would like to work on using ORM for my courses_students table. Specifically, I want to create the capacity for students to add and drop courses. However, I need to do a bit more research to figure out how to establish not only a connection with that table, but how to formulate the model for that table and the routes that would allow for students to access and adjust their own records for that table. 
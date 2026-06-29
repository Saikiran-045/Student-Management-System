 
DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Faculty;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Department;

 
CREATE TABLE Department (
    department_id INTEGER PRIMARY KEY,
    department_name TEXT NOT NULL UNIQUE
);

CREATE TABLE Student (
    student_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    gender TEXT CHECK(gender IN ('Male','Female','Other')),
    date_of_birth TEXT,
    email TEXT UNIQUE,
    phone TEXT,
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Faculty (
    faculty_id INTEGER PRIMARY KEY,
    faculty_name TEXT NOT NULL,
    email TEXT UNIQUE,
    phone TEXT,
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Course (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT NOT NULL,
    credits INTEGER CHECK(credits > 0),
    faculty_id INTEGER,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);

CREATE TABLE Enrollment (
    enrollment_id INTEGER PRIMARY KEY,
    student_id INTEGER,
    course_id INTEGER,
    semester TEXT,
    marks INTEGER CHECK(marks BETWEEN 0 AND 100),
    grade TEXT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Department VALUES
(1,'Civil'),
(2,'Mechanical'),
(3,'Computer Science and Engineering'),
(4,'Electrical and Electronics Engineering'),
(5,'Electronics and Communication'),
(6,'Artificial Intelligence and Machine Learning');

INSERT INTO Student VALUES
(101,'Sai','Kiran','Male','2005-05-10','sai@gmail.com','9876543210',1),
(102,'Sai','Singidi','Male','2002-11-20','singidi@gmail.com','9876543211',2),
(103,'Supriya','Reddy','Female','2003-01-10','reddy@gmail.com','9876543212',3),
(104,'Venky','Algu','Male','2002-09-18','venky@gmail.com','9876543213',4),
(105,'Arjun','Kumar','Male','2003-07-25','kumar@gmail.com','9876543214',5),
(106,'Charan','Kumar','Male','2003-05-15','charan@gmail.com','9445635251',6),
(107,'Siva','Naidu','Male','2002-11-20','siva@gmail.com','9849511471',1),
(108,'Devendra','Rao','Male','2003-01-10','devendra@gmail.com','9652740251',2),
(109,'Naveen','Patel','Male','2002-09-18','naveen@gmail.com','9546231468',3),
(110,'Priya','Sharma','Female','2003-07-25','priya@gmail.com','9876543215',4);


INSERT INTO Faculty VALUES
(1,'Dr. Rao','rao@college.com','9999999991',1),
(2,'Dr. Bimalendhu','sharma@college.com','9999999992',2),
(3,'Dr. Priyatham','mehta@college.com','9999999993',3),
(4,'Dr. Sunil','kumar@college.com','9999999994',4),
(5,'Dr. Arun solomon','reddy@college.com','9999999995',5),
(6,'Dr. J.Sridhar','singh@college.com','9999999996',6);


INSERT INTO Course VALUES
(201,'Surveying',4,1),
(202,'Thermodynamics',4,2),
(203,'Database Management',4,3),
(204,'Electrical Machines',3,4),
(205,'Digital Communication',3,5),
(206,'Machine Learning',4,6);

-- ==========================================
-- INSERT ENROLLMENTS
-- ==========================================sss

INSERT INTO Enrollment VALUES
(1,101,201,'Semester 1',88,'A'),
(2,102,202,'Semester 1',82,'B+'),
(3,103,203,'Semester 1',95,'A+'),
(4,104,204,'Semester 1',76,'B'),
(5,105,205,'Semester 1',89,'A'),
(6,106,206,'Semester 1',97,'A+'),
(7,107,201,'Semester 1',80,'B+'),
(8,108,202,'Semester 1',84,'A'),
(9,109,203,'Semester 1',91,'A+'),
(10,110,204,'Semester 1',78,'B+');

-- ==========================================
-- CHECK TABLES
-- ==========================================

SELECT name
FROM sqlite_master
WHERE type='table';

-- ==========================================
-- VIEW DATA
-- ==========================================

SELECT * FROM Department;

SELECT * FROM Student;

SELECT * FROM Faculty;

SELECT * FROM Course;

SELECT * FROM Enrollment;
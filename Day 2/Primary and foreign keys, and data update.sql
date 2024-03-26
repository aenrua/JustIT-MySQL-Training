										/* -- Day 2 -- */
/* Adding a foreign key */
create database World;
use World;
create table Country(
	id int primary key,
    countryName varchar(15) not null
    );
create table City(
	cityID int primary key,
    cityName varchar(20) not null,
    countryID int,
    foreign key (countryID) references Country(id) -- create a foreign key for the countryID column, using the id column in the Country table as a reference
    );
describe City;
-- RECOMMENDED TO ADD FOREIGN KEY THROUGH THE ALTER COMMAND, WHICH WILL BE COVERED NEXT SESSION

/* Updating data */
use task;
update studentList set studentName="James" where studentID=2; -- change the studentName in studentID 2
update studentList set studentName="Junior John", studentClass="Two", studentMark="70" where studentName="Big John"; -- replace the listed values for "Big John"
select * from studentlist;

/* Task */
create database task2;
use task2;
create table Department(
	Deptno int primary key,
    Dname varchar(10) not null,
    Loc enum("Chicago", "New York") not null
    );
insert into Department(Deptno, Dname, Loc) values
	("10", "Sales", "Chicago"),
	("20", "Sales", "Chicago"),
	("30", "Finance", "New York");
select * from Department;

create table Employee(
	Empno int primary key,
    Ename varchar(15) not null,
    Job varchar(25),
    Deptno int,
    foreign key (Deptno) references Department(Deptno)
    );
insert into Employee(Empno, Ename, Job, Deptno) values
	("101", "A", "Salesman", "10"),
	("102", "B", "Manager", "10"),
	("103", "c", "Manager", "20");
select * from Employee;

/* Task */
/* CREATE two tables named (Student and Courses) with below columns:
Student:
1.  passportNumber: datatype = int
2.  studentName: datatype= varchar (10)
3.  studetnAge: datatype=int
Course:
1.  courseID: datatype = int (10)
2.  courseName: datatype = varchar (12)
3.  startDay: timeStamp
Constraint for Student table:
1.  the passportNumber should be primary key.
2.  The studentName can’t be null.
3.  The studentAge can’t be null. It will be taking 18 as a default value.
Constraint for Course Table:
1.  The courseID should be primary key and can not be null.
2.  The courseName should only take (HTML, CSS, JavaScript, Database, Phyton) values.  
Note:
1. insert 2 records in each table individually.
2. insert 5 records in each table with multiplcourseID
*/
create database StudentAndCourses;
use StudentAndCourses;
create table Student(
	passportNumber int primary key,
    studentName varchar(10) not null,
    studentAge int default 18 check(studentAge>=18) not null
    );
describe Student;
create table Course(
	courseID int (10) primary key not null,
    courseName varchar(12),
    check(courseName="HTML" or courseName="CSS" or courseName="JavaScript" or courseName="Database" or courseName="Python"),
    startDay timestamp
    );
describe Course;
insert into Student(passportNumber, studentName, studentAge) values
	("123456789", "Anton", 28),
	("987654321", "James", 24);
select * from Student;
insert into Course(courseID, courseName, startDay) values
	("104", "Database", "2024-02-05"),
	("103", "JavaScript", "2024-01-22");
select * from Course;
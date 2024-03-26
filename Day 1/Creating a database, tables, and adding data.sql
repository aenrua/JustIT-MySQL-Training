										/* -- Day 1 -- */
/* Creating a database */
-- SHOW DATABASES -- show all databases available
-- CREATE DATABASE [DB Name] -- create a database
-- USE [DB Name] -- use the selected database
-- DROP DATABASE [DB Name] -- delete the selected database
-- SYSTEM CLS -- clear screen in cmd
create database College;
use College;
create table Subject(
	id INT,
	subjectName VARCHAR(25)
	);
describe Subject; -- definition of the subject table

create database College2;
use college2;
select database(); -- shows the current selected database

/* Making a table */ 
-- SHOW TABLES - show tables in the database
create table Student(
	studentId INT PRIMARY KEY auto_increment, -- make studentId the primary key
    studentName VARCHAR(15) not null,
    studentAge INT check(studentAge>=18), -- only accept the age if it is equal to or higher than 18
    studentLocation VARCHAR(15) default "London"
    );
describe student;

/* Inserting data */
insert into Student(studentName,studentAge,studentLocation) values
	("Matt", 25, "Manchester");
insert into Student(studentName,studentAge,studentLocation) values
	("Mark", 19, "Leeds");
insert into Student(studentName,studentAge) values
	("Ahmad", 25);
select * from student; -- displays all data from a table (student)

/* Task */
create database task;
use task;
select database();
create table studentList(
	studentID INT PRIMARY KEY auto_increment,
    studentName VARCHAR(15) not null,
    studentClass VARCHAR(10) not null,
    studentMark INT check(studentMark>=0 and studentMark<=100),
    studentGender ENUM("Male","Female") -- to accept only certain options
    );
describe studentList;

insert into studentList(studentName,studentClass,studentMark,studentGender) values
	("John Deo", "Four", 75, "Female"),
	("Max Ruin", "Three", 85, "Male"),
	("Arnold", "Three", 55, "Male"),
	("Krish Star", "Four", 60, "Female"),
	("John Mike", "Four", 60, "Female"),
	("Alex John", "Four", 55, "Male"),
	("My John Rob", "Five", 78, "Male"),
	("Asruid", "Five", 85, "Male"),
	("Tes Qry", "Six", 78, "Male"),
	("Big John", "Four", 55, "Female");
select * from studentList;
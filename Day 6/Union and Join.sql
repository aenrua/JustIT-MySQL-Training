										/* -- Day 6 -- */
/* UNION */
-- Used to combine the result-set of two or more SELECT queries
CREATE DATABASE UnionDB;
USE UnionDB;
CREATE TABLE Employee(
	id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
    );
CREATE TABLE Manager(
	id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL
    );
insert into Employee (id, name) values (1, "Adam"), (2, "Sarah"), (3, "Gabril"), (4, "Pratish"), (5, "Yasin"), (6, "Adriana");
insert into Manager (id, name) values (1, "Adam"), (2, "Sarah"), (3, "Maria"), (4, "Anton"), (5, "Calum"), (6, "Adriana");
-- When selecting columns to use with union:
	-- Number of columns selected should be the same for both tables
	-- Column names need to be selected in the same order
select id, name from employee
union -- combines data which is the same
select id, name from manager;
select id, name from employee
union all -- shows all data from both tables without combining
select id, name from manager;

/* JOIN */
-- Select data from multiple tables
-- INNER JOIN - selects common data from both tables
-- LEFT JOIN - selects all data from the left table (table mentioned before JOIN), and data from the right that is common with the left
-- RIGHT JOIN - selects all data from the right table (table mentioned after JOIN), and data from the right that is common with the left
-- CROSS JOIN - each row of one table will be repeated for each row of the other table
use company;
select fname, lname, dname from employee inner join department on dno=dnumber;
-- fname, lname, dname
-- from the employee table INNER JOINed with department table
-- where the dno column is equal to the dnumber (these are the common columns, which will usually be the primary keys)
create database JoinDB;
use joindb;
create table Employee(
	EmpNo int primary key,
	EmpName varchar(10),
	DepNo int
	);
create table Department(
	DepNo int primary key,
    Dname varchar(30),
    Location varchar(20)
    );
alter table employee add foreign key (depno) references department(depno);
insert into department values
	(1, "HR", "London"),
    (2, "Software", "London"),
    (3, "IT", "Manchester");
insert into employee values
	(1, "Beautriz", "1"),
    (2, "Zak", "2"),
    (3, "Matt", "2"),
    (4, "Waqas", "2"),
	(5, "Mark", "3"),
	(6, "John", null);
select * from employee;
select * from department;
-- Display employees and their department name, excluding employees without a department
select empname, dname from employee inner join department on employee.depno=department.depno;
-- Display all employees and their department name
select empname, dname from employee left join department on employee.depno=department.depno;
-- Display all departments and their employees
select empname, dname from employee right join department on employee.depno=department.depno;

create table Instructor(
	instructorID int not null primary key,
    instructorName varchar(10)
    );
create table Trainer(
	trainerId int not null primary key,
    trainerName varchar(10),
    trainerAge int
    );
insert into instructor (instructorid, instructorname) values
	(2, "Mark"),
    (1, "Abdul"),
    (3, "Matt"),
    (4, "Sandra");
insert into trainer (trainerid, trainername, trainerage) values
	(1, "Abdul", 32),
    (2, "Zak", 26),
    (3, "Waqas", 36);
select * from trainer inner join instructor on instructorname=trainername;
select * from trainer left join instructor on instructorname=trainername;
select * from trainer right join instructor on instructorname=trainername;
select * from trainer cross join instructor; -- if condition is added at the end, it will become INNER JOIN

-- Display employee name, the project the employee is working on, and the number of hours the employee works on a specific project
use company;
select fname, lname, pname, hours from employee
	left join works_on on essn=ssn
	inner join project on pno=pnumber;

/* SELF JOIN */
-- Joins a table with itself
select concat(e.fname, " ", e.lname) as "Employee",
	   concat(m.fname, " ", m.lname) as "Manager" from employee as e left join employee as m
       on e.superssn=m.ssn;
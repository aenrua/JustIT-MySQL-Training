										/* -- Day 3 -- */
/* Operators */
-- AND - test whether both conditions are true
-- OR - either of the condition could be true

/* Removing data from tables */
-- DELETE - removes a specific record from a table (row/data)
-- TRUNCATE - removes all data from a table (but keeps structure)
-- DROP - delete the whole column/table schema (structure and data)

/* DELETE */
use college2;
select * from student;
insert into student(studentName, studentAge, studentLocation) value
	("Matt", 30, "Birmingham"),
	("John", 20, "London"),
	("Aaran", 25, "Birmingham"),
	("Calum", 30, "London"),
	("Mark", 23, "Leeds");
delete from student where studentName="Matt" and studentLocation="Manchester";
delete from student where studentName="Mark";
delete from student where studentName="Calum" or studentLocation="Birmingham";
-- If using DELETE and then adding data again, it will not continue to auto increment

/* TRUNCATE */
truncate student;
-- If using TRUNCATE and then adding data again, it will auto increment again

/* TRUNCATE vs DELETE */
-- It is possible to delete all data with DELETE instead of TRUNCATE
	-- DELETE allows rolling back of data
	-- TRUNCATE is permanent

/* DROP */
-- drop table student
-- drop database college2

/* Task */
-- Write a query that deletes an employee whose name is Tim or whose ID is 2 but wasn't born on the 1st of Jun 1990
delete from Employee where name="Tim" or (id=2 and DOB!="1990-06-01"); -- != means is not equal to

/* ALTER */
-- Used to delete, rename, add and change the data type of columns
-- Rename table, add/delete primary and foreign key
-- Manipulate schema of a database
alter table student add column DOB date; -- adding a column (writing COLUMN is not necessary)
alter table student drop column DOB; -- deleting a column
alter table student modify column studentLocation varchar(30); -- modifying a column
alter table student rename column studentName to firstName; -- renaming a column
alter table student rename to Learners; -- renaming a table
alter table learners modify column studentId int;
select * from learners;
-- If primary key is auto incremented, cannot be dropped so needs to be changed to an integer
alter table learners drop primary key; -- remove a primary key
alter table learners add primary key(studentId); -- add a primary key to a column

create table Country(
	id int primary key,
    countryName varchar(15) not null
    );
create table City(
	cityID int primary key,
    cityName varchar(20) not null,
    countryID int
    );
alter table city add foreign key (countryID) references country(id);
describe city;
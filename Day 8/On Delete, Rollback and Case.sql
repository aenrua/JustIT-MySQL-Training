										/* -- Day 8 -- */
/* ON DELETE */
-- There are 2 ways to delete data:
	-- ON DELETE CASCADE - If data is deleted from a parent table, the relevant data will be deleted from child tables
    -- ON DELETE SET NULL - If data is deleted from a parent table, the relevant data will be set to NULL in child tables
use company2;
create table Department(
	DepNo int primary key,
    DName varchar(30),
    Location varchar(20)
    );
create table Employee(
	EmpNo int primary key,
    EmpName varchar(10),
    DepNo int
    );
alter table employee add foreign key (depno) references department(depno) on delete set null;
insert into department (depno, dname, location) values
	(101, "HR", "Delhi"),
    (102, "Sales", "Bangalore"),
    (103, "Marketing Executive", "Hyderabad"),
    (104, "Technical Engineer", "Chennai");
insert into employee (empno, empname, depno) values
	(1001, "Sahil", 101),
    (1004, "Kavish", 102),
    (1006, "Aditya", 103),
    (1005, "Atul", 104);
select * from department;
select * from employee;

/* ROLLBACK */
-- Rolls back any changes if accidentally deleted
set autocommit=0; -- by default, any changes in data is automatically commited. This command stops that
ROLLBACK;
COMMIT; -- commits the changes. UNDOABLE!
-- It is not possible to rollback data that has been deleted with TRUNCATE

/* CASE Expression */
-- Used to return a value based on specific conditions
select fname, lname, salary,
	case
		when salary=25000 then salary+2500
        else "Not eligible for bonus"
	end as "New salary"
from employee;

select fname, lname, sex,
	case
		when sex="F" then "Female"
        when sex="M" then "Male"
        else "Other"
	end as "Gender"
from employee;

/* Task */
-- Write a case expression that returns employee's full name salary with bonus as below:
	-- if salary is 1000 - 19000 increase 1000 
	-- if salary is 20000 - 29000 increase 2000
	-- if salary is 30000 - 39000 increase 3000
	-- if salary is 40000 - 49000 increase 4000
	-- if salary is 50000 - 59000 increase 5000
	-- if a person receive no salary then should display 'Not eligible for bonus'
select concat(fname, " ", lname) as "Employee", salary as "Salary",
	case
		when salary>=1000 and salary<=19999 then salary+1000
        when salary>=20000 and salary<=29999 then salary+2000
        when salary>=30000 and salary<=39999 then salary+3000
        when salary>=40000 and salary<=49999 then salary+4000
        when salary>=50000 and salary<=59999 then salary+5000
        else "Not eligible for bonus"
	end as "New salary"
from employee;
select * from department;

-- Increase the salary of employees based on their departments
-- for example, if an employee is working in the Research department increase it's salary by 5000, and for other departments as well any amount you want
select concat(fname, " ", lname) as "Employee", salary as "Salary", dname as "Department",
	case
		when dname="Research" then salary+5000
        when dname="Administration" then salary+3000
        when dname="Headquarters" then salary+2000
	end as "New salary"
from employee right join department on dno=dnumber

/* TRIGGER */
-- A block of code which defines a certain action that should happen when a certain operation is performed on the table
DELIMITER $$
CREATE TRIGGER deleteData AFTER DELETE ON Employee FOR EACH ROW
	BEGIN
		INSERT INTO LogInfo (Message) VALUES(CONCAT(OLD.name,' was deleted by ',
        CURRENT_USER(),' on ',CURDATE(),' and ', CURTIME()));
    END$$
    DELIMITER $$
CREATE TRIGGER updateData AFTER UPDATE ON Employee FOR EACH ROW
	BEGIN
    INSERT INTO LogInfo (Message) VALUES(CONCAT(OLD.name,' name was change to ',NEW.name, ' by ', CURRENT_USER()));
END$$
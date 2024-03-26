										/* -- Day 4 -- */
-- CRUD - Create, Retrieve/Read, Update, Delete
/* SELECT */
-- SELECT column1, column2 FROM tableName
use company;
select fname, lname from employee;
select * from employee; -- all columns
select fname, lname, salary from company.employee; -- select from a database that's not the currently used database
select * from employee where fname="Jennifer"; -- all column for specific entry
select ssn, fname, lname, salary from employee where fname="Jennifer";
select * from employee limit 3; -- limit number of rows/records to be displayed
select * from employee limit 2 offset 3; -- limit number of rows/records and ignore specific records

/* Task 1 */
-- display all employees who receive more than 30000 salary;
select * from employee where salary>"30000";
-- display all male employees who receive less than 30000 salary;
select * from employee where salary<"30000" and sex="M";
-- display all male and female employees who receive less than 30000 salary;
select * from employee where (sex="M" or sex="F") and salary<"30000";
-- display all employees who receive salary
select * from employee where salary is not null;

/* ORDER BY */
-- By default, in MySQL, data is sorted by primary key from lowest to highest
-- There are 2 types of sorting order:
	-- ASC - Ascending order (A - Z) or (lowest value to highest value)
	-- DESC - Descending order (Z - A) or (highest value to lowest value)
select * from employee order by fname asc;
select * from employee order by fname desc;
select * from employee order by salary desc;
select * from employee order by fname asc, lname asc;

/* Task 2 */
-- select an employee who is receiving highest salary
select * from employee order by salary desc limit 1;
-- select an employee who is receiving  lowest salary
select * from employee order by salary asc limit 1;
-- select top five employess who are receiving highest salary
select * from employee order by salary desc limit 5;
-- select employee who is receiving second lowest salary;
select * from employee order by salary desc limit 1 offset 1;
-- select female employee who is receiving highest salary
select * from employee where sex="F" order by salary desc limit 1;
-- select male employee who is receiving lowest salary
select * from employee where sex="M" order by salary asc limit 1;
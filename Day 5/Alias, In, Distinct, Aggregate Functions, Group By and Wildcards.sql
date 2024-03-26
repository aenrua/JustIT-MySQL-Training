										/* -- Day 5 -- */
/* MySQL Alias */
-- Used to temporarily rename columns
select fname as "First Name", lname as "Last Name", salary, address from employee;

/* IN */
-- Used to select several certain columns in a table
select * from employee where fname in("John", "Jennifer", "Ahmad", "Alicia");

/* DISTINCT */
-- Used to select unique data
select distinct salary from employee;

/* Aggregate Functions */
-- AVG() - the average of all the data
-- MAX() - that maximum of all the data
-- MIN() - the minimum of all the data
-- SUM() - the total of all the data
-- COUNT() - counts the number of rows that contain the specified data
select avg(salary) as "Average Salary" from employee;
select sum(salary) as "Total Salary" from employee;
select count(salary) "Total No# of Emp" from employee;

select max(salary) as "Max Salary", min(salary) as "Min Salary" from employee;
select max(salary) as "M - Max Salary", min(salary) as "M - Min Salary" from employee where sex="M";

/* GROUP BY */
select sex, count(*) as "No# of Emp" from employee where sex is not null group by sex; -- displays how many male and female employees are working in the company
select sex, max(salary) as "Max Salary" from employee where sex is not null group by sex; -- find the highest salary for each gender

/* Wildcards */
-- A way of defining patterns to match specific data
	-- LIKE - special SQL keyword used as a wild card
	-- % - any number of character
	-- _ - one character
select * from employee where fname like "J%"; -- find values that start with the letter J
select * from employee where fname like "%n"; -- find values that end with the letter n
select * from employee where fname like "%Ra%"; -- find values that have the letters Ra together
select * from employee where fname like "_o%"; -- find values that have the letter o as a second character
select * from employee where fname like "J____%"; -- find values that start with the letter J and are at least 5 characters in length
select * from employee where fname like "R%h"; -- find values that start with the letter R and end with h

/* Task */
-- SELECT all employees who's first name has 'h' as second character
-- SELECT employees who has 'me' in their first name.
-- SELECT employees who's first name can be anything but should have 'oh' after first character.
-- SELECT record of employee who is born in 1965.
-- DISPLAY all employees who's first name starts with A and ends with d.
-- DISPLAY all employees who's first name start with J and does not end with n.
select * from employee where fname like "_h%";
select * from employee where fname like "%me%";
select * from employee where fname like "_oh%";
select * from employee where year(bdate)=1965;
select * from employee where fname like "A%d";
select * from employee where fname like "J%" and fname not like "%n";
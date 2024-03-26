										/* -- Day 7 -- */
/* String Methods */
-- TRIM() - Used to remove extra space from left and right side of a string
-- LTRIM() - Used to remove extra space from left side of a string
-- RTRIM() - Used to remove extra space from right side of a string
-- UCASE() - Used to display a string in uppercase
-- LCASE() - Used to display a string in lowercase
select ucase(concat(fname, " ", lname)) as "Employee" from employee;

/* Date Methods */
-- NOW()/CURRENT_TIMESTAMP() - Returns the current date and time
-- CURDATE()/CURRENT_DATE - Returns the current date
-- CURTIME()/CURRENT_TIME - Returns the current time
-- MONTHNAME() - Displays the month name from a date
-- DAYNAME() - Displays the day name from a date
-- DAY() - Displays the day from a date
-- YEAR() - Displays the year from a date
select now();
select curdate();
select current_time();
select monthname("2024-01-20");
select monthname(current_date());
select dayname("2024-01-20");
select dayname(curdate());
select day("2024-01-20");
select year(current_date());

select concat(dayname(curdate()), ", ", day(curdate()), " ", monthname(curdate()), " ", year(curdate())) as "Today's date";
-- select date_format(curdate(), '%W, %e %M %Y') as "Today's date"; - alternative
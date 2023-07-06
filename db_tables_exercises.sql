SHOW databases;
USE albums_db;
SELECT database();
SHOW tables;
USE employees;
SHOW TABLES;
DESCRIBE employees;

/* Q: Which table(s) do you think contain a numeric type column?
 A: DIFFERENT DATA TYPES PRESENT ARE enum('M','F') and date type

Q: Which table(s) do you think contain a numeric type column?
A: likely that all tables will use numeric type columns, definitely employees and salaries

Q: Which table(s) do you think contain a string type column? 
A: employees, titles, departments, dept_emp, dept_manager likely use string type columns

Q: Which table(s) do you think contain a date type column?
A: employees and salaries likely use date type columns. likely to indicate date of hiring or date of payment

Q: What is the relationship between the employees and the departments tables?
A: employees and departments do not have a relationship, other than they are in the same database
*/
SHOW CREATE TABLE dept_manager;
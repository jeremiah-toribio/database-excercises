SHOW tables;
USE employees;

SELECT * FROM titles
LIMIT 2;

-- Q2. 7 Titles
SElECT COUNT(DISTINCT title)
FROM titles;

-- Q3.
SELECT last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;

-- Q4.
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name, first_name;

-- Q5. Chleq, Lindqvist, Qiwen
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

 -- Q6. 189, 190, 168
SELECT last_name, count(last_name)
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- Q7.
SELECT first_name, COUNT(*) AS name_count, gender
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya'
GROUP BY first_name, gender;

-- Q8.
SELECT COUNT(CONCAT(SUBSTR(LOWER(first_name), 1, 1), SUBSTR(lower(last_name), 1, 4), "_", 
SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)))
AS username
FROM employees
ORDER BY username;

-- Q9. 13251

SELECT CONCAT(SUBSTR(LOWER(first_name), 1, 1), SUBSTR(LOWER(last_name), 1, 4), "_", 
SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))
AS username, COUNT(*) as dupes
FROM employees
GROUP BY username
HAVING COUNT(*) > 1
ORDER BY dupes desc;

-- BONUS

-- Q1. 
select * from salaries limit 5;

SELECT AVG(salary)
FROM salaries
GROUP BY salary;

-- Q2.
SELECT *
FROM dept_emp
LIMIT 4;

SELECT COUNT(dept_no) 
FROM dept_emp
GROUP BY dept_no;

-- Q3.
SELECT COUNT(salary), emp_no
FROM salaries
GROUP BY emp_no;

-- Q4. 
SELECT MAX(salary), emp_no
FROM salaries
GROUP BY emp_no;

-- Q5.
SELECT MIN(salary), emp_no
FROM salaries
GROUP BY emp_no;

-- Q6.
SELECT STD(salary)
FROM salaries;

-- Q7.
SELECT MAX(salary), emp_no
FROM salaries
GROUP BY emp_no, salary
HAVING salary > 150000;

-- Q8.
SELECT AVG(salary), emp_no
FROM salaries
GROUP BY emp_no, salary
HAVING salary BETWEEN 80000 and 90000;
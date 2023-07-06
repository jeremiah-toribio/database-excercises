USE employees;

SHOW tables;
DESCRIBE employees;

SELECT *
FROM employees;

SELECT emp_no, first_name AS short_names
FROM employees
WHERE length(first_name) < 4 
AND emp_no > 10400 AND emp_no < 10500
ORDER BY emp_no ASC;


------------------------------------

SELECT emp_no, first_name
FROM employees
WHERE first_name IN ('Irena','Vidya','Maya');

/*
Q: What is the employee number of the top three results?
A: 10200, 10397, 10610
*/

SELECT emp_no, first_name
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

/*
Q: What is the employee number of the top three results? Does it match the previous question?
A: 10200, 10397, 10610
*/

SELECT emp_no, first_name, gender
FROM employees
WHERE (first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya')
AND gender = 'M';

/*
Q: What is the employee number of the top three results.
A: 10200, 10397, 10821
*/

SELECT DISTINCT last_name
FROM employees
WHERE last_name like 'E%';

SELECT DISTINCT last_name
FROM employees
WHERE last_name like 'E%'
OR last_name like '%E';

SELECT DISTINCT last_name
FROM employees
WHERE last_name like '%E'
AND last_name not like 'E%';

SELECT DISTINCT last_name
FROM employees
WHERE last_name like 'E%'
AND last_name like '%E';


SELECT *
FROM employees
WHERE hire_date like '199%';

-- 10008, 10011, 10012

SELECT *
FROM employees
WHERE birth_date LIKE '19%%-12-25';

-- 10078, 10115, 10261

SELECT *
FROM employees
WHERE birth_date LIKE '19%%-12-25'
AND hire_date like '199%';

-- 10261, 10438, 10681

SELECT DISTINCT last_name
FROM employees
WHERE last_name like '%q%';

SELECT DISTINCT last_name
FROM employees
WHERE last_name like '%q%'
AND last_name not like '%qu%';
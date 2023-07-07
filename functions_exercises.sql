USE employees;
SELECT * FROM employees
LIMIT 2;

-- Q2.
SELECT CONCAT(first_name,' ', last_name)
AS full_name
FROM employees
WHERE last_name LIKE 'E%E';
-- Q3.
SELECT CONCAT(UPPER(first_name),' ', UPPER(last_name))
AS full_name
FROM employees
WHERE last_name LIKE 'E%E';
-- Q4.
SELECT COUNT(CONCAT(UPPER(first_name),' ', UPPER(last_name)))
AS total_names
FROM employees
WHERE last_name LIKE 'E%E';
-- Q5.
SELECT DATEDIFF(CURDATE(), hire_date) AS days_in_company
FROM employees
WHERE birth_date LIKE '19%%-12-25'
AND hire_date like '199%';
-- Q6.
SELECT MIN(salary),MAX(salary)
from salaries;
-- Q7.
SELECT CONCAT(SUBSTR(LOWER(first_name), 1, 1), SUBSTR(lower(last_name), 1, 4), "_", 
SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)) AS username, first_name, last_name, birth_date
FROM employees
LIMIT 10;


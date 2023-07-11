USE join_example_db;
SHOW tables;
DESCRIBE roles;
-- id (pk)
DESCRIBE users;
-- id (pk), role_id(mul)

SELECT *
FROM users
JOIN roles
ON roles.id = users.id;

SELECT u.name, role_id
FROM users AS u
RIGHT JOIN roles AS r
USING (id);

-- -- -- -- -- -- --

USE employees;
SHOW tables;

DESCRIBE departments;
-- dept_no (pk), dept_name(uni)
DESCRIBE dept_emp;
-- emp_no (pk), dept_no (pk)
DESCRIBE dept_manager;
-- emp_no (pk), dept_no (pk)
DESCRIBE employees;
-- emp_no (pk)
DESCRIBE salaries;
-- emp_no (pk), from_date (pk)
DESCRIBE titles;
-- emp_no (pk), title (pk), from_date(pk)

Select *
from employees
-- order by from_date desc
limit 10;


-- Q2.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
	JOIN dept_manager AS dm
		ON dm.emp_no = e.emp_no
	JOIN departments AS d
		ON d.dept_no = dm.dept_no
	JOIN titles AS t
		ON t.emp_no = e.emp_no
WHERE t.to_date = '9999-01-01';

-- Q3.
SELECT dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name, t.title
FROM employees AS e
	JOIN dept_manager AS de
		ON de.emp_no = e.emp_no
	JOIN departments AS d
		ON d.dept_no = de.dept_no
	JOIN titles AS t
		ON t.emp_no = e.emp_no
WHERE t.to_date = '9999-01-01' AND e.gender = 'F';

-- Q4.
SELECT * from titles;

SELECT t.title as Title, COUNT(t.title) as Count
FROM employees AS e
	JOIN dept_manager AS dm
		ON dm.emp_no = e.emp_no
	JOIN departments AS d
		ON d.dept_no = dm.dept_no
	JOIN titles AS t
		ON t.emp_no = e.emp_no
	JOIN dept_emp AS de
		ON de.emp_no = e.emp_no
WHERE d.dept_no = 'd009' AND t.to_date = '9999-01-01'
GROUP BY t.title;

-- Q5. 

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, max(s.salary)
FROM employees AS e
	JOIN dept_manager AS dm
		ON dm.emp_no = e.emp_no
	JOIN departments AS d
		ON d.dept_no = dm.dept_no
	JOIN salaries as s
		ON s.emp_no = e.emp_no
WHERE s.to_date = '9999-01-01'
GROUP BY e.emp_no;

-- Q6.
SELECT d.dept_no, d.dept_name, count(e.emp_no)
FROM employees AS e
	JOIN dept_emp AS de
		ON de.emp_no = e.emp_no
	JOIN departments AS d
		ON d.dept_no = de.dept_no
	JOIN titles AS t
		ON t.emp_no = e.emp_no
WHERE t.to_date = '9999-01-01'
GROUP BY d.dept_no;

-- Q7. Sales
SELECT d.dept_name, AVG(s.salary)
FROM departments as d
	JOIN dept_emp AS de USING (dept_no)
	JOIN salaries as s using (emp_no)
WHERE s.to_date = '9999-01-01' and de.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY avg(s.salary) desc
LIMIT 1;

-- Q8. Akemi Warwick
SELECT e.first_name, e.last_name
FROM employees AS e
	JOIN dept_emp AS de
		ON de.emp_no = e.emp_no
	JOIN departments AS d
		ON d.dept_no = de.dept_no
	JOIN titles AS t
		ON t.emp_no = e.emp_no
	JOIN salaries as s
		ON s.emp_no = e.emp_no
WHERE t.to_date = '9999-01-01' AND s.to_date = '9999-01-01' AND d.dept_no = 'd001'
ORDER BY salary desc
LIMIT 1;

-- Q9. Vishwani Minakawa
select * from dept_manager;

SELECT first_name, last_name, salary, dept_name
FROM departments as d
	join dept_manager as dm using (dept_no)
    join salaries as s using (emp_no)
    join employees as e using (emp_no)
WHERE s.to_date = '9999-01-01' AND dm.to_date = '9999-01-01'
ORDER BY salary desc
LIMIT 1;

-- Q10.
SELECT d.dept_name, avg(s.salary) as avg_salary
from departments as d
	join dept_emp as de on de.dept_no = d.dept_no
    join salaries as s on s.emp_no = de.emp_no
group by d.dept_name
order by avg_salary;

-- BONUS

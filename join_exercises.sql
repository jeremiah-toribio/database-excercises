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
SELECT dept_name, CONCAT(e.first_name, ' ', e.last_name) AS manager_name
FROM departments AS d
	JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no
    JOIN employees AS e
    ON e.emp_no = dm.emp_no
ORDER BY dept_name;




-- Q3.
SELECT dept_name, CONCAT(e.first_name, ' ', e.last_name) AS manager_name
	FROM departments AS d
    JOIN dept_manager AS dm
    USING (dept_no)
    JOIN employees as e
    USING (emp_no)
WHERE dm.to_date = '9999-01-01' AND e.gender = 'F';

-- Q4.
SELECT * from titles;

SELECT t.title AS Title, COUNT(*) as Count
FROM titles AS t
	JOIN dept_emp AS de
		USING (emp_no)
	JOIN departments AS d
		ON d.dept_no = dm.dept_no
WHERE t.to_date = '9999-01-01' AND de.to_date = '9999-01-01'
GROUP BY t.title
ORDER BY t.title;


-- LEFT OFF HERE
-- Q5.

-- how to include dept name without error 
SELECT dept_name, CONCAT(e.first_name, ' ', e.last_name) AS manager_name, salary
FROM departments AS d
	JOIN dept_manager AS dm
		USING (dept_no)
	JOIN salaries AS s
		USING (emp_no)
	JOIN employees AS e
		USING (emp_no)
WHERE s.to_date = '9999-01-01' AND dm.to_date = '9999-01-01'
GROUP BY dept_name;

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

-- Q7.
SELECT d.dept_name, AVG(s.salary) as average_salary
FROM departments as d
	JOIN dept_emp as de
		USING (dept_no)
	JOIN salaries as s
		USING (emp_no)
WHERE t.to_date = '9999-01-01'
GROUP BY dept_name
ORDER BY average_salary desc
LIMIT 1;

-- Q8. Cristinel Bouloucos
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

-- Q9.
select * from dept_manager;

SELECT e.first_name, e.last_name, s.salary -- , d.dept_name
FROM departments as d
	JOIN dept_manager AS dm
		USING (dept_no)
	JOIN salaries as s
		USING (emp_no)
	JOIN employees as
		USING (emp_no)
WHERE t.to_date = '9999-01-01'
ORDER BY salary desc
LIMIT 1;

-- Q10.
SELECT d.dept_name, round(avg(s.salary)) as average_salary
from departments as d
	join dept_emp as de on de.dept_no = d.dept_no
    join salaries as s on s.emp_no = de.emp_no
group by d.dept_name
order by average salary desc;


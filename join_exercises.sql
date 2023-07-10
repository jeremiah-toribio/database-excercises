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

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
	JOIN dept_manager AS dm
		ON dm.emp_no = e.emp_no
	JOIN departments AS d
		ON d.dept_no = dm.dept_no
	JOIN titles AS t
		ON t.emp_no = e.emp_no
WHERE t.to_date = '9999-01-01' AND d.dept_no = "d005";

SELECT e.emp_no, first_name, last_name
from dept_manager as dm
join employees as e on e.emp_no = dm.emp_no
where dm.dept_no = "d005";

-- Q3.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, t.title
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

-- Q5. *
SELECT *
FROM dept_manager
LIMIT 10;

-- how to include dept name without error 
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, max(s.salary)
FROM employees AS e
	JOIN dept_manager AS dm
		ON dm.emp_no = e.emp_no
	JOIN departments AS d
		ON d.dept_no = dm.dept_no
	JOIN salaries as s
		ON s.emp_no = e.emp_no
	JOIN titles AS t
		ON t.emp_no = e.emp_no
WHERE t.to_date = '9999-01-01'
GROUP BY e.emp_no;

-- Q6. had right answer, only getting manager numbers
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
SELECT d.dept_name, AVG(s.salary)
FROM employees AS e
	JOIN dept_manager AS dm
		ON dm.emp_no = e.emp_no
	JOIN departments AS d
		ON d.dept_no = dm.dept_no
	JOIN titles AS t
		ON t.emp_no = e.emp_no
	JOIN dept_emp AS de
		ON de.emp_no = e.emp_no
	JOIN salaries as s
		ON s.emp_no = e.emp_no
WHERE t.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY avg(s.salary) desc
LIMIT 1;

-- Q8. Cristinel Bouloucos
select * from titles limit 10;
select * from salaries as s join employees as e on e.emp_no = s.emp_no
where e.emp_no = '110022' OR e.emp_no = '110039';

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
WHERE t.to_date = '9999-01-01' AND d.dept_no = 'd001'
GROUP BY e.first_name, e.last_name
HAVING max(s.salary)
LIMIT 1;

-- Q9.
select * from dept_manager;

SELECT e.first_name, e.last_name, max(s.salary) -- , d.dept_name
FROM employees AS e
	JOIN dept_manager AS dm
		ON dm.emp_no = e.emp_no
	JOIN departments AS d
		ON d.dept_no = dm.dept_no
	JOIN titles AS t
		ON t.emp_no = e.emp_no
	JOIN dept_emp AS de
		ON de.emp_no = e.emp_no
	JOIN salaries as s
		ON s.emp_no = e.emp_no
WHERE t.to_date = '9999-01-01' -- AND d.dept_no = 'd00%'
GROUP BY e.first_name, e.last_name
HAVING max(s.salary)
LIMIT 1;

-- Q10.
SELECT d.dept_name, avg(s.salary)
from departments as d
	join dept_emp as de on de.dept_no = d.dept_no
    join salaries as s on s.emp_no = de.emp_no
group by d.dept_name;


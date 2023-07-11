USE employees;
DESCRIBE departments;
-- dept_no (pk), dept_name(uni)
DESCRIBE dept_emp;
-- emp_no (pk), dept_no (pk), from_date, to_date
DESCRIBE dept_manager;
-- emp_no (pk), dept_no (pk), from_date, to_date
DESCRIBE employees;
-- emp_no (pk), birth_date, first_name, last_name, gender, hire_date
DESCRIBE salaries;
-- emp_no (pk), from_date (pk), salary, from_date, to_date
DESCRIBE titles;
-- emp_no (pk), title (pk), from_date(pk), to_date


/* scrap
	(
		SELECT emp_no, hire_date, first_name, last_name
        FROM employees
	) as emp
*/

-- 1. Find all the current employees with the same hire date as employee 101010 using a subquery.
SELECT emp_no, CONCAT (first_name, ' ', last_name) as full_name
FROM employees
WHERE hire_date = (
					select hire_date
                    from employees
                    where emp_no = 101010
					);

-- 2. Find all the titles ever held by all current employees with the first name Aamod.
SELECT DISTINCT title, first_name
FROM titles as t
JOIN (select first_name, emp_no
		from employees
		where first_name = 'Aamod')
        as a on a.emp_no = t.emp_no
WHERE t.to_date > NOW() AND a.first_name = 'Aamod';

-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
-- 240124 for titles table
-- 91479


SELECT DISTINCT count(*)
FROM employees e
JOIN (SELECT to_date, emp_no
		FROM titles
        WHERE to_date < NOW())
        AS t ON t.emp_no = e.emp_no;
        
SELECT count(to_date)
FROM dept_emp de
WHERE to_date in (select to_date from dept_emp where to_date < NOW());

-- 4. Find all the current department managers that are female. List their names in a comment in your code.
/* 4. Answer
'Isamu Legleitner'
'Shirish Ossenbruggen'
'Karsten Sigstam'
'Krassimir Wegerle'
'Rosine Cools'
'Leon DasSarma'
'Peternela Onuegbe'
'Rutger Hofmeyr'
'Sanjoy Quadeer'
'Hilary Kambil'
'Tonny Butterworth'
'Marjo Giarratana'
'Xiaobin Spinelli'
*/
SELECT CONCAT(e.first_name, ' ', e.last_name) as female_manager
FROM dept_manager dm
JOIN (SELECT first_name, last_name, gender, emp_no
					FROM employees
                    WHERE gender = 'F') e
                    ON e.emp_no = dm.emp_no;
                    
-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT CONCAT(e.first_name, ' ', e.last_name) as full_name
FROM salaries as s
JOIN (SELECT first_name, last_name, emp_no
		FROM employees) as e
        ON e.emp_no = s.emp_no
WHERE s.salary > (select AVG(salary) from salaries)
GROUP BY full_name;

-- 6. How many current salaries are within 1 standard deviation of the current highest salary?
-- (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
-- 78, .0027% / .03% of all historical salaries

SELECT round(max(salary) - stddev(salary)) as onestd
FROM salaries
WHERE to_date > NOW();
 
SELECT
(WITH salary_count AS (
SELECT count(*) as one_std
FROM salaries
WHERE salary > (SELECT ROUND(max(salary) - stddev(salary)) FROM salaries) AND to_date > NOW()
)
SELECT one_std from salary_count) / (SELECT count(salary) FROM salaries WHERE to_date > now()) * 100; -- , (select salary / one_std from salary_count);

WHERE s.to_date > NOW;
-- 1 stddev
SELECT ROUND(STDDEV(salary),0)
from salaries;
-- 16905 stdv

-- highest historical salary
SELECT MAX(salary)
from salaries;
-- 158220

-- difference between max salary and stddev
SELECT (158220 - 16905)
-- 141315 is 1 std away
show databases;
show tables;
use robinson_2289;
show tables;
/* 1.
Using the example from the lesson, create a temporary table called employees_with_departments
that contains first_name, last_name, and dept_name for employees currently with that department.
Be absolutely sure to create this table on your own database. If you see "Access denied for user ...",
it means that the query was attempting to write a new table to a database that you can only read.
*/

create temporary table employees_with_departments as 
	(select first_name, last_name, dept_name
		from employees.employees e
        join employees.dept_emp de
        using (emp_no)
        join employees.departments d
        using (dept_no));
        

select max(length(first_name)), max(length(last_name))
from employees_with_departments;

-- 1a.
ALTER TABLE employees_with_departments ADD full_name VARCHAR(31);
-- 1b..
UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);
-- 1c.
ALTER TABLE employees_with_departments DROP first_name, DROP last_name;
-- 1d.
SELECT dept_name, CONCAT(first_name, ' ', last_name) as full_name
from employees.employees
join employees.dept_emp
using (emp_no)
join employees.departments
using (dept_no);

/* 2.
Create a temporary table based on the payment table from the sakila database.
Write the SQL necessary to transform the amount column such that it is stored as an integer
representing the number of cents of the payment. For example, 1.99 should become 199.
*/
use robinson_2289;

CREATE temporary table payz as (select * from sakila.payment);
describe payz;
select * from payz;
-- changing data type to char to be able to drop decimal without changing number
ALTER TABLE payz MODIFY amount char(5);
-- drop decimal
UPDATE payz SET amount = REPLACE(amount, '.', '');
-- convert back into integer
ALTER TABLE payz MODIFY amount int unsigned;



/* 3.
Go back to the employees database. Find out how the current average pay in each department compares
 to the overall current pay for everyone at the company. For this comparison, you will calculate
 the z-score for each salary. In terms of salary, what is the best department right now to work for? 
 The worst?
*/
use employees;

CREATE TEMPORARY TABLE
dept_avg AS (SELECT AVG(salary) AS avg_dept_salary
FROM departments as d
JOIN dept_emp de
ON de.dept_no = de.dept_no
JOIN salaries s
ON s.emp_no = de.emp_no
WHERE de.to_date > NOW()
AND s.to_date > NOW()
group by dept_name);

create temporary table metrics 
(SELECT AVG(salary) as overall,
STDDEV(salary) as stdv 
from employees.salaries s
where s.to_date > now());

-- mean values
ALTER TABLE dept_avgs
ADD overll_avg float;
-- stdev values
ALTER TABLE dept_avgs
ADD overall_std FLOAT:
-- z values
ALTER TABLE dept_avgs
ADD zscore FLOAT;

UPDATE dept_avgs
SET overall_avg =
	(
    SELECT overall from metrics
    );
    
UPDATE dept_avgs;
SET zscore = (dept_avg - overall_avg) / overall_std;

/* Subquery attempt
SELECT dept_name,
(WITH avg_dept AS(
SELECT AVG(salary) AS avg_dept_salary
FROM departments as d
JOIN dept_emp de
ON de.dept_no = de.dept_no
JOIN salaries s
ON s.emp_no = de.emp_no
WHERE de.to_date > NOW()
AND s.to_date > NOW()
group by dept_name)
SELECT avg_dept_salary from avg_dept) 
/
STDDEV(salary) as z_score
from departments;
*/

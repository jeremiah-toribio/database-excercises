use albums_db;
show tables;
describe albums;
-- id (pk), artist, name, release_date, sales, genre

SELECT *
FROM albums
WHERE release_date > (select avg(release_date) from albums);

-- -- -- --

Use farmers_market;
show tables;
describe customer;
-- customer_id (pk), customer_first_name, customer_last_name, customer_zip
describe vendor;

describe booth;

####################################################
-- case_exercises.sql

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
-- emp_no (pk), from_date (pk), to_date, salary
DESCRIBE titles;
-- emp_no (pk), title (pk), from_date(pk), to_date

-- 1.Write a query that returns all employees, their department number, their start date, 
-- their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company
-- and 0 if not. DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.

select de.dept_no, de.from_date, de.to_date, 
		if(to_date > now(), true, false) is_current_employee
from dept_emp de;

-- 2. Write a query that returns all employee names (previous and current), 
-- and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending
--  on the first letter of their last name.

select e.first_name, e.last_name, 
	case 
    when e.last_name BETWEEN 'A%' and 'H%' then 'A-H'
    when e.last_name between 'I%' and 'Q%'then 'I-Q'
    when e.last_name between 'R%' and 'Z%' then 'R-Z'
    else 'bravo_group'
    end as alpha_group
FROM employees e;

-- 3. How many employees (current or previous) were born in each decade?
/* 
3A. 50s 182886, 60s 117138
*/
select max(birth_date) from employees;

select
count(case when birth_date like '195%' then 'fifty_baby' else null end) as fifties_baby,
count(case when birth_date like '196%' then 'sixty_baby' else null end) as sixties_baby
from employees;

-- 4. What is the current average salary for each of the following department groups:
--  R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
/* 4A.
'S&M','86368.8643'
'F&H','71107.7403'
'R&D','67709.2620'
'Q&P','67328.4982'
'CS','67285.2302'
*/
select dept_name, dept_no from departments order by dept_no;

select
    dept_name, avg(salary) as avg_sal
from employees e
join dept_emp de
	on de.emp_no = e.emp_no AND de.to_date > now()
join salaries s
	on s.emp_no = e.emp_no and s.to_date > now()
join departments d
	on d.dept_no = de.dept_no
group by dept_name
order by avg_sal desc;


select
	case
    when d.dept_no IN ('d008', 'd005') then 'R&D'
	when d.dept_no in ('d001', 'd007') then 'S&M'
	when d.dept_no in ('d004', 'd006') then 'Q&P'
	when d.dept_no IN ('d002', 'd003') then 'F&H'
	when d.dept_no in ('d009') then 'CS'
    else null
    end as dept_group,
    avg(salary) as avg_sal
from employees e
join dept_emp de
	on de.emp_no = e.emp_no AND de.to_date > now()
join salaries s
	on s.emp_no = e.emp_no and s.to_date > now()
join departments d
	on d.dept_no = de.dept_no
group by dept_group
order by avg_sal desc;

USE employees;
SHOW tables;
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


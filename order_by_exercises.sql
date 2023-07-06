USE employees;
SHOW Tables;


SELECT *
FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name DESC;

/*
Q: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
A: Irena Reutenauer, Vidya Awdeh
*/

SELECT *
FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY first_name, last_name;

/*
Q: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
A: Irena Acton | Vidya Zweizig
*/

SELECT *
FROM employees
WHERE first_name IN ('Irena','Vidya','Maya')
ORDER BY last_name, first_name;

/*
Q: What is the employee number of the top three results.
A: Irena Acton, Maya Zyda
*/

SELECT *
FROM employees
WHERE last_name like 'E%'
AND last_name like '%E'
ORDER BY emp_no;

/*
Q: Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
A: 899 employees, 10021 Ramzi Erde, 499648 Tadahiro Erde
*/

SELECT *
FROM employees
WHERE last_name like 'E%'
AND last_name like '%E'
ORDER BY hire_date DESC;

/*
Q: Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
A: 899 employees, Teiji Eldridge, Sergi Erde
*/

SELECT *
FROM employees
WHERE birth_date LIKE '19%%-12-25'
AND hire_date like '199%'
ORDER BY hire_date, birth_date DESC;

/*
Q: Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
A: 362 Employees, Khun Bernini, Alselm Cappello
*/

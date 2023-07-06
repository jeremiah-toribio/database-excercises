USE employees;

SHOW tables;

SELECT *
FROM employees;

SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

-- Zykh, Zyda, Zwicker, Zweizig, Zumaque, Zultner, Zucker, Zubarek, Zschoche, Zongker

SELECT *
FROM employees
WHERE birth_date LIKE '19%%-12-25'
AND hire_date like '199%'
ORDER BY hire_date
LIMIT 5;

-- Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, Petter Stroustrup

SELECT *
FROM employees
WHERE birth_date LIKE '19%%-12-25'
AND hire_date like '199%'
ORDER BY hire_date
LIMIT 5
OFFSET 10;

-- Kendra Stafford, Sanjai Isaac, Aiichiro Neiman, Kwangjo Bage, Tamiya Kambil


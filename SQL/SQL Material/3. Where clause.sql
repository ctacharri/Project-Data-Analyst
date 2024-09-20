-- WHERE CLAUSE

SELECT*
FROM parks_and_recreation.employee_salary;

SELECT *
FROM parks_and_recreation.employee_salary
WHERE first_name = 'Leslie'
;

SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary <= 50000;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender = 'female'
;

#tidak sama dengan
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender != 'female'
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
;

-- AND OR NOT -- LOGICAL OPERATORS
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male'
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'male'
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male'
;

#PEMDAS
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age >55
;


-- LIKE STATEMENT (SPECIFIC VALUE)
-- % (ANYTHING) and _ (Specific)

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a%'
;

# 'a__' means ada huruf a __ dan 2 karakter
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a__'
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a___'
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a'
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE '1989%'
;
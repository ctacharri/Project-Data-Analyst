USE `Parks_and_Recreation`;

-- STRING FUNCTIONS

# LENGTH

SELECT LENGTH('skyfall');

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2
;

#UPPER & LOWER
SELECT UPPER('sky');
SELECT LOWER('SKY');

SELECT first_name, UPPER(first_name)
FROM employee_demographics;

#TRIM
SELECT TRIM('         sky       ');
SELECT LTRIM('         sky       ');
SELECT RTRIM('         sky       ');

SELECT first_name,
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name,3,2), #3(posisi), 2(berapa karakter yang mau diambil)
birth_date,
SUBSTRING(birth_date,6,2) AS birth_month
FROM employee_demographics;

#Replace

SELECT first_name, REPLACE(first_name, 'a','z')
FROM employee_demographics;

#LOCATE (mencari nilai x di posisi ke berapa)
SELECT LOCATE('x','Alexander');

SELECT first_name, LOCATE('An',first_name)
FROM employee_demographics;

#CONCATE
SELECT first_name, last_name,
CONCAT(first_name,' ',last_name) AS full_name
FROM employee_demographics;

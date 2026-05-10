-- Limiting and Aliasing

SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;
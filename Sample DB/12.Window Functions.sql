-- Window Functions

SELECT gender, AVG(salary) AS Avg_Salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

SELECT dem.first_name, dem.last_name,  gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;

-- CTE
WITH CTE_Example AS
(
SELECT gender, AVG(salary) Avg_Sal, MAX(salary) Max_Sal, MIN(salary) Min_Sal, COUNT(salary) Count_Sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(Avg_Sal) FROM 
CTE_Example;
-- both are same output the different is CTE is easy to read than other
SELECT AVG(Avg_Sal) FROM
(SELECT gender, AVG(salary) Avg_Sal, MAX(salary) Max_Sal, MIN(salary) Min_Sal, COUNT(salary) Count_Sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender) AS Example
;

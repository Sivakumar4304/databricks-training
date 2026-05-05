SELECT * FROM employee;

SELECT name, salary FROM employee;

SELECT * FROM employee WHERE salary > 50000;

SELECT * FROM employee WHERE age < 30;

SELECT * FROM employee ORDER BY salary DESC;

SELECT COUNT(*) FROM employee;

SELECT department_id, AVG(salary) 
FROM employee 
GROUP BY department_id;

SELECT * FROM employee WHERE name LIKE 'J%';

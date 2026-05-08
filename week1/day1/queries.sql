-- =========================================
-- SQL Practice Queries (1 - 10)
-- =========================================

-- Question 1:
-- Select all columns from the Employee table.

SELECT * FROM Employee;


-- Question 2:
-- Select only the name and salary columns from the Employee table.

SELECT name, salary FROM Employee;


-- Question 3:
-- Select employees who are older than 30.

SELECT * FROM Employee
WHERE age > 30;


-- Question 4:
-- Select the names of all departments.

SELECT name FROM Department;


-- Question 5:
-- Select employees who work in the IT department.

SELECT * FROM Employee
WHERE department_id = 1;


-- =========================================
-- String Matching Queries
-- =========================================

-- Question 6:
-- Select employees whose names start with 'J'.

SELECT * FROM Employee
WHERE name LIKE 'J%';


-- Question 7:
-- Select employees whose names end with 'e'.

SELECT * FROM Employee
WHERE name LIKE '%e';


-- Question 8:
-- Select employees whose names contain 'a'.

SELECT * FROM Employee
WHERE name LIKE '%a%';


-- Question 9:
-- Select employees whose names are exactly 9 characters long.

SELECT * FROM Employee
WHERE LENGTH(name) = 9;


-- Question 10:
-- Select employees whose names have 'o' as the second character.

SELECT * FROM Employee
WHERE name LIKE '_o%';

-- =========================================
-- Date Queries
-- =========================================

-- Question 11:
-- Select employees hired in the year 2020.

SELECT * FROM Employee
WHERE YEAR(hire_date) = 2020;


-- Question 12:
-- Select employees hired in January of any year.

SELECT * FROM Employee
WHERE MONTH(hire_date) = 1;


-- Question 13:
-- Select employees hired before 2019.

SELECT * FROM Employee
WHERE hire_date < '2019-01-01';


-- Question 14:
-- Select employees hired on or after March 1, 2021.

SELECT * FROM Employee
WHERE hire_date >= '2021-03-01';


-- Question 15:
-- Select employees hired in the last 2 years.

SELECT * FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);


-- =========================================
-- Aggregate Queries
-- =========================================

-- Question 16:
-- Select the total salary of all employees.

SELECT SUM(salary) AS total_salary
FROM Employee;


-- Question 17:
-- Select the average salary of employees.

SELECT AVG(salary) AS average_salary
FROM Employee;


-- Question 18:
-- Select the minimum salary in the Employee table.

SELECT MIN(salary) AS minimum_salary
FROM Employee;


-- Question 19:
-- Select the number of employees in each department.

SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id;


-- Question 20:
-- Select the average salary of employees in each department.

SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id;


-- =========================================
-- Group By Queries
-- =========================================

-- Question 21:
-- Select the total salary for each department.

SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;


-- Question 22:
-- Select the average age of employees in each department.

SELECT department_id, AVG(age) AS average_age
FROM Employee
GROUP BY department_id;


-- Question 23:
-- Select the number of employees hired in each year.

SELECT YEAR(hire_date) AS hire_year,
COUNT(*) AS employee_count
FROM Employee
GROUP BY YEAR(hire_date);


-- Question 24:
-- Select the highest salary in each department.

SELECT department_id, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department_id;


-- Question 25:
-- Select the department with the highest average salary.

SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC
LIMIT 1;


-- =========================================
-- Having Queries
-- =========================================

-- Question 26:
-- Select departments with more than 2 employees.

SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;


-- Question 27:
-- Select departments with an average salary greater than 55000.

SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;


-- Question 28:
-- Select years with more than 1 employee hired.

SELECT YEAR(hire_date) AS hire_year,
COUNT(*) AS employee_count
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;


-- Question 29:
-- Select departments with a total salary expense less than 100000.

SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;


-- Question 30:
-- Select departments with the maximum salary above 75000.

SELECT department_id, MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;

-- =========================================
-- Order By Queries
-- =========================================

-- Question 31:
-- Select all employees ordered by salary in ascending order.

SELECT * FROM Employee
ORDER BY salary ASC;


-- Question 32:
-- Select all employees ordered by age in descending order.

SELECT * FROM Employee
ORDER BY age DESC;


-- Question 33:
-- Select employees ordered by hire date.

SELECT * FROM Employee
ORDER BY hire_date;


-- Question 34:
-- Select employees ordered by department_id and salary.

SELECT * FROM Employee
ORDER BY department_id, salary DESC;


-- Question 35:
-- Select the top 3 highest paid employees.

SELECT * FROM Employee
ORDER BY salary DESC
LIMIT 3;


-- =========================================
-- Join Queries
-- =========================================

-- Question 36:
-- Select employee names along with their department names.

SELECT e.name AS employee_name,
d.name AS department_name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;


-- Question 37:
-- Select all projects along with their department names.

SELECT p.name AS project_name,
d.name AS department_name
FROM Project p
JOIN Department d
ON p.department_id = d.department_id;


-- Question 38:
-- Select employees and projects belonging to the same department.

SELECT e.name AS employee_name,
p.name AS project_name
FROM Employee e
JOIN Project p
ON e.department_id = p.department_id;


-- Question 39:
-- Select employees who do not belong to any department.

SELECT * FROM Employee
WHERE department_id IS NULL;


-- Question 40:
-- Select projects that do not belong to any department.

SELECT * FROM Project
WHERE department_id IS NULL;

-- =========================================
-- Advanced Join Queries
-- =========================================

-- Question 41:
-- Select employee names and their department names using LEFT JOIN.

SELECT e.name AS employee_name,
d.name AS department_name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;


-- Question 42:
-- Select all departments and their employees.

SELECT d.name AS department_name,
e.name AS employee_name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id;


-- Question 43:
-- Select department names and the number of employees in each department.

SELECT d.name AS department_name,
COUNT(e.emp_id) AS employee_count
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id
GROUP BY d.name;


-- Question 44:
-- Select project names and the employees working in the same department.

SELECT p.name AS project_name,
e.name AS employee_name
FROM Project p
JOIN Employee e
ON p.department_id = e.department_id;


-- Question 45:
-- Select employees earning more than the average salary.

SELECT *
FROM Employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM Employee
);

-- =========================================
-- Nested Queries
-- =========================================

-- Question 46:
-- Select employees working in the HR department.

SELECT *
FROM Employee
WHERE department_id =
(
    SELECT department_id
    FROM Department
    WHERE name = 'HR'
);


-- Question 47:
-- Select employees whose salary is equal to the maximum salary.

SELECT *
FROM Employee
WHERE salary =
(
    SELECT MAX(salary)
    FROM Employee
);


-- Question 48:
-- Select departments having more employees than the average employee count.

SELECT department_id,
COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) >
(
    SELECT AVG(emp_count)
    FROM
    (
        SELECT COUNT(*) AS emp_count
        FROM Employee
        GROUP BY department_id
    ) AS dept_counts
);


-- Question 49:
-- Select employees hired before the earliest employee in department 4.

SELECT *
FROM Employee
WHERE hire_date <
(
    SELECT MIN(hire_date)
    FROM Employee
    WHERE department_id = 4
);


-- Question 50:
-- Select employees whose salary is greater than the average salary of their department.

SELECT *
FROM Employee e
WHERE salary >
(
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- =========================================
-- Additional SQL Practice Queries
-- =========================================

-- Question 51:
-- Select all employees whose salary is between 50000 and 70000.

SELECT *
FROM Employee
WHERE salary BETWEEN 50000 AND 70000;


-- Question 52:
-- Select employees whose age is not between 25 and 35.

SELECT *
FROM Employee
WHERE age NOT BETWEEN 25 AND 35;


-- Question 53:
-- Select all employees whose department_id is either 1 or 3.

SELECT *
FROM Employee
WHERE department_id IN (1, 3);


-- Question 54:
-- Select employees whose department_id is not 2.

SELECT *
FROM Employee
WHERE department_id <> 2;


-- Question 55:
-- Select all employees with NULL department_id.

SELECT *
FROM Employee
WHERE department_id IS NULL;


-- =========================================
-- DISTINCT Queries
-- =========================================

-- Question 56:
-- Select distinct department IDs from Employee table.

SELECT DISTINCT department_id
FROM Employee;


-- Question 57:
-- Select distinct salaries from Employee table.

SELECT DISTINCT salary
FROM Employee;


-- Question 58:
-- Select distinct hire years from Employee table.

SELECT DISTINCT YEAR(hire_date) AS hire_year
FROM Employee;


-- =========================================
-- LIMIT Queries
-- =========================================

-- Question 59:
-- Select first 5 employees from Employee table.

SELECT *
FROM Employee
LIMIT 5;


-- Question 60:
-- Select 3 employees with lowest salary.

SELECT *
FROM Employee
ORDER BY salary ASC
LIMIT 3;

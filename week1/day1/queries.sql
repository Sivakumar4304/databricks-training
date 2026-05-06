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

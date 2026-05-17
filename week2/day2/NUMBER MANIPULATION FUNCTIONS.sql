-- =====================================================
-- NUMBER MANIPULATION FUNCTIONS IN MYSQL
-- =====================================================

/*
TOPICS COVERED
--------------
1. ABS()
2. ROUND()
3. CEIL()
4. FLOOR()
5. TRUNCATE()
6. MOD()
7. POWER() / POW()
8. SQRT()
9. SIGN()
10. RAND()
11. FORMAT()
12. GREATEST()
13. LEAST()

OBJECTIVE
---------
To practice numeric manipulation functions
using employee salary data in MySQL.
*/

-- =====================================================
-- TABLE CREATION
-- =====================================================

CREATE TABLE employee_salary (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    base_salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    tax_percent DECIMAL(5,2),
    experience_years INT
);

-- =====================================================
-- INSERT SAMPLE DATA
-- =====================================================

INSERT INTO employee_salary VALUES
(1, 'Karthik', 75000.75, 5000.50, 10.00, 6),
(2, 'Veena', 65000.40, 4000.25, 8.50, 4),
(3, 'Ravi', 85000.90, 6000.75, 12.00, 8),
(4, 'Anil', 70000.10, NULL, 9.00, 5),
(5, 'Suresh', 60000.55, 3000.30, 7.50, 3);

-- =====================================================
-- ABS() : ABSOLUTE VALUE
-- =====================================================

SELECT ABS(-100) AS absolute_value;

-- =====================================================
-- ROUND() : ROUND VALUES
-- =====================================================

SELECT
    emp_name,

    ROUND(base_salary,0)
    AS rounded_salary

FROM employee_salary;

SELECT
    emp_name,

    ROUND(base_salary,2)
    AS rounded_two_decimals

FROM employee_salary;

-- =====================================================
-- CEIL() : ROUND UP
-- =====================================================

SELECT
    emp_name,

    CEIL(base_salary)
    AS ceil_salary

FROM employee_salary;

-- =====================================================
-- FLOOR() : ROUND DOWN
-- =====================================================

SELECT
    emp_name,

    FLOOR(base_salary)
    AS floor_salary

FROM employee_salary;

-- =====================================================
-- TRUNCATE() : CUT DECIMALS
-- =====================================================

SELECT
    emp_name,

    TRUNCATE(base_salary,1)
    AS truncated_salary

FROM employee_salary;

-- =====================================================
-- MOD() : REMAINDER
-- =====================================================

SELECT
    emp_name,

    MOD(experience_years,2)
    AS remainder

FROM employee_salary;

-- =====================================================
-- POWER() / POW()
-- =====================================================

SELECT POWER(2,3) AS power_result;

SELECT POW(5,2) AS pow_result;

-- =====================================================
-- SQRT() : SQUARE ROOT
-- =====================================================

SELECT SQRT(64) AS square_root;

-- =====================================================
-- SIGN() : NUMBER SIGN
-- =====================================================

SELECT
    emp_name,

    SIGN(base_salary)
    AS salary_sign

FROM employee_salary;

-- =====================================================
-- RAND() : RANDOM NUMBER
-- =====================================================

SELECT RAND() AS random_number;

-- =====================================================
-- FORMAT() : FORMAT NUMBER
-- =====================================================

SELECT
    emp_name,

    FORMAT(base_salary,2)
    AS formatted_salary

FROM employee_salary;

-- =====================================================
-- GREATEST() : MAXIMUM VALUE
-- =====================================================

SELECT
    emp_name,

    GREATEST(
        base_salary,
        IFNULL(bonus,0)
    ) AS greatest_value

FROM employee_salary;

-- =====================================================
-- LEAST() : MINIMUM VALUE
-- =====================================================

SELECT
    emp_name,

    LEAST(
        base_salary,
        IFNULL(bonus,0)
    ) AS least_value

FROM employee_salary;

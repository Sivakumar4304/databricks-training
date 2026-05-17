
-- =====================================================
-- Employee Compensation Classification - Q1
-- =====================================================

CREATE TABLE employee_payments (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    base_salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    joining_date DATE
);

INSERT INTO employee_payments VALUES
(1,'karthik','Data',75000.75,5000.50,'2019-03-15'),
(2,'veena','HR',65000.40,4000.25,'2021-06-20'),
(3,'ravi','Data',85000.90,6000.75,'2016-01-10'),
(4,'anil','Finance',70000.10,NULL,'2020-09-01'),
(5,'suresh','HR',60000.55,3000.30,'2022-11-25');

-- =====================================================
-- QUERY 1
-- Convert emp_name to UPPER, LOWER and Proper Case
-- =====================================================

SELECT
    emp_name,

    UPPER(emp_name) AS upper_name,

    LOWER(emp_name) AS lower_name,

    CONCAT(
        UPPER(LEFT(emp_name,1)),
        LOWER(SUBSTRING(emp_name,2))
    ) AS proper_name

FROM employee_payments;

-- =====================================================
-- QUERY 2
-- Calculate Total Income (NULL Safe)
-- =====================================================

SELECT
    emp_name,

    base_salary,

    bonus,

    base_salary + IFNULL(bonus,0)
    AS total_income

FROM employee_payments;

-- =====================================================
-- QUERY 3
-- Round Total Income to Nearest Integer
-- =====================================================

SELECT
    emp_name,

    ROUND(base_salary + IFNULL(bonus,0))
    AS rounded_total_income

FROM employee_payments;

-- =====================================================
-- QUERY 4
-- Extract Joining Year
-- =====================================================

SELECT
    emp_name,

    joining_date,

    YEAR(joining_date) AS joining_year

FROM employee_payments;

-- =====================================================
--  USE CASES
 --QUERY 1
-- Senior if experience > 7 years
-- =====================================================

SELECT
    emp_name,

    TIMESTAMPDIFF(
        YEAR,
        joining_date,
        CURDATE()
    ) AS experience_years,

    CASE
        WHEN TIMESTAMPDIFF(
                YEAR,
                joining_date,
                CURDATE()
             ) > 7
        THEN 'Senior'

        ELSE 'Not Senior'
    END AS employee_status

FROM employee_payments;

-- =====================================================
-- CASE QUERY 2
-- Mid if experience between 4 and 7 years
-- =====================================================

SELECT
    emp_name,

    TIMESTAMPDIFF(
        YEAR,
        joining_date,
        CURDATE()
    ) AS experience_years,

    CASE
        WHEN TIMESTAMPDIFF(
                YEAR,
                joining_date,
                CURDATE()
             ) BETWEEN 4 AND 7
        THEN 'Mid'

        ELSE 'Not Mid'
    END AS employee_status

FROM employee_payments;

-- =====================================================
-- CASE QUERY 3
-- Junior otherwise
-- =====================================================

SELECT
    emp_name,

    TIMESTAMPDIFF(
        YEAR,
        joining_date,
        CURDATE()
    ) AS experience_years,

    CASE
        WHEN TIMESTAMPDIFF(
                YEAR,
                joining_date,
                CURDATE()
             ) < 4
        THEN 'Junior'

        ELSE 'Not Junior'
    END AS employee_status

FROM employee_payments;


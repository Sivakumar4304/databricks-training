-- =====================================================
-- NULL FUNCTIONS IN MYSQL
-- =====================================================

/*
TOPICS COVERED
--------------
1. IS NULL
2. IS NOT NULL
3. IFNULL()
4. COALESCE()
5. NULLIF()
6. Real-Time NULL Handling

OBJECTIVE
---------
To practice handling NULL values using
different MySQL functions and conditions.
*/

-- =====================================================
-- TABLE 1 : EMPLOYEES
-- =====================================================

CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(50),
    salary INT,
    bonus INT,
    manager_id INT
);

INSERT INTO Employees VALUES
(1, 'Amit', 50000, NULL, 101),
(2, 'John', NULL, 5000, 102),
(3, 'Sara', 60000, NULL, NULL),
(4, 'David', NULL, NULL, 103),
(5, 'Priya', 45000, 3000, 101),
(6, 'Kiran', NULL, NULL, NULL),
(7, 'Ravi', 70000, 7000, 102),
(8, 'Neha', NULL, 2000, NULL);

-- =====================================================
-- TABLE 2 : ORDERS
-- =====================================================

CREATE TABLE Orders (
    order_id INT,
    customer_name VARCHAR(50),
    amount INT,
    discount INT,
    coupon_code VARCHAR(20)
);

INSERT INTO Orders VALUES
(101, 'Amit', 1000, NULL, 'DISC10'),
(102, 'John', NULL, 50, NULL),
(103, 'Sara', 2000, NULL, 'DISC20'),
(104, 'David', NULL, NULL, NULL),
(105, 'Priya', 1500, 100, NULL),
(106, 'Kiran', NULL, NULL, 'DISC5'),
(107, 'Ravi', 3000, NULL, NULL),
(108, 'Neha', NULL, 200, 'DISC15');

-- =====================================================
-- TABLE 3 : PRODUCTS
-- =====================================================

CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(50),
    price INT,
    category VARCHAR(50),
    stock INT
);

INSERT INTO Products VALUES
(1, 'Laptop', 50000, 'Electronics', 10),
(2, 'Phone', NULL, 'Electronics', NULL),
(3, 'Tablet', 30000, NULL, 5),
(4, 'Headphones', NULL, NULL, NULL),
(5, 'Monitor', 20000, 'Electronics', 0),
(6, 'Keyboard', NULL, 'Accessories', 15),
(7, 'Mouse', 500, NULL, NULL),
(8, 'Printer', NULL, 'Electronics', 3);

-- =====================================================
-- LEVEL 1 : BASIC NULL QUERIES
-- =====================================================

-- Show all employees whose salary is NULL

SELECT *
FROM Employees
WHERE salary IS NULL;

-- Show all orders where discount is NOT NULL

SELECT *
FROM Orders
WHERE discount IS NOT NULL;

-- Get products where category is NULL

SELECT *
FROM Products
WHERE category IS NULL;

-- Count number of employees with NULL manager_id

SELECT COUNT(*) AS null_manager_count
FROM Employees
WHERE manager_id IS NULL;

-- =====================================================
-- LEVEL 2 : IFNULL()
-- =====================================================

-- Replace NULL salary with 0

SELECT
    name,
    salary,
    IFNULL(salary,0) AS updated_salary
FROM Employees;

-- Replace NULL bonus with 1000

SELECT
    name,
    bonus,
    IFNULL(bonus,1000) AS updated_bonus
FROM Employees;

-- Show order amount, if NULL replace with 500

SELECT
    customer_name,
    amount,
    IFNULL(amount,500) AS final_amount
FROM Orders;

-- Replace NULL stock with 0

SELECT
    product_name,
    stock,
    IFNULL(stock,0) AS updated_stock
FROM Products;

-- =====================================================
-- LEVEL 3 : COALESCE()
-- =====================================================

-- Show employee earnings using salary,
-- if NULL use bonus

SELECT
    name,

    COALESCE(salary, bonus)
    AS employee_earnings

FROM Employees;

-- Show first available value:
-- salary -> bonus -> 0

SELECT
    name,

    COALESCE(salary, bonus, 0)
    AS first_available_income

FROM Employees;

-- Show product price:
-- price -> 1000

SELECT
    product_name,

    COALESCE(price,1000)
    AS final_price

FROM Products;

-- Get customer payment:
-- amount -> discount -> 0

SELECT
    customer_name,

    COALESCE(amount, discount, 0)
    AS customer_payment

FROM Orders;

-- =====================================================
-- LEVEL 4 : NULLIF()
-- =====================================================

-- Convert salary to NULL if salary = 0

SELECT
    name,

    NULLIF(salary,0)
    AS updated_salary

FROM Employees;

-- Convert discount to NULL if discount = 0

SELECT
    customer_name,

    NULLIF(discount,0)
    AS updated_discount

FROM Orders;

-- Avoid divide by zero

SELECT
    amount / NULLIF(discount,0)
    AS division_result

FROM Orders;

-- Replace coupon_code with NULL if DISC10

SELECT
    customer_name,

    NULLIF(coupon_code,'DISC10')
    AS updated_coupon

FROM Orders;

-- =====================================================
-- LEVEL 5 : REAL-TIME SCENARIOS
-- =====================================================

-- Calculate total earnings

SELECT
    name,

    salary,

    bonus,

    IFNULL(salary,0)
    +
    IFNULL(bonus,0)
    AS total_earnings

FROM Employees;

-- Employees where both salary and bonus are NULL

SELECT *
FROM Employees
WHERE salary IS NULL
AND bonus IS NULL;

-- Products where price is NULL
-- but category is NOT NULL

SELECT *
FROM Products
WHERE price IS NULL
AND category IS NOT NULL;

-- Orders where both amount and discount are NULL

SELECT *
FROM Orders
WHERE amount IS NULL
AND discount IS NULL;

-- =====================================================
-- LEVEL 6 : ADVANCED NULL HANDLING
-- =====================================================

-- Show employee income

SELECT
    name,

    COALESCE(salary, bonus, 1000)
    AS employee_income

FROM Employees;

-- Replace empty discount with NULL

SELECT
    customer_name,

    NULLIF(discount,0)
    AS updated_discount

FROM Orders;

-- Final payable amount

SELECT
    customer_name,

    IFNULL(amount,0)
    -
    IFNULL(discount,0)
    AS final_payable_amount

FROM Orders;

-- Employees where salary is NULL
-- but manager exists

SELECT *
FROM Employees
WHERE salary IS NULL
AND manager_id IS NOT NULL;

-- =====================================================
-- QUESTION 3 : Customer Spending Pattern
-- =====================================================

CREATE TABLE customer_spending (
    cust_id INT,
    cust_name VARCHAR(50),
    city VARCHAR(30),
    purchase_amount DECIMAL(10,2),
    purchase_date DATE
);

INSERT INTO customer_spending VALUES
(1,'amit','mumbai',12000.75,'2024-12-01'),
(2,'neha','delhi',8500.40,'2024-12-15'),
(3,'rohit','mumbai',15500.90,'2024-11-20'),
(4,'kavya','chennai',6000.10,'2024-10-05');

-- =====================================================
-- QUERY 1
-- Customer name with first letter capitalized
-- =====================================================

SELECT
    cust_name,

    CONCAT(
        UPPER(LEFT(cust_name,1)),
        LOWER(SUBSTRING(cust_name,2))
    ) AS proper_name

FROM customer_spending;

-- =====================================================
-- QUERY 2
-- Display month name of purchase
-- =====================================================

SELECT
    cust_name,

    purchase_date,

    MONTHNAME(purchase_date)
    AS purchase_month

FROM customer_spending;

-- =====================================================
-- QUERY 3
-- Round purchase amount
-- =====================================================

SELECT
    cust_name,

    purchase_amount,

    ROUND(purchase_amount)
    AS rounded_amount

FROM customer_spending;

-- =====================================================
-- QUERY 4
-- Absolute value of purchase amount
-- =====================================================

SELECT
    cust_name,

    purchase_amount,

    ABS(purchase_amount)
    AS absolute_amount

FROM customer_spending;

-- =====================================================
-- QUERY 5
-- Customer classification using CASE statement
-- =====================================================

SELECT
    cust_name,

    purchase_amount,

    CASE
        WHEN purchase_amount > 15000
        THEN 'High Spender'

        WHEN purchase_amount BETWEEN 8000 AND 15000
        THEN 'Medium Spender'

        ELSE 'Low Spender'
    END AS spender_type

FROM customer_spending;

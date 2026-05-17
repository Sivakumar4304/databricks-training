-- =====================================================
-- QUESTION 2 : Order Delivery Delay Analysis
-- =====================================================

CREATE TABLE orders_delivery (
    order_id INT,
    customer_name VARCHAR(50),
    order_date DATE,
    delivery_date DATE,
    order_amount DECIMAL(10,2)
);

INSERT INTO orders_delivery VALUES
(101,'rajesh','2025-01-01','2025-01-05',12500.75),
(102,'meena','2025-01-10','2025-01-10',8400.40),
(103,'arun','2025-01-15','2025-01-20',15600.90),
(104,'pooja','2025-01-18',NULL,9200.10);

-- =====================================================
-- QUERY 1
-- Convert customer name to uppercase
-- =====================================================

SELECT
    customer_name,

    UPPER(customer_name) AS upper_name

FROM orders_delivery;

-- =====================================================
-- QUERY 2
-- Calculate delivery days
-- =====================================================

SELECT
    customer_name,

    order_date,

    delivery_date,

    DATEDIFF(
        IFNULL(delivery_date,CURDATE()),
        order_date
    ) AS delivery_days

FROM orders_delivery;

-- =====================================================
-- QUERY 4
-- Truncate order amount to 1 decimal
-- =====================================================

SELECT
    customer_name,

    order_amount,

    TRUNCATE(order_amount,1)
    AS truncated_amount

FROM orders_delivery;

-- =====================================================
-- QUERY 5
-- Delivery status using CASE statement
-- =====================================================

SELECT
    customer_name,

    CASE
        WHEN delivery_date IS NULL
        THEN 'Pending'

        WHEN DATEDIFF(delivery_date, order_date) = 0
        THEN 'Same-day'

        WHEN DATEDIFF(delivery_date, order_date) > 3
        THEN 'Delayed'

        ELSE 'Normal'
    END AS delivery_status

FROM orders_delivery;

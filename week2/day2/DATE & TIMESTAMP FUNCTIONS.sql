-- =====================================================
-- DAY 2 : DATE & TIMESTAMP FUNCTIONS IN MYSQL
-- =====================================================

/*
TOPICS COVERED
--------------
1. Current Date & Time Functions
2. DATE and TIMESTAMP Data Types
3. Extracting Year, Month and Day
4. EXTRACT() Function
5. MONTHNAME() and DAYNAME()
6. WEEKDAY() and DAYOFWEEK()
7. Weekend & Weekday Identification
8. DATE_ADD() and DATE_SUB()
9. DATEDIFF() and TIMESTAMPDIFF()
10. LAST_DAY() and First Day Logic
11. DATE_FORMAT()
12. STR_TO_DATE()
13. TIMESTAMP Formatting
14. Filter By Month
15. Financial Year CASE Logic
16. Real-Time Business Use Cases
*/

-- =====================================================
-- SAMPLE TABLE STRUCTURE
-- =====================================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    order_timestamp TIMESTAMP,
    delivery_date DATE,
    order_amount DECIMAL(10,2)
);

-- =====================================================
-- INSERT SAMPLE DATA
-- =====================================================

INSERT INTO orders VALUES
(1, 'Karthik', '2024-01-15', '2024-01-15 10:30:45', '2024-01-20', 2500.00),
(2, 'Veena', '2024-02-18', '2024-02-18 18:45:20', '2024-02-22', 3200.50),
(3, 'Ravi', '2024-03-02', '2024-03-02 09:15:10', '2024-03-08', 4100.75),
(4, 'Anil', '2024-03-09', '2024-03-09 14:05:55', '2024-03-15', 1800.00),
(5, 'Suresh', '2024-01-07', '2024-01-07 23:55:00', '2024-01-12', 2900.00);

-- =====================================================
-- CURRENT DATE & TIME FUNCTIONS
-- =====================================================

SELECT CURDATE() AS current_date;

SELECT CURRENT_DATE() AS current_date_function;

SELECT CURTIME() AS current_time;

SELECT CURRENT_TIME() AS current_time_function;

SELECT NOW() AS current_datetime;

SELECT CURRENT_TIMESTAMP AS current_timestamp;

-- =====================================================
-- DATE & TIMESTAMP DATA TYPES
-- =====================================================

/*
DATE      -> YYYY-MM-DD
TIME      -> HH:MM:SS
DATETIME  -> Date + Time
TIMESTAMP -> Date + Time with timezone support
*/

-- =====================================================
-- EXTRACTING YEAR, MONTH, DAY
-- =====================================================

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    DAY(order_date) AS day
FROM orders;

-- =====================================================
-- EXTRACT USING EXTRACT()
-- =====================================================

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    EXTRACT(DAY FROM order_date) AS day
FROM orders;

-- =====================================================
-- MONTH NAME & DAY NAME
-- =====================================================

SELECT
    MONTHNAME(order_date) AS month_name,
    DAYNAME(order_date) AS day_name
FROM orders;

-- =====================================================
-- WEEKDAY() & DAYOFWEEK()
-- =====================================================

SELECT
    WEEKDAY(order_date) AS weekday_number,
    DAYOFWEEK(order_date) AS dayofweek_number
FROM orders;

-- =====================================================
-- IDENTIFY WEEKENDS USING DAYNAME()
-- =====================================================

SELECT
    order_id,
    order_date
FROM orders
WHERE DAYNAME(order_date)
IN ('Saturday','Sunday');

-- =====================================================
-- IDENTIFY WEEKENDS USING DAYOFWEEK()
-- =====================================================

SELECT
    order_id,
    order_date
FROM orders
WHERE DAYOFWEEK(order_date)
IN (1,7);

-- =====================================================
-- IDENTIFY WEEKDAYS
-- =====================================================

SELECT
    order_id,
    order_date
FROM orders
WHERE DAYOFWEEK(order_date)
BETWEEN 2 AND 6;

-- =====================================================
-- DATE ARITHMETIC : ADD DAYS
-- =====================================================

SELECT
    order_date,

    DATE_ADD(order_date,
    INTERVAL 5 DAY) AS add_5_days

FROM orders;

-- =====================================================
-- DATE ARITHMETIC : SUBTRACT DAYS
-- =====================================================

SELECT
    order_date,

    DATE_SUB(order_date,
    INTERVAL 3 DAY) AS subtract_3_days

FROM orders;

-- =====================================================
-- ADD MONTHS
-- =====================================================

SELECT
    DATE_ADD(order_date,
    INTERVAL 1 MONTH)
AS next_month
FROM orders;

-- =====================================================
-- SUBTRACT MONTHS
-- =====================================================

SELECT
    DATE_SUB(order_date,
    INTERVAL 2 MONTH)
AS previous_month
FROM orders;

-- =====================================================
-- ADD YEARS
-- =====================================================

SELECT
    DATE_ADD(order_date,
    INTERVAL 1 YEAR)
AS next_year
FROM orders;

-- =====================================================
-- DATEDIFF()
-- =====================================================

SELECT
    order_id,

    DATEDIFF(
        delivery_date,
        order_date
    ) AS delivery_days

FROM orders;

-- =====================================================
-- TIMESTAMPDIFF()
-- =====================================================

SELECT
    TIMESTAMPDIFF(
        DAY,
        order_date,
        delivery_date
    ) AS days_diff,

    TIMESTAMPDIFF(
        MONTH,
        order_date,
        delivery_date
    ) AS months_diff

FROM orders;

-- =====================================================
-- LAST DAY OF MONTH
-- =====================================================

SELECT
    LAST_DAY(order_date)
AS last_day
FROM orders;

-- =====================================================
-- FIRST DAY OF MONTH
-- =====================================================

SELECT
    DATE_SUB(
        order_date,
        INTERVAL DAY(order_date)-1 DAY
    ) AS first_day

FROM orders;

-- =====================================================
-- DATE FORMAT
-- =====================================================

SELECT
    DATE_FORMAT(order_date,'%d-%m-%Y')
AS formatted_date
FROM orders;

SELECT
    DATE_FORMAT(order_date,'%M %d, %Y')
AS formatted_full_date
FROM orders;

-- =====================================================
-- FORMAT SPECIFIERS
-- =====================================================

/*
%Y -> Full Year         (2024)
%y -> Short Year        (24)

%m -> Month Number      (01-12)
%M -> Month Name        (January)

%d -> Day Number        (01-31)
%W -> Weekday Name      (Monday)

%H -> Hour              (00-23)
%i -> Minutes           (00-59)
%s -> Seconds           (00-59)
*/

-- =====================================================
-- STRING TO DATE
-- =====================================================

SELECT
    STR_TO_DATE(
        '15-01-2024',
        '%d-%m-%Y'
    ) AS converted_date;

-- =====================================================
-- TIMESTAMP FORMATTING
-- =====================================================

SELECT
    DATE_FORMAT(
        order_timestamp,
        '%d-%m-%Y %H:%i:%s'
    ) AS formatted_timestamp

FROM orders;

-- =====================================================
-- FILTER BY MONTH NUMBER
-- =====================================================

SELECT *
FROM orders
WHERE MONTH(order_date) = 1;

-- =====================================================
-- FILTER BY MONTH NAME
-- =====================================================

SELECT *
FROM orders
WHERE MONTHNAME(order_date) = 'February';

-- =====================================================
-- FINANCIAL YEAR LOGIC
-- =====================================================

SELECT
    order_date,

    CASE
        WHEN MONTH(order_date) >= 4

        THEN CONCAT(
            YEAR(order_date),
            '-',
            YEAR(order_date)+1
        )

        ELSE CONCAT(
            YEAR(order_date)-1,
            '-',
            YEAR(order_date)
        )

    END AS financial_year

FROM orders;

-- =====================================================
-- ORDERS IN LAST 7 DAYS
-- =====================================================

SELECT *
FROM orders
WHERE order_date >=
CURDATE() - INTERVAL 7 DAY;

-- =====================================================
-- ORDERS PLACED TODAY
-- =====================================================

SELECT *
FROM orders
WHERE DATE(order_timestamp)
= CURDATE();

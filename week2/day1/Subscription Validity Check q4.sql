-- =====================================================
-- QUESTION 4 : Subscription Validity Check
-- =====================================================

CREATE TABLE subscriptions (
    user_id INT,
    user_email VARCHAR(100),
    start_date DATE,
    end_date DATE,
    subscription_fee DECIMAL(10,2)
);

INSERT INTO subscriptions VALUES
(1,'karthik@gmail.com','2024-01-01','2025-01-01',12000.50),
(2,'veena@yahoo.com','2024-06-15','2024-12-15',8500.75),
(3,'ravi@hotmail.com','2023-03-01','2024-03-01',15000.90);

-- =====================================================
-- QUERY 1
-- Extract email domain
-- =====================================================

SELECT
    user_email,

    SUBSTRING_INDEX(user_email,'@',-1)
    AS email_domain

FROM subscriptions;

-- =====================================================
-- QUERY 2
-- Calculate subscription duration in months
-- =====================================================

SELECT
    user_email,

    TIMESTAMPDIFF(
        MONTH,
        start_date,
        end_date
    ) AS subscription_months

FROM subscriptions;

-- =====================================================
-- QUERY 3
-- Format subscription fee with commas
-- =====================================================

SELECT
    user_email,

    FORMAT(subscription_fee,2)
    AS formatted_fee

FROM subscriptions;

-- =====================================================
-- QUERY 4
-- Find remaining days from today
-- =====================================================

SELECT
    user_email,

    end_date,

    DATEDIFF(end_date,CURDATE())
    AS remaining_days

FROM subscriptions;

-- =====================================================
-- QUERY 5
-- Subscription status using CASE statement
-- =====================================================

SELECT
    user_email,

    end_date,

    CASE
        WHEN end_date < CURDATE()
        THEN 'Expired'

        WHEN DATEDIFF(end_date,CURDATE()) <= 30
        THEN 'Expiring Soon'

        ELSE 'Active'
    END AS subscription_status

FROM subscriptions;

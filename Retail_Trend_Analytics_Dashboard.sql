-- Retail_Trend_Analytics Dashboard View SQL


DROP VIEW IF EXISTS vw_dashboard_kpis;
DROP VIEW IF EXISTS vw_revenue_by_product_line;
DROP VIEW IF EXISTS vw_average_rating_by_product_line;
DROP VIEW IF EXISTS vw_quantity_by_product_line;
DROP VIEW IF EXISTS vw_payment_method_distribution;
DROP VIEW IF EXISTS vw_revenue_by_branch;
DROP VIEW IF EXISTS vw_revenue_by_customer_type;
DROP VIEW IF EXISTS vw_revenue_by_gender;

CREATE VIEW vw_dashboard_kpis AS
SELECT
    ROUND(SUM(revenue), 2) AS total_revenue,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_quantity_sold,
    ROUND(AVG(rating), 2) AS average_rating,
    ROUND(SUM(gross_income), 2) AS gross_income,
    ROUND(AVG(revenue), 2) AS avg_transaction_value
FROM supermarket_sales;

CREATE VIEW vw_revenue_by_product_line AS
SELECT
    product_line AS category,
    ROUND(SUM(revenue), 2) AS revenue
FROM supermarket_sales
GROUP BY product_line
ORDER BY revenue DESC;

CREATE VIEW vw_average_rating_by_product_line AS
SELECT
    product_line AS category,
    ROUND(AVG(rating), 2) AS avg_rating
FROM supermarket_sales
GROUP BY product_line
ORDER BY avg_rating DESC;

CREATE VIEW vw_quantity_by_product_line AS
SELECT
    product_line AS category,
    SUM(quantity) AS quantity_sold
FROM supermarket_sales
GROUP BY product_line
ORDER BY quantity_sold DESC;

CREATE VIEW vw_payment_method_distribution AS
SELECT
    payment_method AS category,
    COUNT(*) AS transactions,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM supermarket_sales), 1) AS transaction_share_pct
FROM supermarket_sales
GROUP BY payment_method
ORDER BY transactions DESC;

CREATE VIEW vw_revenue_by_branch AS
SELECT
    branch AS category,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(revenue) * 100.0 / (SELECT SUM(revenue) FROM supermarket_sales), 1) AS revenue_share_pct
FROM supermarket_sales
GROUP BY branch
ORDER BY revenue DESC;

CREATE VIEW vw_revenue_by_customer_type AS
SELECT
    customer_type AS category,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(revenue) * 100.0 / (SELECT SUM(revenue) FROM supermarket_sales), 1) AS revenue_share_pct
FROM supermarket_sales
GROUP BY customer_type
ORDER BY revenue DESC;

CREATE VIEW vw_revenue_by_gender AS
SELECT
    gender_customer AS category,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(revenue) * 100.0 / (SELECT SUM(revenue) FROM supermarket_sales), 1) AS revenue_share_pct
FROM supermarket_sales
GROUP BY gender_customer
ORDER BY revenue DESC;

-- Optional check queries
-- SELECT * FROM vw_dashboard_kpis;
-- SELECT * FROM vw_revenue_by_product_line;
-- SELECT * FROM vw_average_rating_by_product_line;
-- SELECT * FROM vw_quantity_by_product_line;
-- SELECT * FROM vw_payment_method_distribution;
-- SELECT * FROM vw_revenue_by_branch;
-- SELECT * FROM vw_revenue_by_customer_type;
-- SELECT * FROM vw_revenue_by_gender;

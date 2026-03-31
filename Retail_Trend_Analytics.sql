--Supermarket Sales Trend Analysis

--Revenue by product line

SELECT 
    product_line AS category,
    SUM(revenue) AS revenue
FROM supermarket_sales
GROUP BY product_line
ORDER BY revenue DESC;



--Revenue by Branch

SELECT 
    branch AS category,
    SUM(revenue) AS revenue
FROM supermarket_sales
GROUP BY branch
ORDER BY revenue DESC;


--Quantity sold by product line

SELECT 
    product_line AS category,
    SUM(quantity) AS quantity_sold
FROM supermarket_sales
GROUP BY product_line
ORDER BY quantity_sold DESC;


--Average Rating by product line

SELECT 
    product_line AS category,
    AVG(rating) AS avg_rating
FROM supermarket_sales
GROUP BY product_line
ORDER BY avg_rating DESC;


--Payment Method Distribution

SELECT 
    payment_method AS category,
    COUNT(*) AS transactions
FROM supermarket_sales
GROUP BY payment_method;


--Revenue by Customer type

SELECT 
    customer_type AS category,
    SUM(revenue) AS revenue
FROM supermarket_sales
GROUP BY customer_type;



--Revenue by Gender


SELECT 
    gender_customer AS category,
    SUM(revenue) AS revenue
FROM supermarket_sales
GROUP BY gender_customer;




create database walmart_db;
USE walmart_db;

select count(*) from walmart;

select * from walmart limit 10;

select Distinct payment_method from walmart;

select payment_method, 
count(*) from walmart
GROUP BY payment_method; 

select count(distinct branch) Branch from walmart;

select MAX(quantity) from walmart;
select MIN(quantity) from walmart;

-- Business problems
-- Q.1 find different payment method and no of trnsactions, no. of quantity sold
select payment_method, 
count(*) as no_payments,
sum(Quantity) as no_quantity_sold from walmart
GROUP BY payment_method;

-- Q.2 identify the highest rated category in each branch, displaying the branch, category, avg rating
WITH category_avg_rating AS (
    SELECT branch, category, AVG(rating) AS avg_rating
    FROM walmart
    GROUP BY branch, category
),
ranked_categories AS (
    SELECT branch, category, avg_rating,
           RANK() OVER (PARTITION BY branch ORDER BY avg_rating DESC) AS rank_position
    FROM category_avg_rating
)
SELECT branch, category, ROUND(avg_rating, 2) AS avg_rating
FROM ranked_categories
WHERE rank_position = 1
ORDER BY branch;

-- Q.3 Identify the busiest day for each branch based on the number of transactions
SELECT branch, day_name, no_transactions
FROM (
    SELECT 
        branch,
        DAYNAME(STR_TO_DATE(date, '%d/%m/%Y')) AS day_name,
        COUNT(*) AS no_transactions,
        RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) AS ranking
    FROM walmart
    GROUP BY branch, day_name
) AS ranked
WHERE ranking = 1;

-- Q.4 calculate the total quantity of items sold per payment method. List payment method and total quantity
select payment_method, 
sum(Quantity) as no_quantity_sold from walmart
GROUP BY payment_method;

-- Q.5 Determine the avg, Min, Max rating of category for each city.
-- List the city, average_rating, min_rating and max_rating.
select city, category, Min(rating) as min_rating, Max(rating) as max_rating, avg(rating) as avg_rating
from walmart 
group by city, category;

-- Q.6 Calculate the total profit for each category by considering total_profit as
-- (unit_price *quantity * profit_margin). List category and total profit, ordered from highest to lowest profit.
select category,
sum(total) as total_revenue,
sum(total * profit_margin) as profit
from walmart 
group by category;

-- Q.7 Determine the most common payment method for each branch. 
-- Display branch and the preferred_payment_method.
SELECT branch, payment_method, method_count
FROM (
    SELECT branch, payment_method, method_count,
           RANK() OVER (PARTITION BY branch ORDER BY method_count DESC) AS ranked_position
    FROM (
        SELECT branch, 
               payment_method, 
               COUNT(*) AS method_count
        FROM walmart
        GROUP BY branch, payment_method
    ) AS subquery
) AS ranked_data
WHERE ranked_position = 1
ORDER BY branch;

-- Q.8 Categorise sales into three groups Morning, Afternoon and Evening
-- Find out each of the shift and number of invoices
SELECT branch,
       CASE 
           WHEN HOUR(STR_TO_DATE(time, '%H:%i:%s')) < 12 THEN 'Morning'
           WHEN HOUR(STR_TO_DATE(time, '%H:%i:%s')) BETWEEN 12 AND 17 THEN 'Afternoon'
           ELSE 'Evening'
       END AS day_time,
       COUNT(*) AS invoice_count
FROM walmart
GROUP BY branch, day_time
ORDER BY branch;

-- Q.9- Identify 5 branch with highest decrease ratio in revenue compare to last year
-- (current year 2023 and last year 2022) 
SELECT branch,
       revenue_2022,
       revenue_2023,
       ROUND(((revenue_2022 - revenue_2023) / revenue_2022), 2) AS decrease_ratio
FROM (
    SELECT branch,
           SUM(CASE WHEN YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2022 THEN (unit_price * quantity) ELSE 0 END) AS revenue_2022,
           SUM(CASE WHEN YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2023 THEN (unit_price * quantity) ELSE 0 END) AS revenue_2023
    FROM walmart
    GROUP BY branch
) AS yearly_revenue
WHERE revenue_2022 > 0 -- Avoid division by zero
ORDER BY decrease_ratio DESC
LIMIT 5;
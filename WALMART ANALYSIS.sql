CREATE DATABASE WALMART_ANALYSIS

SELECT *
FROM WALMART
-- 1. Find different payment method and number of transactions, number of quantity sold.  
SELECT 
    payment_method,
    COUNT(*) AS no_payments,
    SUM(CAST(quantity AS INT)) AS no_qty_sold
FROM WALMART
GROUP BY payment_method;

-- 2.Identify the highest rated category in each branch,displaying the branch,category and average category.
select
      branch,
      category,
      avg(CAST(rating AS decimal )) as avg_rating
FROM WALMART
group by Branch,category
order by branch, avg_rating DESC;

-- 3.Identify the busiest day for each branch based on the number of transactions.
SELECT 
    [date],
    DATENAME(WEEKDAY,
        COALESCE(
            TRY_CONVERT(date, [date], 103), -- dd/mm/yyyy
            TRY_CONVERT(date, [date], 120)  -- yyyy-mm-dd
        )
    ) AS day_name
FROM WALMART;

--4.Sales by Payment Method
SELECT 
    payment_method,
    COUNT(*) AS no_of_transactions,
    SUM(TRY_CAST(quantity AS INT)) AS total_quantity_sold
FROM WALMART
GROUP BY payment_method
ORDER BY total_quantity_sold DESC;


--5.Sales by Day of Week
SELECT 
    DATENAME(
        WEEKDAY,
        COALESCE(
            TRY_CONVERT(date, [date], 103),
            TRY_CONVERT(date, [date], 120)
        )
    ) AS day_name,
    SUM(CAST(unit_price AS DECIMAL(10,2))) AS total_sales
FROM WALMART
GROUP BY DATENAME(
        WEEKDAY,
        COALESCE(
            TRY_CONVERT(date, [date], 103),
            TRY_CONVERT(date, [date], 120)
        )
)
ORDER BY total_sales DESC;

--6.Top 5 Categories by Revenue
SELECT TOP 5
    category,
    SUM(CAST(unit_price AS DECIMAL(10,2))) AS revenue
FROM WALMART
GROUP BY category
ORDER BY revenue DESC;










 


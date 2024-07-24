SELECT *
FROM (
    SELECT *, 
           SUM(Sales) OVER (ORDER BY date ROWS BETWEEN 2 PRECEDING AND 3 FOLLOWING) AS total_sales
    FROM dbo.Date
    WHERE Sales IS NOT NULL
) AS subquery
ORDER BY total_sales DESC, Sales DESC;

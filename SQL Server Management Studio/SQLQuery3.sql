SELECT *
FROM (
    SELECT *, 
           SUM(Sales) OVER (ORDER BY date ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS total_sales
    FROM dbo.Date
    WHERE Sales IS NOT NULL
) AS subquery
ORDER BY Sales DESC;

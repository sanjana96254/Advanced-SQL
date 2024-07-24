SELECT *
FROM (
    SELECT *, 
           SUM(Sales) OVER (PARTITION BY State ORDER BY Date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
    FROM dbo.running_sum_partition
) AS subquery
ORDER BY ID DESC, Sales DESC;

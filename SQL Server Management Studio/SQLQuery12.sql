SELECT *,
       CASE 
           WHEN DATEDIFF(second, Time, Lead_time) <= 300 THEN 'On Time'   
           ELSE CONVERT(varchar(10), 
               DATEADD(second, DATEDIFF(second, Time, Lead_time), '00:00:00'), 
               108) -- Converts the delay duration to hours:minutes:seconds format
       END AS Status
FROM (
    SELECT *,
           LEAD(Time) OVER (PARTITION BY Train_Number ORDER BY Time) AS Lead_time
    FROM dbo.lag_lead
) AS subquery;

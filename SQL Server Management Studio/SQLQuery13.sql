WITH LagLead AS (
    SELECT *,
           LEAD(Time) OVER (PARTITION BY Train_Number ORDER BY Time) AS Lead_time
    FROM dbo.lag_lead
)

SELECT *,
       CASE 
           WHEN DATEDIFF(SECOND, Time, Lead_time) <= 300 THEN 'On Time'   
           ELSE CONCAT('Delayed by: ', CONVERT(VARCHAR(8), DATEADD(SECOND, DATEDIFF(SECOND, Time, Lead_time), '00:00:00'), 108))
       END AS Status
FROM LagLead;

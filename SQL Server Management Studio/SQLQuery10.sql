SELECT *,
       RANK() OVER (PARTITION BY Stadium_Name, Year ORDER BY Runs) AS [rank]
FROM dbo.Partition_by 
WHERE Country = 'India';


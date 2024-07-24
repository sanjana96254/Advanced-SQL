SELECT Date,
       Unit_sales,
       CAST(AVG(Unit_sales) OVER (ORDER BY Date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
	   AS DECIMAL(5, 2)) AS Three_day_avg,
       AVG(Unit_sales) OVER (ORDER BY Date ROWS BETWEEN 4 PRECEDING AND CURRENT ROW)
	   AS Five_day_avg
FROM dbo.moving_avg;

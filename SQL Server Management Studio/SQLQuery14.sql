/*total runs scored by rohit and virat*/
Select Player, Year, Runs, SUM(Runs) over(partition by player ORDER BY Year ROWS between unbounded preceding and unbounded following)
Total_runs
FROM dbo.player

/* which year scored what percentage runs */
Select Player,Year,Runs, (Runs/SUM(Runs) over(partition by Player ORDER BY Year ROWS between unbounded preceding and unbounded following))*100
Total_runs_percentage
FROM dbo.player

Select Player,Year,Runs,lag(Runs) OVER(PARTITION BY Player ORDER BY Year)-Runs
AS Prev_year_runs
FROM dbo.player

/* count of yrs in how many years they scored runs less than prev yrs */
Select player, SUM(more_runs_less_runs) from
(Select *, case when Prev_year_runs>0 then 1 else 0 end as more_runs_less_runs FROM
(Select Player,Year,Runs,lag(Runs) OVER(PARTITION BY Player ORDER BY Year)-Runs
AS Prev_year_runs
FROM dbo.player) a) b
group by Player

Select Player,Year,Runs,lead(Runs) OVER(PARTITION BY Year ORDER BY Player)
AS Runs_scored_by_virat
FROM dbo.player

/*Count no of years in which rohit scored more than virat*/
Select Player, SUM(diff_runs) FROM
(Select *,case when diff <0 then 1 else 0 end as diff_runs FROM
(Select *, Runs_scored_by_virat-Runs Diff FROM
(Select Player,Year,Runs,lead(Runs) OVER(PARTITION BY Year ORDER BY Player)
AS Runs_scored_by_virat
FROM dbo.player)a
WHERE Runs_scored_by_virat is not null) b) c
GROUP BY Player

Select Player,Year,Runs,lag(Runs) OVER(PARTITION BY Player ORDER BY Year) Prev_year_runs,
lead(Runs) over(PARTITION BY Player ORDER BY Year) Next_year_runs
FROM dbo.player

SELECT Player, SUM(incr_runs) 
FROM 
    (SELECT *,CASE WHEN Prev_year_runs < runs AND runs < Next_year_runs THEN 1 ELSE 0 
         END AS incr_runs 
     FROM 
         (SELECT Player,Year, LAG(Runs) OVER (PARTITION BY Player ORDER BY Year) AS Prev_year_runs,runs,
              LEAD(Runs) OVER (PARTITION BY Player ORDER BY Year) AS Next_year_runs
          FROM dbo.player) a) b
GROUP BY Player;

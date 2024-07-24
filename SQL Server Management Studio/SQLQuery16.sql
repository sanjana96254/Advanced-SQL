select *,RANK() OVER(PARTITION BY Player,Year ORDER BY Runs DESC)
as Rank 
FROM dbo.player 
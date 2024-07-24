select * from
(select *, RANK() OVER(PARTITION BY Stadium_Name,Year ORDER BY Runs DESC)
as Rank 
FROM dbo.Partition_by 
where Country ='India')
AS a
where a.Rank=1
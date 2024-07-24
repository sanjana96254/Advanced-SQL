Select *, RANK() over(partition by Sales order by Dense_Rank desc) emp_rank
from dbo.RANK;
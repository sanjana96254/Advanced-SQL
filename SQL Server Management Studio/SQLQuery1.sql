Select *, RANK() over(order by Sales desc) Rank,
DENSE_RANK() over(order by Sales desc) Dense_Rank,
ROW_NUMBER() over(order by sales desc) Row_number
from dbo.RANK;
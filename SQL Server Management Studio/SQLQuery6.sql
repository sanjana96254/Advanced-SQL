Select *, sum(Sales) over(order by date rows between unbounded preceding and current row) running_sum
from dbo.running_sum
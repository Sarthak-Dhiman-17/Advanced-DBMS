--numbers from 1 to 100
with cte as(
	select 1 as n

	UNION ALL
	select n+1 as n from cte where n<100
)
select * from cte


--print dates from start to end
with cte2 as(
	select CAST('2023-01-01' as DATE) as start_date
	UNION ALL
	select DATEADD(day,1,start_date) from cte2
	where start_date<CAST('2023-01-05' as DATE)
)
select * from cte2
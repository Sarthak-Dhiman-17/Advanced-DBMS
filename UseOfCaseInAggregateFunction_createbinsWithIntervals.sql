CREATE TABLE Session_table (
    Session_id INT PRIMARY KEY,
    Duration INT
);

-- Insert data into the table
INSERT INTO Session_table (Session_id, Duration) VALUES
(1, 30),
(2, 199),
(3, 299),
(4, 580),
(5, 1000);

select * from Session_table

with cte as (
select Session_id,
CASE WHEN Duration*1.00/60 > 0 AND Duration/60 <5 THEN '[0-5>'
	 WHEN ROUND((Duration/60),2) >5 AND ROUND((Duration/60),2) <10 THEN '[5-10>'
	 WHEN ROUND((Duration/60),2) >10 AND ROUND((Duration/60),2) <15 THEN '[10-15>'
	 WHEN ROUND((Duration/60),2) >15 THEN '15 or more'
END as bin
from Session_table)

select bin, COUNT(bin) as Total from cte group by bin


--This solution can count when the column has 0 values different from the above one
select '[0-5>' as bin, SUM(case when Duration/60<5 then 1 else 0 end) as total
from Session_table
union all
select '[5-10>' as bin, SUM(case when Duration/60>=5 and Duration/60<10 then 1 else 0 end) as total
from Session_table
union all
select '[10-15>' as bin, SUM(case when Duration/60>=10 and Duration/60<15 then 1 else 0 end) as total
from Session_table
union all
select '15 or more' as bin, SUM(case when Duration/60>15 then 1 else 0 end) as total
from Session_table
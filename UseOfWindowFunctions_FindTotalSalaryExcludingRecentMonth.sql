

CREATE TABLE Employee6 (
    Id INT,
    Month INT,
    Salary INT
);

INSERT INTO Employee6 (Id, Month, Salary) VALUES
(1, 1, 20),
(2, 1, 20),
(1, 2, 30),
(2, 2, 30),
(3, 2, 40),
(1, 3, 40),
(3, 3, 60),
(1, 4, 60),
(3, 4, 70);

--find total salary of employees excluding the recent one
with cte as(
select *,
SUM(Salary) over (partition by id order by Month rows between unbounded preceding and current row) as total,
row_number() over (partition by id order by Month) as r,
count(*) over (partition by id order by id) as c
from Employee6)

select id, Month, total from cte 
where r<c
order by id asc,Month desc;


--another approach 
with cte as(
select *,
MAX(Month) over (partition by id) as recent_m
from Employee6
)
select Id, Month,
SUM(Salary) over (partition by id order by month) as total
from cte 
where Month !=recent_m
order by id asc,Month desc
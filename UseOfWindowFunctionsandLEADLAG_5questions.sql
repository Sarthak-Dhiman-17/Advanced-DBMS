CREATE TABLE Orders (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Amount INT,
    OrderDate DATETIME
);
INSERT INTO Orders (ID, Name, Amount, OrderDate) VALUES
(1, 'SHALABH', 2200, '2025-04-24 00:26:46.190'), ---190 mili second 
(2, 'SHALABH', 2400, '2025-04-24 00:27:04.760'),
(3, 'SHALABH', 400,  '2025-04-24 00:27:38.850'),
(4, 'AJAY',    200,  '2025-04-24 00:28:28.863'),
(5, 'AJAY',    300,  '2025-04-24 00:28:28.873'),
(6, 'AJAY',    400,  '2025-04-24 00:29:19.200'),
(7, 'AJAY',   9900,  '2025-04-24 00:44:08.757');



select * from Orders order by OrderDate
--previous and next row in 
select * ,
LAG(Amount,1,-1) OVER (ORDER BY OrderDate) as prev_order_amount,
LEAD(Amount,1,-1) OVER (ORDER BY OrderDate) as next_order_amount
from Orders

--absolute difference between current and previous row
select ID,Name, Amount, OrderDate,
ABS(Amount - LAG(Amount,1,0) OVER (ORDER BY OrderDate)) as abs_diff
from Orders

--average of previous current and next row
Select *,
cast((Lead(Amount,1,0) OVER (ORDER BY OrderDate) + 
Amount + Lag(Amount,1,0) OVER (ORDER BY OrderDate))*1.00/3 as decimal(10,2))
from Orders

--find first and last amount of each customer
with cte as(
select *,
FIRST_VALUE(Amount) OVER(PARTITION BY Name Order by OrderDate) as FirstValue,
LAST_VALUE(Amount) 
OVER(PARTITION BY NAME ORDER BY OrderDate ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as LastValue,
row_number() over(partition by Name Order by OrderDate) as r
from Orders)

select * from cte where r=1;

--find customer who made consecutive orders with increasing amount
with cte as(select *,
LAG(Amount,1,0) OVER(Partition by Name ORDER BY OrderDate) as prev_amount,
LEAD(Amount,1,Amount+1) OVER(Partition by Name ORDER BY OrderDate ) as next_amount,
row_number() OVER(Partition by Name order by OrderDate) as r
from Orders),
cte2 as(
select *,
CASE WHEN prev_amount<Amount AND next_amount>Amount THEN 'INCLUDE' ELSE 'NOT' END as status
from cte )

select Name from Orders where Name not in(Select Name from cte2 where status = 'NOT')
group by Name


















WITH CTE AS(
select *,
			lag(amount,1,0) over(partition by name order by orderdate) as prev_order,
			lead(amount,1,Amount+1) over(partition by name order by orderdate) as NEXT_order
from Orders
),CTE2 AS(

SELECT *,
CASE WHEN Amount>prev_order AND Amount<NEXT_order THEN 'INCLUDE' ELSE 'NOT INCLUDE' END AS STATUS
FROM CTE 

)
SELECT NAME FROM Orders WHERE Name NOT IN(
SELECT NAME FROM CTE2 WHERE STATUS='NOT INCLUDE'
) GROUP BY Name

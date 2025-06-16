CREATE TABLE CustomerVisits (
    customer_id INT,
    name VARCHAR(50),
    visited_on DATE,
    amount INT
);

INSERT INTO CustomerVisits (customer_id, name, visited_on, amount)
VALUES 
(1, 'Jhon', '2019-01-01', 100),
(2, 'Daniel', '2019-01-02', 110),
(3, 'Jade', '2019-01-03', 120),
(4, 'Khaled', '2019-01-04', 130),
(5, 'Winston', '2019-01-05', 110),
(6, 'Elvis', '2019-01-06', 140),
(7, 'Anna', '2019-01-07', 150),
(8, 'Maria', '2019-01-08', 80),
(9, 'Jaze', '2019-01-09', 110),
(1, 'Jhon', '2019-01-10', 130),
(3, 'Jade', '2019-01-10', 150);

--find average amount from last 6 days only
with cte as(
select visited_on , SUM(amount) as total_amount
from CustomerVisits
group by visited_on)

,cte2 as(
select visited_on,
sum(total_amount) OVER(ORDER BY visited_on rows between 6 preceding and current row) as amount,
cast(avg(total_amount*1.00) OVER(ORDER BY visited_on rows between 6 preceding and current row) as decimal(10,2)) as average_amount,
row_number() over(order by visited_on) as row_num
from cte)

select visited_on, amount, average_amount
from cte2 
where row_num>=7




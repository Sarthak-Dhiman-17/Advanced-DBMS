-- Create the Sales table
CREATE TABLE Sales (
    customer_id INT,
    name VARCHAR(50),
    visited_on DATE,
    amount INT
);

-- Insert data into Sales table
INSERT INTO Sales (customer_id, name, visited_on, amount) VALUES
(1, 'Jhon', '2019-01-01', 100),
(2, 'Daniel', '2019-01-02', 110),
(3, 'Jade', '2019-01-03', 120),
(4, 'Khaled', '2019-01-04', 130),
(5, 'Winston', '2019-01-05', 110),
(6, 'Elvis', '2019-01-06', 140),
(7, 'Anna', '2019-01-07', 150),
(8, 'Maria', '2019-01-08', 80),
(9, 'Jaze', '2019-01-09', 110);

select * from Sales

--find total sales from day 1 to current day
select * ,
SUM(amount) OVER(ORDER BY visited_on ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as sum
from Sales

CREATE TABLE RestaurantPersonVisited (e
    Person VARCHAR(50),
    Visited_date DATE
);

INSERT INTO RestaurantPersonVisited (Person, Visited_date) VALUES
('Akash', '2024-04-01'),
('Nisha', '2024-04-01'),
('Nisha', '2024-04-02'),
('Akash', '2024-04-02'),
('Akash', '2024-04-03'),
('Akash', '2024-04-03'),
('Nisha', '2024-04-06')

with cte as(
select *,
LAG(Visited_date,1,null) over (PARTITION BY Person order by Visited_date) as prev2,
LEAD(Visited_date,1,null) over (PARTITION BY Person order by Visited_date) as next2
from RestaurantPersonVisited
)

select Person from cte 
where DATEDIFF(day,Visited_date,next2) = 1 and DATEDIFF(day,prev2,Visited_date) = 1
group by Person


CREATE TABLE Department1 (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);


CREATE TABLE Employee5 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    departmentId INT,
    FOREIGN KEY (departmentId) REFERENCES Department1(id)
);
-- Insert into Department table
INSERT INTO Department1 (id, dept_name) VALUES
(1, 'IT'),
(2, 'Sales');

-- Insert into Employee table
INSERT INTO Employee5 (id, name, salary, departmentId) VALUES
(1, 'Akash', 85000, 1),
(2, 'Henry', 80000, 2),
(3, 'Samarth', 60000, 2),
(4, 'Max', 90000, 1),
(5, 'Janet', 69000, 1),
(6, 'Vinay', 85000, 1),
(7, 'Willy', 70000, 1);

--using two cte
with cte as(
select d.dept_name, e.name, e.salary
from Employee5 e INNER JOIN Department1 d
on e.departmentId = d.id)
,cte2 as(
select dept_name, name, salary,
DENSE_RANK() OVER (PARTITION BY dept_name ORDER BY salary desc) as r
from cte)

select dept_name as Department, name as Employee, salary as Salary
from cte2 where r<4

--using only single cte as we can use join and window func in single cte
with cte3 as(
select d.dept_name, e.name, e.salary,
 DENSE_RANK() OVER (PARTITION BY d.dept_name ORDER BY e.salary desc) as r
 from Employee5 e inner join Department1 d
 on e.departmentId = d.id)

 select * from cte3 where r<=3
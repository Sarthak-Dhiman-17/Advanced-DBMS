
CREATE TABLE employee_SWC (
    Emp_Id INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Emp_Salary INT
);

-- Insert data
INSERT INTO employee_SWC (Emp_Id, Emp_Name, Emp_Salary) VALUES
(1, 'Alice', 4000),
(2, 'Bob', 6000),
(3, 'Charlie', 2000),
(4, 'David', 8000),
(5, 'Akash', 8000),
(6, 'Ajay', 6000);

select * from employee_swc


--1. is to find the third highest salary
select top 3 * from employee_SWC order by Emp_Salary desc

--2. find the highest salary

CREATE TABLE employee_SWC (
    Emp_Id INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Emp_Salary INT
);

CREATE TABLE employee_SWC1 (
    Emp_Id INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Emp_Salary INT
);

-- Insert data, duplicate values
INSERT INTO employee_SWC (Emp_Id, Emp_Name, Emp_Salary) VALUES
(1, 'Alice', 4000),
(2, 'Bob', 6000),
(3, 'Charlie', 2000),
(4, 'David', 8000),
(5, 'Akash', 8000),
(6, 'Ajay', 6000);

--distinct values
INSERT INTO employee_SWC1 (Emp_Id, Emp_Name, Emp_Salary) VALUES
(1, 'Alice', 4000),
(2, 'Bob', 6000),
(3, 'Charlie', 2000),
(4, 'David', 8000);

select * from employee_swc

--both the following queries need to be same for both cases
--1. is to find the third highest salary

--2. find the highest salary if duplicate present
select MAX(Emp_Salary) from employee_SWC
where Emp_Salary < ( 
select MAX(Emp_Salary) from employee_SWC
where Emp_Salary < (
select MAX(Emp_Salary) from employee_SWC))

-- another method
select Emp_Salary from employee_SWC1
group by Emp_Salary
order by Emp_Salary desc
offset 2 rows
fetch next 1 row only




-- Department Table
CREATE TABLE Department (
    ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(50)
);

-- Employee Table
CREATE TABLE Employee187 (
    ID INT,
    NAME VARCHAR(50),
    SALARY INT,
    DEPT_ID INT,
    FOREIGN KEY (DEPT_ID) REFERENCES Department(ID)
);
-- Insert into Department table
INSERT INTO Department (ID, DEPT_NAME) VALUES
(1, 'IT'),
(2, 'SALES');


-- Insert into Employee table
INSERT INTO Employee187 (ID, NAME, SALARY, DEPT_ID) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1); 

select * from Department d RIGHT JOIN Employee187 e on d.ID = e.DEPT_ID

-- this is called correlated subquery , inner query dependent on outer query
select d.DEPT_NAME, e.SALARY as Max_Salary from Department d INNER JOIN Employee187 e on d.ID = e.DEPT_ID
where e.SALARY = (
select MAX(SALARY) from Employee187 e2
where e2.DEPT_ID = e.DEPT_ID)


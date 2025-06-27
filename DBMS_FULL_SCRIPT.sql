-- Day 01

use uims

select *from student


create database Batch_2021;

use Batch_2021; 
 
 --demonstrate the tab of database above. where we can select 
 --manually the database,  refreshing the DB.

 -- Creating the table
 create table Student_Bio_Data(
	Std_id int,
	Std_Name varchar(50), 
	Father_Name varchar(50),
	Roll_No int,
	Class varchar(50)
 )
 drop table Student_Bio_Data;

 --checking the contents of table
 select *from Student_Bio_Data;

 -- Inserting data into the table.
 insert into Student_Bio_Data values (1, 'Alok','Chetan',12,'5th' );

 insert into Student_Bio_Data values (2, 'Naman','Karan',10,'8th' );
 insert into Student_Bio_Data values (3, 'Riya','Hitesh',11,'9th' );
 insert into Student_Bio_Data values (4, 'Shreya','Aman',7,'10th' );
 insert into Student_Bio_Data values (5, 'Rihana','Ranjan',9,'11th' );

 
-- Inserting data Column wise only
 insert into Student_Bio_Data(Std_id, Std_Name) values (6, 'Nitasha');

 
 
 -- Employee Table
Create table Employee(
	Empid int identity(1,1),
	EmpName varchar(50),
	EmpDpt varchar(50),
	Salary bigint
);

insert into Employee(EmpName, EmpDpt, Salary) 
values
('Alok', 'Department', 40000),
('Nisha', 'Accounts', 34000),
('Raman', 'Finance', 54000);

Select *from Employee;

--Update command
update Employee set EmpName = 'Abhishek' where Empid = 3;

update Employee set EmpDpt = 'H-R' where Empid = 3;

-- Update question on the basis of certain condition

-- Delete command
delete from Employee where EmpName = 'Abhishek';

-- when we want to delete the data, but table structure should preserve

truncate table Employee;

--SQL Constraints ---------------
/*
1. NOT NULL
2. UNIQUE
3. PRIMARY KEY
4. FOREIGN KEY
5. CHECK
6. DEFAULT
8. INDEX
*/


--[UNIQUE CONSTRAINT]

create table Employee1 (
	Empid int UNIQUE NOT NULL,
	EmpName varchar(20) NOT NULL,
	EmpDpt varchar(20) NOT NULL,
	Salary bigint NOT NULL
)

insert into Employee1 values (1, 'Alok', 'Accounts',34000);
--insert into Employee1 values (2, 'Rishi', '',34000); Here we have inserted the empty value which is not null.

--insert into Employee1 values (1, 'Naman', 'Admin',35000); this will give error violation of UNIQUE KEY CONSTRAINT


-- Instead of UNIQUE + NOT NULL = [PRIMARY KEY]
create table Employee2 (
	Empid int PRIMARY KEY,
	EmpName varchar(20) NOT NULL,
	EmpDpt varchar(20) NOT NULL,
	Salary bigint NOT NULL
)


-- [PRIMARY KEY CONSTRAINT]
create table voter_list(
	Voter_id int PRIMARY KEY,
	Voter_Name varchar(50) NOT NULL,
	Voter_Age int NOT NULL
)





insert into voter_list values (1, 'Shreya', 21);
-- if i execute this line again, what will happen? - it will show PK value cannot be same
-- if i did not specify any value in it what will happen? - it will show PK cannot be null
insert into voter_list values (2, 'Naman', 22);
insert into voter_list values (3, 'Vanshika', 23);
insert into voter_list values (4, 'Pritam', 21);
insert into voter_list values (5, 'Dhruv', 26);




-- [CHECK CONSTRAINT]

create table voter_list_1(
	Voter_id int PRIMARY KEY,
	Voter_Name varchar(50) NOT NULL,
	Voter_Age int NOT NULL
	CHECK (Voter_Age >= 18)
)

insert into voter_list_1 values (1, 'Narendra', 21);

--Giving age less than 18 in voter_age column
--insert into voter_list_1 values (2, 'Amit', 17);



-- [DEFAULT CONSTRAINT]

create table voter_list_2(
	Voter_id int PRIMARY KEY,
	Voter_Name varchar(50) NOT NULL,
	Voter_Age int NOT NULL
	DEFAULT 18
);

-- will it work as we have given not null in voter_age column but it is also having DEFAULT; so, yes it will work
insert into voter_list_2(Voter_id, Voter_Name) values (2, 'Piyush');
select * from voter_list_2;



-- [SELECT COMMAND - FETCHING PARTICULAR COLUMNS]

create table voter_list_3(
	Voter_id int PRIMARY KEY,
	Voter_Name varchar(50) NOT NULL,
	Voter_Age int NOT NULL
);

insert into voter_list_3 values (1, 'Nisha', 21);
insert into voter_list_3 values (2, 'Aman', 18);
insert into voter_list_3 values (3, 'Piysuh', 22);
insert into voter_list_3 values (4, 'Nishant', 20);
insert into voter_list_3 values (5, 'Raman', 23);



select * from voter_list_3;  -- Fetching all columns
select *from voter_list_3 where Voter_id = 2;


--Fetching all data based on some condition
select *from voter_list_3 where Voter_id = 2 or Voter_id = 4;


--Fetching specific columns based on some condition
select Voter_name from voter_list_3 where Voter_id = 2 or Voter_id = 4;


-- [ORDER BY CLAUSE]
--I want name of voters to be in ascending order
select *from voter_list_3 ORDER BY Voter_Name; --[Ascending by default]

select *from voter_list_3 ORDER BY Voter_Name DESC;



-- [PRIMARY KEY AND FOREIGN KEY CONSTRAINT] 
/* 
	Customer table and Orders table - Customer will be first
	entered into customer table then only he can order something
	else not. (FK - Maintaining Referential Integrity)

	1. If i am INSERTING/UPDATING/DELETING an order in Orders 
	table for a customer which doesn't exist in Customer Table 
	then this is the case for not 
	maintaining the referential integrity
*/

create table Customer1(
	C_id int PRIMARY KEY,
	C_Name varchar(50),
	C_Address varchar(max),
	City varchar(50)
);



insert into Customer1 values (1, 'Aman', '28 XYZ','New Delhi');
insert into Customer1 values (2, 'Nisha', '30 PYQ','Agra');
insert into Customer1 values (3, 'Rhea', '22 NMB','Banaras');
insert into Customer1 values (4, 'Namish', '14 SDF','Pune');


create table Orders1(
	Order_id int PRIMARY KEY,
	Item Varchar(50),
	Quantity int,
	Price_of_one int,
	-- Declaring Foreingn Key 
	C_id int FOREIGN KEY REFERENCES Customer1(C_id)
)

drop table Customer1;
drop table Orders1;

-- Foreign key can be repeated, but PK can't.

insert into Orders1 values (1, 'RAM', 2, 200, 2);
insert into Orders1 values (2, 'HD', 1, 400, 1);
insert into Orders1 values (3, 'Floppy', 4, 100, 4);
insert into Orders1 values (4, 'Processor', 3, 800, 3);
insert into Orders1 values (5, 'PC', 2, 900, 3);

select *from Customer1;
select *from Orders1;

--Scenario is, customer which is not present in customers table directly cant place any order.
-- so if we directly insert any C_id in Orders1 table which is not present in Customers1, then it will give error.

insert into Orders1 values (5, 'Processor', 3, 800, 6);  -- 6 is not present in Customers1 table. (F.K violation)

-- deleting from Base Table - gives F.K violation
delete from Customer1 where C_id = 1;

--dropping foreign key using alter command
alter table  Orders1 drop constraint FK__Orders1__C_id__46B27FE2; 

-- after dropping the constraint, we can perfrom insert and delete data.

-- adding FK constraint in existing table using ALTER COMMAND.

alter table Orders1 add foreign key(C_id) references Customer1(C_id);



-- --------------CASCADING REFERENTIAL INTEGRITY ----------------------

/* 1. If we try to delete/update C_id from Customer2 table, it will show error.
  if we are deleting / updating any customer then that should also be reflected in child table i.e., Orders2
  For this purpose we use, 
     1. NO ACTION (by default)
	 2. CASDCADE
	 3. SET DEFAULT
	 4. SET NULL
	 when we add FK to column then we have add one of these actions with FK to maintain referential integrity.
  */

create table Customer2(
	C_id int PRIMARY KEY,
	C_Name varchar(50),
	C_Address varchar(max),
	City varchar(50)
);



insert into Customer2 values (1, 'Aman', '28 XYZ','New Delhi');
insert into Customer2 values (2, 'Nisha', '30 PYQ','Agra');
insert into Customer2 values (3, 'Rhea', '22 NMB','Banaras');
insert into Customer2 values (4, 'Namish', '14 SDF','Pune');


create table Orders2(
	Order_id int PRIMARY KEY,
	Item Varchar(50),
	Quantity int,
	Price_of_one int,
	-- Declaring Foreingn Key 
	C_id int FOREIGN KEY REFERENCES Customer2(C_id)
)

drop table Customer2;
drop table Orders2;

-- Foreign key can be repeated, but PK can't.

insert into Orders2 values (1, 'RAM', 2, 200, 2);
insert into Orders2 values (2, 'HD', 1, 400, 1);
insert into Orders2 values (3, 'Floppy', 4, 100, 4);
insert into Orders2 values (4, 'Processor', 3, 800, 3);
insert into Orders2 values (5, 'PC', 2, 900, 3);

select *from Customer2;
select *from Orders2;


--------- [NO ACTION]------------
-- if we do update / delete in base table then no action will be performed. Error will come as violation of FK


--------- [CASCADE ACTION] ---------------------
create table Orders2(
	Order_id int PRIMARY KEY,
	Item Varchar(50),
	Quantity int,
	Price_of_one int,
	-- Declaring Foreingn Key 
	C_id int FOREIGN KEY REFERENCES Customer2(C_id)
	ON DELETE CASCADE  -- if some row is deleted from base table, then in child table also it will be deleted.
	ON UPDATE CASCADE  -- if some row is updated in base table, then in child table also it will be updated.
)

delete from Customer2 where C_id = 3;  -- C_id 3 is deleted from base table(Customer2), it will also be deleted from Orders2.
update Customer2 set C_id = 5 where C_id = 4; -- same for update operation.


--------------[SET NULL] -------------------
--if we are deleting/updating any data in base table, then in child table corrosponding data will be set to NULL.

delete from Customer2 where C_id = 3; --[C_id 3 is deleted from base table, ab jitne bi records C_id 3 ke FK table mei the unki value Null hojaegi]
--NOTE: FK wale column pr NOT NULL constraint nhi laga hona chaiye.
update Customer2 set C_id = 5 where C_id = 4; -- same for update operation.


--------------[SET DEFAULT] -------------------
insert into Customer2 values (0, 'Unknown', 'No Address','No City');

create table Orders2(
	Order_id int PRIMARY KEY,
	Item Varchar(50),
	Quantity int,
	Price_of_one int,
	-- Declaring Foreingn Key 
	C_id int FOREIGN KEY REFERENCES Customer2(C_id)
	ON DELETE SET DEFAULT
	ON UPDATE SET DEFAULT
)

alter table Orders2 add default 0 for C_id; -- it will add set default value as 0 for

delete from Customer2 where C_id = 3; --[C_id 3 is deleted from base table, ab jitne bi records C_id 3 ke FK table mei the unki value Null hojaegi]
--NOTE: FK wale column pr DEFALT constraint laga hona chaiye.
update Customer2 set C_id = 5 where C_id = 4; -- same for update operation.


-----------Alter Command -------------------------

-- 1. Alter the name of Database
alter database Batch_2021 modify name = New_Batch_2021;

alter database New_Batch_2021 modify name = Batch_2021;

--OR

execute sp_renamedb 'old_DB_name', 'New_DB_name';

-- Changing table name
execute sp_rename 'old_table_name', 'new_table_name';


select *from  voter_list;

-- Adding column - Alter
alter table voter_list add Voter_city varchar(50) NOT NULL;

--Dropping column - Alter
alter table voter_list drop column Voter_city;

-- Changing the data type of column - alter
alter table voter_list alter column Voter_name nvarchar(50);


-- Changing the name of any column
alter table voter_list alter column Voter_Age New_voter_age int;


-----------------Adding and Dropping SQL Constraints uisng ALTER -----------------

create table voter_table (
voter_id int,
voter_name varchar(20),
voter_age int
);

select *from voter_table;
insert into voter_table values(1, 'Anam', 22);

-- [ Adding NOT NULL]
alter table voter_table alter column voter_name varchar(20) not null;

--[Dropping NOT NULL]
alter table voter_table alter column voter_name varchar(20) null;
--NOTE: if in a column we have existing NULL values, then we cannot apply NOT NULL Constraint on it.

--[Adding UNIQUE]
alter table voter_table add UNIQUE(voter_id); -- in object explore -> go to tables -> go to indexes-> unique constraint id

--[Dropping UNIQUE]
alter table voter_table drop constraint UQ__voter_ta__B79503128FC58A5C;

--[Adding PRIMARY KEY]
alter table voter_table alter column voter_id int not null;
alter table voter_table add PRIMARY KEY(voter_id); -- iss command ko jab run krenge to error ayega, it will say PK cannt be nullable
												   -- which means hume pehle voter_id ko NOT NULL banana pdega.

--[Dropping PRIMARY KEY]
alter table voter_table drop constraint PK__voter_ta__B79503128FC58A5C;

--[Adding FOREIGN KEY]
create table voter_city(c_id int, c_name varchar(50), voter_id int);

select *from voter_table;
select *from voter_city;

alter table voter_city add foreign key(voter_id) references voter_table(voter_id);

--[Dropping FK]
alter table voter_city drop constraint FK__voter_ta__B79503128FC58A5C;

--[Adding CHECK Constraint]
alter table voter_table add CHECK(voter_age >= 18);
insert into voter_table values(2, 'Nimrat', 17);

--[Dropping CHECK Constraint]
alter table voter_table drop constraint CK__voter_tab__voter__56E8E7AB;

--[Adding DEFAULT Constraint]
alter table voter_table add default 18 for voter_age;
insert into voter_table(voter_id, voter_name) values(3, 'Ayush');

--[Dropping DEFAULT Constraint]
alter table voter_table drop constraint DF__voter_tab__voter__58D1301D;



-----------------------[ALIAS in SQL] ---------------------
create table new_batch(
	ID int primary key,
	Name varchar(20), 
	Course varchar(20),
	Fees varchar(20),
	Student_id int
)

insert into new_batch values (1, 'Alok', 'ASP.NET', 3500, 111);
insert into new_batch values (2, 'Vanshi', 'ANdroid', 4500, 222);
insert into new_batch values (3, 'Simaran', 'Java', 3500, 333);
insert into new_batch values (4, 'Nisha', 'Android', 4500, 444);

select *from new_batch;

--[for eg: agr kisi column ka name not understandable hai, to hum ALIAS use krke sahi name se show krwate hai]

--[Giving alias to a column]
select id as Student_RollNo from new_batch;

--[Giving alias to a Multiple Columns ]
select id as Student_RollNo, Name as Student_Name, Fees as Student_Fees
from new_batch;

--[Giving alias to whole table]
select *from new_batch as New_Student_Batch;



------------------------- [ JOINS IN SQL ] -----------------------------------
-- 1.  SQL joins are used to combine two or more table data.
-- 2. for eg: table A -5 columns, table B - 4 columns. I want 3 columns from A and 2 from B collectively in single table.
-- 3.  INNER JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN. (join is done on some common attribute)


create table Employee_tbl (
EmpId int UNIQUE NOT NULL,
EmpName varchar(50) NOT NULL,
Email varchar(50) NOT NULL,
Designation varchar(50) NOT NULL
)

insert into Employee_tbl values(11, 'Alok', 'alok@xyx', 'Manager');
insert into Employee_tbl values(12, 'Raman', 'raman@xyx', 'Assistant');
insert into Employee_tbl values(13, 'Nisha', 'nisha@xyx', 'IT Incharge');
insert into Employee_tbl values(14, 'Ashok', 'Ashok@xyx', 'Operator');
insert into Employee_tbl values(15, 'Naman', 'Naman@xyx', 'AD');
insert into Employee_tbl values(16, 'Ayush', 'Ayush@xyx', 'Professor');

select *from Employee_tbl;


create table department(
	DeptId int UNIQUE NOT NULL,
	DeptName varchar(50),
	Dept_salary bigint NOT NULL,
	EmpId int UNIQUE NOT NULL
)

insert into department values (111, 'Admin', 50000, 13);
insert into department values (222, 'Accounts', 45000, 12);
insert into department values (333, 'IT', 66000, 11);
insert into department values (444, 'Academics', 40000, 14);
insert into department values (555, 'ERP', 70000, 17);
insert into department values (666, 'Management', 80000, 18);

select *from Employee_tbl;
select *from department;

-- 1. INNER JOIN (Common Data Returns)
select * from Employee_tbl as A
INNER JOIN department as B
on A.EmpId = B.EmpId;

-- Extracting only the essential attributes
select A.EmpName, A.Designation, B.Dept_salary from Employee_tbl as A
INNER JOIN department as B
on A.EmpId = B.EmpId;



-- 2. LEFT JOIN (Left table ka data chaiye mujhe + left table and right table ka common data)
select * from Employee_tbl as A
LEFT JOIN department as B
on A.EmpId = B.EmpId;

-- Extracting only the essential attributes
select A.EmpName, A.Designation, B.Dept_salary from Employee_tbl as A
LEFT JOIN department as B
on A.EmpId = B.EmpId;


-- 3. RIGHT JOIN (Right table ka data chaiye mujhe + left table and right table ka common data)
select * from Employee_tbl as A
RIGHT JOIN department as B
on A.EmpId = B.EmpId;

-- Extracting only the essential attributes
select A.EmpName, A.Designation, B.Dept_salary from Employee_tbl as A
RIGHT JOIN department as B
on A.EmpId = B.EmpId;



-- 4. FULL OUTER JOIN (All Combined data)
select * from Employee_tbl as A
FULL OUTER JOIN department as B
on A.EmpId = B.EmpId;

-- Extracting only the essential attributes
select A.EmpName, A.Designation, B.Dept_salary from Employee_tbl as A
FULL OUTER JOIN department as B
on A.EmpId = B.EmpId;

-- 6. SELF JOIN (it is a regular join in which table is joined with itself)
create table Employee_Manager(
Empid int PRIMARY KEY,
EmpName varchar(50) NOT NULL,
ManagerId int
)

insert into Employee_Manager values (1, 'Manik',4);
insert into Employee_Manager values (2, 'Ayush',4);
insert into Employee_Manager values (3, 'Neha',5);
insert into Employee_Manager values (4, 'Shreya',6);
insert into Employee_Manager values (5, 'Piush',1);
insert into Employee_Manager values (6, 'Anushka',1);

select *from Employee_Manager;
--  TASK - Same table mei se hume employee names alag karne hai and manager names alag karne hai.

Select A.EmpName as Employee_Name, B.EmpName as Manager_Name from Employee_Manager as A
INNER JOIN Employee_Manager as B
on A.ManagerId = B.Empid;


----------------[UNION and UNION ALL] ------------------------------------------
-- 1. RULE - To apply UNION and UNION ALL -> No of columns and data types of columns should be same and identical.
-- 2. UNION - it doesn't include the repeated values.
-- 3. UNION ALL - it includes the repeated values. Also, it does not give the data in sorted order

CREATE TABLE FootballParticipants (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE HockeyParticipants (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Email VARCHAR(100)
);

drop table FootballParticipants;


INSERT INTO FootballParticipants (Name, Email)
VALUES
('John', 'john.doe@example.com'),
('Jane', 'jane.smith@example.com'),
('Michael', 'michael.brown@example.com'),
('Emily', 'emily.davis@example.com'),
('David', 'david.wilson@example.com');


INSERT INTO HockeyParticipants (Name, Email)
VALUES
('John', 'john.doe@example.com'),
('Patricia', 'patricia.taylor@example.com'),
('Michael', 'michael.brown@example.com'),
('Emily', 'emily.davis@example.com'),
('Kevin', 'kevin.martinez@example.com');

 

-- [UNION OPERATOR]
select *from FootballParticipants
UNION
select *from HockeyParticipants;


-- Error case for UNION
-- All queries combined using a UNION, INTERSECT or EXCEPT operator must have an equal number of expressions in their target lists.
select id, name from FootballParticipants
UNION
select id, name, email from HockeyParticipants;


-- [UNION ALL OPERATOR]
select *from FootballParticipants
UNION ALL
select *from HockeyParticipants;


-- [INTERSECT OPERATOR]
select *from FootballParticipants
INTERSECT
select *from HockeyParticipants;

-- [EXCEPT OPERATOR] (Minus)
select *from FootballParticipants
EXCEPT
select *from HockeyParticipants;

--NOTE: inki jagh hum joins bi use kr skte the, but joins me aisi (same no of columns, datatype hona chaiye) koi condition ni hoti.




-- [IDENTITY or AUTO INCREMENT ]-------------------------
Create table Teacher_tbl (
T_id int PRIMARY KEY IDENTITY, 
T_Name varchar(50) NOT NULL, 
T_Qualification varchar(50) NOT NULL, 
T_Salary bigint NOT NULL
);

select *from Teacher_tbl;
--identity column ki help se humei khud value nhi deni pdti column mei.
insert into Teacher_tbl values('Alok', 'Phd', 89000);
insert into Teacher_tbl values('Neha', 'Bsc', 67000);
insert into Teacher_tbl values('Simran', 'BE', 100000);

drop table Teacher_tbl;

Create table Teacher_tbl (
T_id int PRIMARY KEY IDENTITY(100, 5),  -- (SEED, INCREMENT)
T_Name varchar(50) NOT NULL, 
T_Qualification varchar(50) NOT NULL, 
T_Salary bigint NOT NULL
);


-------------[AGGREGATE FUNCTIONS IN SQL]--------------------------
-- It return only a single value every time.
-- SUM(), MAX(), MIN(), AVG(), COUNT()

CREATE TABLE Employee_Info (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Gender VARCHAR(10),
    Salary DECIMAL(10, 2),
    City VARCHAR(50)
);

INSERT INTO Employee_Info (Name, Gender, Salary, City)
VALUES
('Alok', 'Male', 50000.00, 'Delhi'),
('Priya', 'Male', 60000.00, 'Mumbai'),
('Rajesh', 'Female', 45000.00, 'Bangalore'),
('Sneha', 'Male', 55000.00, 'Chennai'),
('Anil', 'Male', 52000.00, 'Hyderabad'),
('Sunita', 'Female', 48000.00, 'Kolkata'),
('Vijay', 'Male', 47000.00, 'Pune'),
('Ritu', 'Male', 62000.00, 'Ahmedabad'),
('Amit', 'Female', 51000.00, 'Jaipur');

truncate table Employee_Info;

select *from Employee_Info;

select SUM(Salary) as Total_Salary from Employee_Info;
select MAX(Salary) as Maximum_Salary from Employee_Info;
select MIN(Salary) as Minimum_Salary from Employee_Info;
select AVG(Salary) as Average_Salary from Employee_Info;
select COUNT(Salary) as Total_Rows from Employee_Info;





-----------------[GROUP BY COMMAND] --------------------------
-- group by uss column pr lagate hai jo repeated ho
CREATE TABLE MyEmployees (
    EmpId INT PRIMARY KEY IDENTITY(1,1),
    EmpName VARCHAR(50),
    Gender VARCHAR(10),
    Salary INT,
    City VARCHAR(50),
    Dept_id INT
);


INSERT INTO MyEmployees (EmpName, Gender, Salary, City, Dept_id)
VALUES
('Amit', 'Male', 50000, 'Delhi', 2),
('Priya', 'Female', 60000, 'Mumbai', 1),
('Rajesh', 'Male', 45000, 'Agra', 3),
('Sneha', 'Female', 55000, 'Delhi', 4),
('Anil', 'Male', 52000, 'Agra', 2),
('Sunita', 'Female', 48000, 'Mumbai', 1),
('Vijay', 'Male', 47000, 'Agra', 3),
('Ritu', 'Female', 62000, 'Mumbai', 2),
('Alok', 'Male', 51000, 'Delhi', 1),
('Neha', 'Female', 53000, 'Agra', 4),
('Simran', 'Female', 33000, 'Agra', 3);

truncate table MyEmployees;

select *from MyEmployees;

--1. Query to find sum of salary based on cities. (agra ke emp ko kitni salary de rhe hai, delhi and mumbai same.)
-- Group Agra employees and sum the salary.

select city, sum(salary) as Total_Salary_City_Wise from MyEmployees
group by City;     --jo column group by ke sath use kr rhe hai vahi select stmt mei diya jaega.

--2.  Agra mei jitne male and female employees hai unko kitni salary de rhe hai.
select gender, city, sum(salary) as Total_Salary from MyEmployees
group by gender, city;


-- Example 2

CREATE TABLE School (
    Student_id INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Fathers_Name VARCHAR(50),
    Class INT,
    Fees INT
);


INSERT INTO School (Name, Fathers_Name, Class, Fees)
VALUES
('Aarav', 'Rajesh Kumar', 10, 20000),
('Bhavna', 'Suresh Mehta', 9, 18000),
('Chirag', 'Anil Singh', 10, 20000),
('Divya', 'Vikram Verma', 8, 16000),
('Esha', 'Ravi Sharma', 9, 18000),
('Farhan', 'Imran Khan', 8, 16000),
('Gauri', 'Kiran Patil', 10, 20000);

select *from School;

--1. Class ke group ke basis pe fees return krwao
select class, sum(fees) as Total_Fees from School
group by class;



--------------------------[Having Clause] ---------------------------------
--1. Having clause is used to specify conditions for groups.
--2. Where cannot be used with Group By command also with Aggregate Function, so we use Having
--3. Where clause is used for filtering rows but having is used for filtering Groups.

select city, sum(salary) as Total_Salary_City_Wise from MyEmployees
group by City
having city in ('Agra'); 


	select city, sum(salary) as Total_Salary_City_Wise from MyEmployees
	group by City
	having sum(salary) >156000; 

-- ERROR CASE- Where cannot be used with Aggregate Functions
select city, sum(salary) as Total_Salary_City_Wise from MyEmployees
where sum(salary) >= 156000
group by City;


--4. Where clause can be used before the group by but not after that.
select city, sum(salary) as Total_Salary_City_Wise from MyEmployees
where city in ('Agra')
group by City;

--5. We can use Where and Having together in a single query.
select city, sum(salary) as Total_Salary_City_Wise from MyEmployees
where city in ('Agra','Delhi')
group by City
having sum(salary) >156000; 


--EXAMPLE 2: Products Table

CREATE TABLE Products (
    Product_name VARCHAR(50),
    Sales_Amount INT
);


INSERT INTO Products (Product_name, Sales_Amount)
VALUES
('Monitor', 15000),
('Mouse', 500),
('Harddisk', 4000),
('Keyboard', 1500),
('Monitor', 15000),
('Mouse', 500),
('Harddisk', 4000),
('Keyboard', 1500),
('Monitor', 15000),
('Mouse', 500),
('Harddisk', 4000);

Select *from Products;

-- Where before group by
select Product_name, sum(Sales_Amount) as Total_Sales 
from Products
where Product_name not in ('Harddisk')
group by Product_name;


-- Where befor group by and having after group by
select Product_name, sum(Sales_Amount) as Total_Sales 
from Products
where Product_name not in ('Harddisk')
group by Product_name
having sum(Sales_Amount) >1500;





-----------------[ORDER BY COMMAND] --------------------------
--1. Order by is used to sort the result-set in ascending(ASC) or descending(DESC) order. By default it ASC.

select *from Employee_Info
order by name ASC;


select *from Employee_Info
order by name DESC;

select *from Employee_Info
order by Gender DESC;

select *from Employee_Info
order by Gender DESC, Name ASC;




-------------------------[View is SQL] ----------------------------------------------
-- 1. it is a virtual table, employees pura table na dekh sake, limited data dekh sake. To hum unko ek view bna ke de denge.

create table dept(
	id int unique not null, 
	Dept_Name varchar(20) not null
)

insert into dept values(1, 'Accounts');
insert into dept values(2, 'HR');
insert into dept values(3, 'Admin');
insert into dept values(4, 'Counselling');

select *from MyEmployees;


--Suppose I want to show the EmpId, EmpName, Gender and City to my employees.

create view vW_BasicInfoEmployee
as
Select EmpId, EmpName as Employee_Name, Gender as Employee_Gender, City as Employee_City from MyEmployees

-- Showing the View
select *from vW_BasicInfoEmployee;
insert into vW_BasicInfoEmployee values('Nishant', 'Male', 'Agra');
delete from vW_BasicInfoEmployee where EmpId = 13;




-- Task: create a view for employees so that they can only see details and department details.
--P.S
create view vW_forEmoloyees
as
	select *from MyEmployees as A
	INNER JOIN dept as B
	on A.Dept_id = B.id;

select * from vW_forEmoloyees;

--P.S
-- I want to get all columns of A and from B, i want only deparment name in a seperate view.
create view vW_forEmoloyees1
as
	select A.*, B.Dept_Name from MyEmployees as A
	INNER JOIN dept as B
	on A.Dept_id = B.id;


-- View can be used to implement row and column level security.
--  Dont show the salary (Column level security)

create view vW_forEmoloyees2
as
	select A.EmpId, A.EmpName, A.Gender, A.City, A.Dept_id, B.Dept_Name from MyEmployees as A
	INNER JOIN dept as B
	on A.Dept_id = B.id;
--this view, we can give to our employees as salary is not visible to them which is confidential.


-- Row level security (P.S)
-- eg: HR departmennt can only see their data, but not others
create view vW_forEmoloyees3
as
	select A.EmpId, A.EmpName, A.Gender, A.City, A.Dept_id, B.Dept_Name from MyEmployees as A
	INNER JOIN dept as B
	on A.Dept_id = B.id
	where Dept_Name = 'HR';

	select *from vW_forEmoloyees3;

-- SP_helptext
		sp_helptext vW_forEmoloyees3;



-----------[Altering the View] --------------------

--I want to alter vW_forEmoloyees3, and i want to seperately create a view for HR and Accounts deparment.

alter view vW_forEmoloyees3
as
	select A.EmpId, A.EmpName, A.Gender, A.City, A.Dept_id, B.Dept_Name from MyEmployees as A
	INNER JOIN dept as B
	on A.Dept_id = B.id
	where Dept_Name = 'HR' or Dept_Name = 'Accounts';

	select *from vW_forEmoloyees3;


------------[Dropping View]---------------
drop view vW_forEmoloyees3;

-----------------------[DML Operations on Views]-------------
--1. If we do DML(INSERT, UPDATE, DELETE) operations on view, 
--then these operations will also be reflected on original table.

create view vW_forMyEmployees
as
select *from MyEmployees;

-- (1) Inserting data into the view.   [This will also insert data into the main table i.e., MyEmployees]
insert into vW_forMyEmployees values('Nishant', 'Male', 56000, 'Agra', 2);

select *from vW_forMyEmployees;
select *from MyEmployees;    -- Here data has been inserted in View as well as in the original table

-- (2) Updating data into the view.
	update vW_forMyEmployees set EmpName = 'Priya' where EmpId = 12;
		select *from vW_forMyEmployees;
        select *from MyEmployees; -- Here data has been updated in View as well as in the original table

-- (3) Deleting data from the view.
	delete from vW_forMyEmployees where EmpId = 12;
		select *from vW_forMyEmployees;
        select *from MyEmployees; -- Here data has been deleted from View as well as the original table




---------------------[LIKE Operator] ------------------------------------
select *from MyEmployees;

-- %
select *from MyEmployees where EmpName LIKE 'a%'; -- a se start hoga uske baad kuch bi
select *from MyEmployees where EmpName LIKE '%a'; -- jinke end mei 'a' aata hai
select *from MyEmployees where EmpName LIKE '%sa%'; -- start and end nhi pta bs beech m 'sa' aata hai

-- _
select *from MyEmployees where EmpName LIKE 'a___'; -- vo names jinke naam mei 'a' ke aage 3 characters hai
select *from MyEmployees where EmpName LIKE '___a';

--[]

select *from MyEmployees where EmpName LIKE '[a-z]%'; --all names jo a to z tk shuru hote hai
select *from MyEmployees where EmpName LIKE '[a,s,v,r]%'; --name starting from these letters

--Task: We have to find the names that have 'a' in their names at second position.
select *from MyEmployees where EmpName LIKE '_a%';
-- Task: 'a' se start ho and 't' pe end ho
select *from MyEmployees where EmpName LIKE 'a%t';









----------------------------[SUB-QUERIES IN SQL]----------------------------------
--1. A subquery or inner or nested query is a query within another SQL query and embedded within 
	-- where clause. A subquery works as a condition for outer query.

--Example:
select *from dept;
select *from MyEmployees;

select *from MyEmployees 
where EmpId in 
(Select EmpId from MyEmployees where salary>50000);
--NOTE: jo where ke sth column use hua hai, vhi column SQ mei liya jaega. SQ m hum sirf ek hi column de skte h.


--ERROR CASE
select *from MyEmployees 
where EmpId in 
(Select EmpId, EmpName from MyEmployees where salary>50000);

--1. Return those records, where city = 'Agra' using sub-query
select *from MyEmployees 
where EmpId in 
(Select EmpId from MyEmployees where city='Agra');


select *from MyEmployees 
where EmpId in 
(Select EmpId from MyEmployees where gender='Male');


select EmpName, Gender, Salary from MyEmployees 
where EmpId in 
(Select EmpId from MyEmployees where gender='Male');


--Task: update salary of employees by 2000 where city is Agra using SQ.

update MyEmployees set Salary = Salary + 2000 
where EmpId IN
(select EmpId from MyEmployees where city = 'Agra')


--deleting data of employees who are from Agra.
delete from MyEmployees 
where EmpId IN
(select EmpId from MyEmployees where city = 'Agra')


-- We can also join two tables using sub-queries.
--here we are fetching data from joining the two tables i.e dept and MyEmployees.

select * from MyEmployees 
where Dept_id IN
(Select id from dept where Dept_Name = 'Accounts'); 



-- Order by with Sub-Queries
select *from MyEmployees 
where EmpId in 
(Select EmpId from MyEmployees where gender='Male')
ORDER BY EmpId DESC;

--Types of SUB QUERIES
/*
  1. SCALER SQ: SQ that returns only one value to outer query;
				operators: <, >, <=, >=, !=
  
  2. MULTIVALUED SQ: SQ that return more than one row to outer query.
				operators: IN, ANY, ALL
*/ 

-- Example of Scaler SQ:  for scaler SQ, we can also use the operators defined for SCALER SQ
			select *from MyEmployees
			where Dept_id IN
			(select id from dept where Dept_Name = 'Accounts');

			select *from MyEmployees
			where Dept_id =
			(select id from dept where Dept_Name = 'Accounts');


-- Example of Multivalues SQ: multivalued sub query, scaler wale operators use ni kr skti
			select *from MyEmployees 
			where EmpId in 
			(Select EmpId from MyEmployees where gender='Male')

			
			-- [IN OPERATOR]
			select *from MyEmployees 
			where Salary in 
			(Select Salary from MyEmployees where EmpName = 'Amit' or EmpName = 'Anil') 


			-- [ANY OPERATOR] - its like OR
			select *from MyEmployees 
			where Salary < ANY
			(Select Salary from MyEmployees where EmpName = 'Amit' or EmpName = 'Anil') --result (50000, 54000)
			-- sub-query ka jo O/P hoga, un dono se compare krega outer query ko and result dega.
			--eg: SQ ne return kiya 50000, 54000 ab outer query ki condition hai Salary < any (50000, 54000).
			--    any vo saari rows return krdega jaha pe salary 50000 se bi OR 54000 se bi kum hai.
			-- ye pehle 50000 se check krega-> rows return krdega the 54000 se check krega and rows return krega.


				-- [ALL OPERATOR] - its like AND
			select *from MyEmployees 
			where Salary < ALL
			(Select Salary from MyEmployees where EmpName = 'Amit' or EmpName = 'Anil') --result (50000, 54000)
			-- sub-query ka jo O/P hoga, un dono se compare krega outer query ko and result dega.
			--eg: SQ ne return kiya 50000, 54000 ab outer query ki condition hai Salary < ALL (50000, 54000).
			--    ALL vo saari rows return krdega jaha pe salary 50000 AND 540000 dono se kum hai.
			-- ALL combinely (50000,54000) ek sath check krega, and vo salary return krega jo in dono se choti hai
			-- same time pr.


----------------SELF CONTAINED SUB QUERY------------------------------
-- 1. Vo sub query jo khud se bi run ho ske, isolately
			select *from MyEmployees 
			where Salary < ALL
			(Select Salary from MyEmployees where EmpName = 'Amit' or EmpName = 'Anil') --SQ in this can run 
																					--by itself also.

---------------CO-RELATED SUB QUERIES------------------------------------
-- 1. vo sub query jo khud se run na ho ske, dependen ho outer query pr
-- 2. ALIASES are used in this
--P.S -> find the records of employees from department table where gender is male.
			select *from MyEmployees as e
			where e.Dept_id IN
			(select d.id from dept as d where e.Gender = 'Male'); --this query cant run on its own


			select *from MyEmployees as e
			where e.Dept_id IN
			(select d.id from dept as d where e.Salary > 50000);

--NOTE: we can use scaler functions Aggregate fun with subqueries, because we cannot use them with where clause.

			select *from MyEmployees
			where Salary IN
			(select min(salary) from MyEmployees);




------------------------[BETWEEN, TOP, PERCENT, DISTINCT, IN operators]-------------------------------
-- 1. BETWEEN
		select * from MyEmployees
		where salary between 50000 and 60000;

--2. TOP
		select Top 3* from MyEmployees;

--3. percent
		select Top 40 percent * from MyEmployees;

--4. DISTINCT 
		select DISTINCT Gender from MyEmployees;
		select DISTINCT City from MyEmployees;

--5. IN 
		select * from MyEmployees
		where city IN ('Agra', 'Delhi');

--5. NOT IN 
		select * from MyEmployees
		where city NOT IN ('Agra', 'Delhi');



----------------------SELECT INTO STATEMENT-----------------------------------
--1. select the data from one table, and inserts into another table.

	select *from MyEmployees;
	select *from dept;

-- I want to make the back up of MyEmployees table
	select * into Employee_backup from MyEmployees;
	select *from Employee_backup;

-- Creating backup for particular columns only.
	select EmpId, EmpName, Salary, City into Employee_backup1 from MyEmployees;
	select *from Employee_backup1;

-- Creating selected rows for backup
	select * into Employee_backup2 from MyEmployees
	where city='Agra';
	select *from Employee_backup2;


--Copy two or more columns into a new table(using joins), all columns or selected columns. (P.S)
	select * into Employee_backup3 
	from MyEmployees as A
	INNER JOIN dept as B
	ON A.Dept_id = B.id;

	select *from Employee_backup3;

-- fetching selected columns only (P.S)
	select A.*, B.Dept_Name into Employee_backup4
	from MyEmployees as A
	INNER JOIN dept as B
	ON A.Dept_id = B.id;

	select *from Employee_backup4;


-- We can also copy data from one database table and paste it into another database table. (P.S)
	create database Practice;

	select *into Practice.dbo.Employee_backup5
	from MyEmployees;

--P.S -> i want to create a backup of a table, but i only want the columns not the data.
		select *into Employee_backup6 from MyEmployees where 1 <> 1;
		select *from Employee_backup6;




----------------------INSERT INTO STATEMENT-----------------------------------
--1. ek table ka data dusre table (existing table) mei insert krwata hai
--2. Copy from source table and paste to target(existing) table in single SQL statement
--3. Source table and target table should have same table definition. just like we used with UNION, UNION ALL etc.

create table Students_Agra(
	Sname varchar(20),
	Father_Name varchar(20),
	Age int,
	Class int,
)

drop table Students_Delhi

insert into Students_Agra values('Alok', 'Chetan', 13,7);
insert into Students_Agra values('Nishant', 'Pritam', 13,6);
insert into Students_Agra values('Avinash', 'Alok', 14,8);
insert into Students_Agra values('Ravindra', 'Raman', 11,4);
insert into Students_Agra values('Aditya', 'Sanam', 14,8);



create table Students_Delhi(
	Sid int identity,
	Sname varchar(20),
	Father_Name varchar(20),
	Age int,
	Class int,
)

insert into Students_Delhi values('Pritam', 'Dhruv', 15,9);
insert into Students_Delhi values('Komal', 'Naman', 14,8);


select *from Students_Agra;
select *from Students_Delhi;

--Task: Delhi wale table mei, Agra wala table insert krdo
	insert into Students_Delhi select *from Students_Agra;

/* TASK 1: 
	I will demonstrate student by not including the identity column.
	Actual Task: agra wale table ka data delhi wale table mei copy krna hai, but jab copy krdenege data to data ek serial 
	order mei aana chaiye with serial ID's..

	TASK 2: (copying the selected rows only)
	i want all rows of sname, father_name of agra table to be copied into delhi table

	sol: insert into Students_Delhi(Sname, Father_Name) 
		 select sname, father_name from Students_Agra;
*/





use batch_2021


-----------------------------------[STORED PROCEDURES]--------------------------------------------
--1. SPs are made so that they can be re-used and shared by other multiple programs.

select *from Employee_Info;

-- CREATING A PROCEDURE
	create procedure sp_GetEmployeeDetails
	AS
	Begin
		Select name, gender, salary from Employee_Info;
	End

-- Calling a SP
	execute sp_GetEmployeeDetails;



-- SP with Single Parameter. (Scenario jaha hume bar bar id ke through data chaiye employees ka)
	create procedure spGetEmployeesById
	@id int
	AS
	Begin
		Select *from Employee_Info where id = @id;
	End

	execute spGetEmployeesById 4;



-- SP with Multiple Parameters. (Passing the INPUT PARAMETERS)
	create procedure spGetEmployeeByNameandID
	@id int,
	@Name varchar(50)
	AS
	Begin
		select *from Employee_Info where id = @id AND name = @Name;
	End

	execute spGetEmployeeByNameandID 1,'Alok'; 



-- Changing the order of Parameters.
	create procedure spGetEmployeeByNameandID
	@id int,
	@Name varchar(50)
	AS
	Begin
		select *from Employee_Info where id = @id AND name = @Name;
	End

	execute spGetEmployeeByNameandID 'Alok',1;  --Error converting data type varchar to int.



--Altering the SP
		Alter procedure spGetEmployeeByNameandID
		@id int,
		@Name varchar(50)
		AS
		Begin
			select Name, Salary from Employee_Info where id = @id AND name = @Name;
		End

		execute spGetEmployeeByNameandID 1,'Alok'; 


--Checking the content of SPs
	sp_helptext spGetEmployeeByNameandID


-- DROPPING STORED PROCEDURE
drop procedure spGetEmployeeByNameandID



--Using encryption in SPs [WITH ENCRYPTION]
	--we want that nobody should see the content of our SP.

	alter procedure spGetEmployeeByNameandID
	@id int,
	@Name varchar(50)
	WITH ENCRYPTION
	AS
	Begin
		select *from Employee_Info where id = @id AND name = @Name;
	End

	execute spGetEmployeeByNameandID 1,'Alok';

	--Now if we want to see the content of spGetEmployeeByNameandID using sp_helptext, we cannot see it.
		sp_helptext spGetEmployeeByNameandID -- The text for object 'spGetEmployeeByNameandID' is encrypted.



-- SP with OUTPUT PARAMETER
--TASK: create a SP which return the total number of employees according to the Gender passed to SP.
	create procedure spGetEmployeesByGender
	@Gender varchar(50),
	@EmployeeCount int OUTPUT
	AS
	BEGIN
		Select @EmployeeCount = Count(Id) from Employee_Info
		where Gender = @Gender;
	END

	--For Female
	Declare @TotalEmployee int
	execute spGetEmployeesByGender 'Female', @TotalEmployee OUTPUT
	select @TotalEmployee as Total_Female_Employees

	--For Male
	Declare @TotalEmployee int
	execute spGetEmployeesByGender 'Male', @TotalEmployee OUTPUT
	select @TotalEmployee as Total_Male_Employees

	
-- where do procedure are stored:
	--DB->tables->Programability->All SP are stored here.





-------------------------------[FUNCTIONS IN SQL]--------------------------------
-- If you have to repeatedly write large SQL scripts to perform the same task, you can create a function that perfroms that task.
--Next time instead of rewriting the SQL, you can simple call that function.
--A function accepts inputs in the form of parameters and returns a value. 
-- ofcourse, you can create a SP to group a set of SQL statements, however, SP cannot be called within SQL statements like SELECT etc.
-- Functions only work with INPUT PARAMETERS, TRY-CATCH cant be used with functions.

	/*
		1. user-defined Functions -  SCALAR, INLINE-TABLE-VALUED, MULTI-STATEMENT VALUES Functions
		2. system defined functions
	*/

	----------------------------------------[SCALER FUNCTIONS]---------------------------
	--Function without any parameter
	create function ShowMessage()
	returns varchar(100)
	AS
	BEGIN
		return 'Welcome to SSMS SQL SERVER'
	END

	select ShowMessage() --'ShowMessage' is not a recognized built-in function name.
	select dbo.ShowMessage() as Defined_Output


	--Function with single parameter
	create function takeNumber(@num as int)
	returns int
	AS
	BEGIN
		return (@num * @num)
	END

	select dbo.takeNumber(5) as Square_Function



	--Function with multiple parameter
	create function Addition(@num1 as int, @num2 as int)
	returns int
	AS
	BEGIN
		return (@num1 + @num2)
	END

	select dbo.Addition(5,4) as Addition_Function



	

	--Altering the function
	Alter function takeNumber(@num as int)
	returns int
	AS
	BEGIN
		return (@num * @num * @num)
	END

	select dbo.takeNumber(5) as CUBE_Function

	
	--Dropping the function
	drop function dbo.takeNumber;


	--calling an inbuilt function inside user defined function
		create function GetMyDate()
		returns DateTime
		AS
		BEGIN
			return GetDate()
		END

		select dbo.GetMyDate()



	--TASK: Create a funtion to check age for voters
	create function checkVoterAge(@age as int)
	returns varchar(100)
	AS
	BEGIN
		declare @str varchar(100)
		if @age >= 18
		BEGIN
			set @str = 'Eligible for Vote'
		END
		else
		BEGIN
			set @str = 'Not Eligible for Vote'
		END
		return @str
	END


	select dbo.checkVoterAge(14) as Age_Confirmation




----------------------------------------[INLINE TABLE VALUED FUNCTIONS]---------------------------
--1. SCALER FUNCTIONS were returning a single value only.
--2. INLINE TABLE VALUED FUNCTIONS returns a table in output. There is no BEGIN and END block.
-- Creating students_tbl table
CREATE TABLE students_tbl (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    standard INT,
    teacher_id INT
);


INSERT INTO students_tbl (name, gender, age, standard, teacher_id)
VALUES
('Aarav', 'Male', 18, 11, 10),
('Bhavna', 'Female', 17, 10, 20),
('Chirag', 'Male', 20, 12, 30),
('Divya', 'Female', 16, 9, 15),
('Esha', 'Female', 17, 8, 25),
('Farhan', 'Male', 15, 7, 10),
('Gauri', 'Female', 18, 11, 20),
('Harsh', 'Male', 19, 12, 40),
('Isha', 'Female', 17, 10, 50);


select *from students_tbl;
	
	--CREATING ITVF without parameter
		create function fn_GetStudent()
		returns table --returning table
		AS
			return (select *from students_tbl)

		select *from dbo.fn_GetStudent();

	
	--CREATING ITVF with a single parameter
		create function fun_GetStudentbyAge(@age as int)
		returns table
		As
		return (select *from students_tbl where age >= @age);


		select *from dbo.fun_GetStudentbyAge(17);





CREATE TABLE tbl_teacher(
    Tid INT PRIMARY KEY,
    TName VARCHAR(50),
    TQualification VARCHAR(50),
    TAge INT
);


INSERT INTO tbl_teacher (Tid, TName, TQualification, TAge)
VALUES
(10, 'Anjali', 'PhD', 28),
(15, 'Rajesh', 'MSc', 30),
(20, 'Sunita', 'MA', 28),
(25, 'Vikram', 'BEd', 26),
(30, 'Priya', 'MBA', 25);


----------Performing JOIN operation using INLINE TABLE VALUED FUNCTIONS-------------------------
	select *from students_tbl;
	select *from tbl_teacher;

--P.S: Return all those students who have age >= 17 and also return the teachers associated with them uisng function.
		select * from fun_GetStudentbyAge(17) as A
		INNER JOIN tbl_teacher as B
		ON
		A.teacher_id = B.Tid;



------------------------------------[MULTI STATEMENT TABLE VALUED FUNCTIONS]---------------------------
--1. A MSTVF is table-valued function that return the result of multiple statements.
--2. In inline functions we were using only 1 select statement, but in MSTVF we can use multiple select statements.
select *from students_tbl




create function fn_GetStudentsByGender(@gender as varchar(20))
returns @myTable table (std_id int, std_name varchar(50), std_gender varchar(50))
AS
BEGIN
	insert into @myTable
	select * from students_tbl where gender = @gender

	return
END






create function fn_GetStudentsByGender(@gender as varchar(20))
returns @myTable table (std_id int, std_name varchar(50), std_gender varchar(50))
AS
BEGIN
	insert into @myTable
	select id, name, gender from students_tbl where gender = @gender

	return
END

select *from [dbo].[fn_GetStudentsByGender] ('Male');




--Doing the same task using INLINE TABLE VALUED FUNCTION
create function fn_GetStudentsByGender2(@gender as varchar(20))
returns table
AS
return (select id, name, gender from students_tbl where gender = @gender)

select *from [dbo].[fn_GetStudentsByGender2] ('Male');




--------------------------[JOINING OF 3 TABLES]---------------------
select *from students_tbl;
select *from tbl_teacher;

create table Branch(
	Bid int primary key,
	BCity varchar(50),
	Std_id int
)

insert into Branch values (1001, 'Agra', 3);
insert into Branch values (1002, 'Delhi', 4);
insert into Branch values (1003, 'Mumbai', 1);


select *from students_tbl;
select *from tbl_teacher;
select *from Branch;


select *from tbl_teacher as A
INNER JOIN students_tbl as B
ON 
A.Tid = B.teacher_id
INNER JOIN Branch as C
ON
B.id = C.std_id;


----------[Displaying Selected Columns Only]--------------------------

select B.name, B.standard, B.age, A.TName, A.TAge, A.TQualification, C.BCity from tbl_teacher as A
INNER JOIN students_tbl as B
ON 
A.Tid = B.teacher_id
INNER JOIN Branch as C
ON
B.id = C.std_id;

use batch_2021

----------------------------------[TRIGGERS]---------------------------------------------
--1. triggers are special kind of SP which are automatically executes when an event occurs in database.
/* 
		There are 3 types of Triggers:
			1. DML Triggers
			2. DDL Triggers
			3. LOGON Triggers
		DML Triggers are fired automatically in response to DML events. (Insert,Update,Delete)

		DML Triggers are of two types:
			1. AFTER TRIGGER (ALSO CALLED FOR TRIGGERS)
			2. INSTEAD of TRIGGERS
*/	
		
-----------Creating Trigger(After Insert) - jb bi koi insert operation krega to trigger execute hoga.
	create trigger tr_student_for_insert
	on students_tbl
	after insert
	as
	BEGIN
		print 'Something happened to student table please check..!'
	END



--now if we insert into students_tbl, this trigger will execute.
select *from students_tbl;
insert into students_tbl(name, gender, Age ,standard, teacher_id) values ('Aman','Male', 19, 11,20); -- trigger will execute

--WHERE THE TRIGGERS ARE STORED..!
--Db-> t able-> Programability -> triggers->


--Altering a trigger
	Alter trigger tr_student_for_insert
	on students_tbl
	after insert
	as
	BEGIN
		print 'Data has been inserted into Students Table, please check the student table..!'
	END


----------------------------------[MAGIC TABLES - INSERTED, DELETED]--------------------------------------
/*
	1. Select *from inserted -> whenever we create after insert trigger, and this line is written inside the trigger,
	 then every time when you perfrom insert operation, it will be stored in INSERTED magic table and also returned to console.

	2. Select *from deleted -> whenever we create after delete trigger, and this line is written inside the trigger,
	 then every time when you perfrom delete operation, it will be stored in DELETED magic table and also returned to console.

	NOTE: these both can be used for auditing purpose, like which row has been deleted show it. same for insertion
*/

---Example of INSERTED
	create trigger tr_student_for_insertion
	on students_tbl
	AFTER INSERT
	AS
	Begin
		select *from INSERTED;
	End
	

insert into students_tbl(name, gender, Age ,standard, teacher_id) values ('Rutuja','Female', 18, 10,21); -- trigger will execute
--when this insertion is perfromed, the trigger will execute and it will return the Newly inserted row into the table.



---Example of DELETED
	create trigger tr_student_for_deletion
	on students_tbl
	AFTER DELETE
	AS
	Begin
		select *from DELETED;
	End

delete from students_tbl where id = 13;
--when this deletion is perfromed, the trigger will execute and it will return the deleted row into the table.

--NOTE:if we add 'n' number of rows than it will show the 'n' newly added rows. Same for deletetion


/* 
P.S -> We have to create an audit table, which preserves the record of the students for Students_tbl
	   whenever a new student is added or deleted with
	   the time of insertion and deletion.
*/

--1. Step 1: Create a student_audit table having Audit_id and Audit_Info
		create table student_audit(
			Audit_id int primary key identity,
			Audit_Info varchar(max)
		)

--2. Create trigger for insert
		Create trigger tr_student_for_insert_audit
		ON students_tbl
		AFTER INSERT
		AS
		BEGIN
			Declare @id int
			Select @id = id from INSERTED

			insert into student_audit values('Student with ID ' + Cast(@id as varchar(50))+ 'is added at ' + Cast(GetDate() as varchar(50)));
		END

--Testing this trigger by perfroming insert operation
insert into students_tbl(name, gender, Age ,standard, teacher_id) values ('Nisha','Female', 18, 11,20); -- trigger will execute

select *from student_audit;



--3. Create trigger for deletion audit
		Create trigger tr_student_for_delete_audit
		ON students_tbl
		AFTER DELETE
		AS
		BEGIN
			Declare @id int
			Select @id = id from DELETED

			insert into student_audit values('Existing Student with ID ' + Cast(@id as varchar(50))+ 'is deleted at ' + Cast(GetDate() as varchar(50)));
		END

--Testing the deletion audit trigger
		delete from students_tbl where id = 14;
		select *from student_audit;



--4. For update trigger
	create trigger tr_student_for_updation
	on students_tbl
	AFTER UPDATE
	AS
	Begin
		select *from INSERTED;
		select *from DELETED;
	End

--Performing the update operation
	update students_tbl set name='Akhil', gender = 'Male' where id = 9;

sp_helptext tr_student_for_updation



----------------------------[INSTEAD OF TRIGGERS]-------------------------------------------
--1. Instead of triggers are executed in place of INSERT, UPDATE or DELETE operations.

/* 
		There are two types of DML triggers
			1. AFTER TRIGGERS
			2. INSTEAD OF TRIGGERS
				(1) INSTEAD OF INSERT TRIGGER
				(2) INSTEAD OF UPDATE TRIGGER
				(3) INSTEAD OF DELETE TRIGGER
			these are executed before constraint checks are perfromed on the table and after the creation of the
			inserted and deleted tables.
*/


CREATE TABLE customer_tbl (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Gender VARCHAR(10),
    City VARCHAR(50),
    PhoneNo VARCHAR(15)
);


INSERT INTO customer_tbl (Id, Name, Gender, City, PhoneNo)
VALUES
(1, 'Rahul', 'Male', 'Delhi', '9876543210'),
(2, 'Priya', 'Female', 'Mumbai', '9876543211'),
(3, 'Amit', 'Male', 'Bangalore', '9876543212'),
(4, 'Neha', 'Female', 'Chennai', '9876543213'),
(5, 'Vikram', 'Male', 'Kolkata', '9876543214'),
(6, 'Rohan', 'Male', 'Hyderabad', '9876543215');

select *from customer_tbl

--INSTEAD OF INSERT TRIGGER
create trigger tr_customer_instead_of_insert
on customer_tbl
INSTEAD OF INSERT --jb bi koi iss table mei insert krega, usse pehel ye trigger fire hoga
AS
Begin
	print 'you are not allowed to insert data in this table..!!'
End
drop trigger tr_customer_instead_of_insert
--ye trigger table mei data insert nhi hone dega, kyuki ye insert hone se pehle chalega
--this trigger will not make any insertion in table, beacause it will run before insert.

--Testing this trigger
INSERT INTO customer_tbl (Id, Name, Gender, City, PhoneNo) VALUES (7, 'Naman', 'Male', 'Delhi', '9876543000')
--this will not allow to insert in the table, but still we get a message '1 row affected' - means ye magic table mei insert hui hai



--INSTEAD OF UPDATE TRIGGER
create trigger tr_customer_instead_of_update
on customer_tbl
INSTEAD OF UPDATE --jb bi koi iss table mei insert krega, usse pehel ye trigger fire hoga
AS
Begin
	print 'you are not allowed to Updat data in this table..!!'
End
--ye trigger table mei data Update nhi hone dega, kyuki ye Update hone se pehle chalega

--Testing
update customer_tbl set Name = 'Priyanshu' where id = 6;



--INSTEAD OF DELETE TRIGGER
create trigger tr_customer_instead_of_delete
on customer_tbl
INSTEAD OF DELETE --jb bi koi iss table mei insert krega, usse pehel ye trigger fire hoga
AS
Begin
	print 'you are not allowed to delete data in this table..!!'
End
--ye trigger table mei data delete nhi hone dega, kyuki ye delete hone se pehle chalega

--Testing
delete from customer_tbl where id = 6

--NOTE: instead of trigger sirf ek hi lagta hai ek table pr




create table Customer_audit(
	Audit_id int primary key identity, 
	Auditt_Information varchar(max)
)





--P.S- we have to store the information in audit table, whenever a new record is inserted, updated or deleted from customer table.


create trigger tr_customer_instead_of_insert_audit
on customer_tbl
INSTEAD OF INSERT --jb bi koi iss table mei insert krega, usse pehel ye trigger fire hoga
AS
Begin
	insert into Customer_audit values ('Someone tried to insert the data in Customer Table at ' + CAST(GetDate() as varchar(50)));
End
--now when we create this trigger it will give error because an INSTEAD OF INSERT trigger already exists on this object.
-- so we have to first drop that trigger.

drop trigger tr_customer_instead_of_insert


--Testing the trigger by inserting data.
INSERT INTO customer_tbl (Id, Name, Gender, City, PhoneNo) VALUES (7, 'Naman', 'Male', 'Delhi', '9876543000')

select *from Customer_audit;
 
--In the same way, we have to make for UPDATE and DELETE operation.
-- applying with Encryption in Triggers





									--[This is very good problem statement]
------------------------------------[INSTEAD OF TRIGGERS WITH VIEWS]-------------------------------------------

/*
According to the rule, agr hum views mei insert/update/delete krte hai to vo actual table mei bi hota hai jisse view bnaya hai humne.

P.S - we have to create a view by using two tables using join, but if we delete any record from view, the SQL engine gets confused
ki dono tables mei se konse table se data delete krna hai.

For this we will use DML INTEAD OF TRIGGERS with VIEWS 
*/

CREATE TABLE Employee_personal_details (
    EmpId INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(50)
);

INSERT INTO Employee_personal_details (EmpId, FirstName, LastName, Address)
VALUES
(1, 'Rahul', 'Sharma', 'Delhi'),
(2, 'Priya', 'Singh', 'Mumbai'),
(3, 'Amit', 'Kumar', 'Bangalore'),
(4, 'Neha', 'Verma', 'Chennai');


CREATE TABLE Employee_salary_details (
    EmpId INT PRIMARY KEY,
    Designation VARCHAR(50),
    Salary INT,
);

INSERT INTO Employee_salary_details (EmpId, Designation, Salary)
VALUES
(1, 'Accountant', 60000),
(2, 'Manager', 80000),
(3, 'Admin', 55000),
(4, 'Incharge', 65000);

select *from Employee_personal_details;
select *from Employee_salary_details;



--creating view
create view vW_Employees
as
Select A.EmpId, A.FirstName, A.LastName, B.Designation, B.Salary from Employee_personal_details as A
INNER JOIN Employee_salary_details as B
ON A.EmpId = B.EmpId;

select * from vW_Employees;

--now if we do delete operation on this view, it will show error as this view is made by joining two tables.
delete from vW_Employees where EmpId = 4; -- View or function 'vW_Employees' 
										  -- is not updatable because the modification affects multiple base tables.
										  -- base tables (Employee_personal_details, Employee_salary_details)

--to resolve this we use INSTEAD OF TRIGGERS

create trigger tr_Insteadof_EmployeeDetails
ON vW_Employees
INSTEAD OF DELETE
AS
BEGIN
	delete from Employee_personal_details where EmpId IN (select EmpId from DELETED) 

	delete from Employee_salary_details where EmpId IN (select EmpId from DELETED) 
END

--Now if i do delete operation in view, the trigger tr_Insteadof_EmployeeDetails will invoked, and will delete the data from base tables.
-- eg:
	delete from vW_Employees where Empid = 4; -- 3 rows affected

--Checking the contents of original table as well as view
	select * from vW_Employees; --data is deleted

	select *from Employee_personal_details;  --data is deleted
	select *from Employee_salary_details;    --data is deleted




------------------------------------[DDL Triggers]-------------------------------------------
--1. CREATE, ALTER, DROP - DDL triggers execute SP when DDL events occur in the database.


--FOR CREATE_TABLE
create trigger tr_for_table_create
ON database
FOR CREATE_TABLE
AS
BEGIN
	print 'New table is created inside the database :'+DB_NAME()
END

--When you create a new table, this trigger will be invoked
create table test1(id int);
drop table test1;


--FOR ALTER_TABLE
create trigger tr_for_table_alter
ON database
FOR ALTER_TABLE
AS
BEGIN
	print 'You have altered the table..!'
END


alter table test add EmpName varchar(50);
select *from test;


--FOR DROP_TABLE
create trigger tr_for_table_drop
ON database
FOR DROP_TABLE
AS
BEGIN
	print 'You have dropped the table..!'
END

drop table test;

--Location of these triggers: database->programability->database triggers

-- we can create seperate trigger combining these three operations in one.
	create trigger tr_ddl_table
	on database
	FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
	AS
	BEGIN
		print 'you have created, altered and dropped the table..!'
	END

--NOTE: CREATE_TABLE, ALTER_TABLE, DROP_TABLE these are pre-defined operations. On internet we have more like these. 
--eg: FOR CREATE_PROCEDURE

	create trigger tr_ddl_table
	on database
	FOR CREATE_PROCEDURE
	AS
	BEGIN
		print 'you have created procedure..!'
	END


--Applying the restriction: You cannot create stored procedure - USING ROLLBACK COMMAND
	create trigger tr_ddl_table
	on database
	FOR CREATE_PROCEDURE
	AS
	BEGIN
		ROLLBACK
		print 'You are not allowed to create store procedure..!'
	END

	drop trigger tr_ddl_table on database;

--testing the trigger
	create procedure spGetEmployeeees
	AS
	BEGIN
		SELECT *FROM MyEmployees;
	END

-- Similarly we can ALTER the SP, similar for views, 
-- we can also apply triggers on SERVERS, VIEWS etc.

use batch_2021





------------------------------------[Setting the execution order of TRIGGERS]-------------------------------------------
--1. using SETTRIGGERORDER (@triggername, @order, @stmttype)
-- @order - FIRST, LAST, NONE
--@stmttype - specifies the type of SQL statement (INSERT, UPDATE, DELETE)

create table TestOrder(Id int, Name varchar(20));
insert into TestOrder values (1, 'Shreya');
insert into TestOrder values (2, 'Raman');
insert into TestOrder values (3, 'Priya');
insert into TestOrder values (4, 'Ashok');

create trigger tr_order_3
ON TestOrder
AFTER INSERT
AS
BEGIN
	print 'this is the 3rd trigger'
END



create trigger tr_order_2
ON TestOrder
AFTER INSERT
AS
BEGIN
	print 'this is the 2nd trigger'
END


create trigger tr_order_1
ON TestOrder
AFTER INSERT
AS
BEGIN
	print 'this is the 1st trigger'
END


--testing of the order
insert into TestOrder values (5, 'Aditya');

--Now i want to manually set the exection order of triggers. 1st trigger then 2nd then 3rd trigger.

	execute sp_settriggerorder
	@triggername = 'tr_order_1',
	@order = 'FIRST',
	@stmttype = 'INSERT'

	execute sp_settriggerorder
	@triggername = 'tr_order_3',
	@order = 'LAST',
	@stmttype = 'INSERT'

--testing of the order, after manually setting it
insert into TestOrder values (6, 'Manav');


--Disabling the trigger
disable trigger tr_ddl_table on database;


--Enabling the trigger
enable trigger tr_ddl_table on database;



------------------------------------[GUID]-------------------------------------------------
--1. GUID is a globally unique identifier - it is 16 byte binary data type which makes that column unique globally in database.
--2. To create GUID use NEWID() function


CREATE TABLE Customer_Agra (
    Id UNIQUEIDENTIFIER PRIMARY KEY default newid(),
    Name VARCHAR(50)
);


INSERT INTO Customer_Agra (Id, Name)
VALUES
(default,'Ravi Kumar'),
(default,'Suman Gupta'),
(default,'Pankaj Mishra'),
(default,'Neha Singh'),
(default,'Anil Verma');


CREATE TABLE Customer_Delhi (
    Id UNIQUEIDENTIFIER PRIMARY KEY default newid(),
    Name VARCHAR(50)
);


INSERT INTO Customer_Delhi (Id, Name)
VALUES
(default,'Rajesh Sharma'),
(default,'Priya Mehra'),
(default,'Amit Khanna'),
(default,'Kavita Jain'),
(default,'Sunil Arora');

select NEWID();

create table Customers_New (Id UNIQUEIDENTIFIER PRIMARY KEY default newid(), Name Varchar(50));


--P.S-> I want to merge these two table into a single table named as Customers_New, but if i do then ID column will have the
-- repeated value which is not accepted in Customers_New table as it is having ID as PRIMARY KEY.
-- to resolve this make ID column of above two tables as GUID.

insert into Customers_New
select *from Customer_Agra
UNION ALL
select *from Customer_Delhi

select *from Customers_New









--TASK: create seperate table with GUID in Agra database named as AGRA_TABLE_CUSTOMER
--		create seperate table with GUID in Delhi database named as DELHI_TABLE_CUSTOMER
--		Now in Delhi database create a table Customer_Combined_FROM_Different_DB and store the AGRA_TABLE and DELHI_TABLE data into it.


create database Agra_DB;
use Agra_DB;

CREATE TABLE Agra_Table_Customers (
    Id UNIQUEIDENTIFIER PRIMARY KEY default newid(),
    Name VARCHAR(50)
);


INSERT INTO Agra_Table_Customers (Id, Name)
VALUES
(default,'Ravi Kumar'),
(default,'Suman Gupta'),
(default,'Pankaj Mishra'),
(default,'Neha Singh'),
(default,'Anil Verma');



create database Delhi_DB;
use Delhi_DB;

CREATE TABLE Delhi_Table_Customers (
    Id UNIQUEIDENTIFIER PRIMARY KEY default newid(),
    Name VARCHAR(50)
);


INSERT INTO Delhi_Table_Customers (Id, Name)
VALUES
(default,'Rajesh Sharma'),
(default,'Priya Mehra'),
(default,'Amit Khanna'),
(default,'Kavita Jain'),
(default,'Sunil Arora');


create table CUSTOMERS_COMBINED_FROM_DIFFERENT_DB (Id UNIQUEIDENTIFIER PRIMARY KEY default newid(), Name Varchar(50));

insert into CUSTOMERS_COMBINED_FROM_DIFFERENT_DB
select *from Agra_DB.dbo.Agra_Table_Customers
UNION ALL
select *from Delhi_DB.dbo.Delhi_Table_Customers

select *from CUSTOMERS_COMBINED_FROM_DIFFERENT_DB;






-------------------[COMPUTED COLUMNS] ----------------------------

create table Employee_Payroll(
	EmpId int identity,
	EmpName varchar(20),
	Designation varchar(20),
	[Basic Pay] int,
	[House Rent Allowance] int,
	[Convinience Allowance] int,
	[Medical Allowance] int,
	[Gross Pay] as [Basic Pay] + [House Rent Allowance] + [Convinience Allowance] + [Medical Allowance]
)

INSERT INTO Employee_Payroll (EmpName, Designation, [Basic Pay], [House Rent Allowance], [Convinience Allowance], [Medical Allowance])
VALUES
('John', 'Manager', 50000, 10000, 5000, 2000),
('Jane', 'Developer', 40000, 8000, 4000, 1500),
('Bob', 'Designer', 35000, 7000, 3500, 1000),
('Alice', 'Tester', 30000, 6000, 3000, 1200),
('Charlie', 'HR', 45000, 9000, 4500, 1800);

select *from Employee_Payroll -- Gross pay is calculated by itself
-- tables -> columns-> computed columns


Alter table Employee_Payroll add [Company Name] as 'Trident tech'; -- setting the computer column as Constant value

Alter table Employee_Payroll add [Date] as GetDate();

-- Task: add a computed column named as Percentage of medical allowance to gross pay.

/* 
	1. Persisted Computed Columns: As soon as we declare them in a create table command, they are stored physically that time only.
	2. Non-Persisted Computed columns: When we use Select Command, then only they compute the value, till then they are not physically stored.
*/

create table Employee_Payroll(
	EmpId int identity,
	EmpName varchar(20),
	Designation varchar(20),
	[Basic Pay] int,
	[House Rent Allowance] int,
	[Convinience Allowance] int,
	[Medical Allowance] int,
	[Gross Pay] as [Basic Pay] + [House Rent Allowance] + [Convinience Allowance] + [Medical Allowance] persisted
)

--NOTE: If there is updation in any of the column used to calculate the computed column value, then computed column value is also changed.
--		eg: agr Basic pay increase hoti hai kisi ki, to gross pay apne aap increase hojaegi

update Employee_Payroll set [Basic Pay] = 50000 where EmpId = 1;








------------------------------[CUBE and ROLL UP Command]----------------------------------
--CUBE and ROLL UP are used with GROUP BY Command.
--1. Similar to GROUP BY, it is an aggregate operator that produces a super-aggregate row.
--2. CUBE() in SQL produces the result set by generating all combinations of columns specified in GROUP BY CUBE()

--Eg: Write a query to retieve sum of salary grouped by all possible combinations of 2 columns(City and Gender) as well as Grand total.


CREATE TABLE Employee_Details (
    Id INT IDENTITY PRIMARY KEY,
    Name VARCHAR(50),
    Gender VARCHAR(10),
    City VARCHAR(50),
    Salary INT
);


INSERT INTO Employee_Details (Name, Gender, City, Salary)
VALUES
('Aarav', 'male', 'Agra', 15000),
('Vikram', 'male', 'Delhi', 12000),
('Priya', 'female', 'Agra', 14000),
('Rohan', 'male', 'Delhi', 11000),
('Sita', 'female', 'Delhi', 13000),
('Arjun', 'male', 'Mumbai', 11000),
('Kiran', 'female', 'Mumbai', 16000),
('Neha', 'female', 'Delhi', 17000),
('Raj', 'male', 'Mumbai', 12000),
('Anjali', 'female', 'Agra', 15000);

select *from Employee_Details

--City ke according sum(salary) show krwani hai - using group by
select city, sum(salary) as Total_Salary from Employee_Details
GROUP BY city;

select city, gender, sum(salary) as Total_Salary from Employee_Details
GROUP BY city,gender;

--CUBE() - It will give all possible combination used with GROUP BY Command + it gives sub-total and grand-total.
select city, gender, sum(salary) as Total_Salary from Employee_Details
GROUP BY CUBE(city,gender);

select city, sum(salary) as Total_Salary from Employee_Details
GROUP BY city with CUBE;


--ROLL UP() - It work in a heriarchy, as compared to CUBE() it does not considers all possible combinations.
-- Parent-Child order mei show krta hai, jo group by order mei specify kre hue honge.
-- it gives data in ascending order.
--
select city, gender, sum(salary) as Total_Salary from Employee_Details
GROUP BY ROLLUP(city,gender); --city fir uske child male & female, aise ayega data group hoke

select city, sum(salary) as Total_Salary from Employee_Details
GROUP BY city with ROLLUP;







-------------------------------[GROUPING SETS]-------------------------------------------
/*
	1. The Grouping Sets operator allows you to group together multiple grouping of columns followed by an optional grand total
	   row, denoted by parenthesis ().
	2. It is said to use Grouping Sets instead of multiple Group by with UNION clause, because they use more memory.
	3. It is used with GROUP BY clause.
*/

select City, Gender, sum(salary) as Total_Salary from Employee_Details
group by City, Gender
UNION ALL
select City, NULL as [Male / Female], sum(salary) as Total_Salary from Employee_Details
group by City

--tricky query
select NULL as City, NULL as [Male / Female], sum(salary) as Total_Salary from Employee_Details
group by () -- this will return city and gender combined total salary - 136000



--This is more complex way to write and also takes more time, so we use Groupin Sets.


select * from Employee_Details;

select City, Gender, sum(Salary) as Total_Salary
from Employee_Details
GROUP BY

GROUPING SETS(
	(City,Gender),  -- pehle group (City, Gender) ka
	(City),
	(Gender),
	() --------this means grand total
)
ORDER BY GROUPING(City), GROUPING(Gender);  --isse grand total ekdum last mei ayega
--NOTE: Output mei data sorted form mei nhi aata uske liye hum order by se specify krdete hai ki, pehle kiska group chaiye
--NOTE: apni marzi se groups bna ke data dekh skte hai hum




-----------------------------[MERGE STATEMENT]----------------------------------------

		/* 
			merge Target_Table as T
			using Source_Table as S

			on [JOIN CONDITION]

			When matched then
				[update in target table]
			When not matched by target then
				[Insert in target table]
			When not matched by source then
				[Delete Statement]

	we have source table and we have target table, we check for conditions and if some data is not present in target table but present in
	source table, then we add it to the target table.
		*/

	create table Employee_Source(Id int, Name varchar(20), Gender varchar(20));

	insert into Employee_Source values (1, 'Alok', 'Male');
	insert into Employee_Source values (2, 'Nisha', 'Female');
	insert into Employee_Source values (3, 'Naman', 'Male');

	drop table Employee_Source
	drop table Employee_Target


	create table Employee_Target(Id int, Name varchar(20), Gender varchar(20));

	insert into Employee_Target values (1, 'Priya', 'Female');
	insert into Employee_Target values (2, 'Naman', 'Male');
	insert into Employee_Target values (3, 'Piyush', 'Male');
	insert into Employee_Target values (4, 'Monika', 'Female');

	select *from Employee_Source
	select *from Employee_Target

	truncate table Employee_Source
	truncate table Employee_Target


--Merge Statement
	merge Employee_Target as T
	using Employee_Source as S
	ON T.id = S.id

	when matched then
		update set T.name = S.name, T.gender = S.gender
	When not matched by target then
		insert (id,name,gender) values (S.id, S.name, S.gender)
	When not matched by source then
		Delete;


--NOTE: We usually don't do the delete operation, as it may delete some important data from target table so, we preserve it.

	merge Employee_Target as T
	using Employee_Source as S
	ON T.id = S.id

	when matched then
		update set T.name = S.name, T.gender = S.gender
	When not matched by target then
		insert (id,name,gender) values (S.id, S.name, S.gender);
		




---------------------------TRANSACTION IN SQL---------------------------
/*
	- Whenever we perform any operation (CRUD) inside the database, these operations are treated as 
	  TRANSACTIONS.
	- Also known as T-SQL.
*/
-- 1. T-SQL - transaction is a single unit of work.
-- 2.  TCL - TCL commands COMMIT and ROLLBACK
-- 3. Discuss ACID Properties
-- 4. Transactions are merged at Connection(Query File is known as connection) Level.


CREATE TABLE Students (
    Id INT IDENTITY PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Class INT
);


INSERT INTO Students (Name, Age, Class)
VALUES
('Aarav', 17, 8),
('Vikram', 16, 4),
('Priya', 15, 6),
('Rohan', 16, 7),
('Sita', 17, 8),
('Kiran', 15, 6);


use batch_2021
select *from Students;

--For normal statements like update, if i am updating some data in the table then it cannot be undone.
--eg: 
	update Students set Name = 'Ayush' where Id = 6;        --IMPLICIT TRANSACTION
--Now if i want to rollback/undo this command i cannot do it.
--I should have some UNDO mechanism. for that we have TRANSACTION in SQL

-- CASE 1: Without Commit
-- We can write that update command inside a Transaction
Begin Transaction                              --EXPLICIT TRANSACTION
	update Students set Name = 'Ayush' where Id = 6; 

/*
NOTE: If i open a new query tab (new connection) and try to do select * from Students in it. It will not
	  run as we have not commited the transaction. So we have to commit it.
*/


-- CASE 2: With Commit
Begin Transaction
	update Students set Name = 'Ayush' where Id = 6; 
Commit Transaction -- it will commit the changes done by update command inside the transaction.



--Suppose I want to rollback the transaction.
-- CASE 2: With Rollback
Begin Transaction
	update Students set Name = 'Ayush' where Id = 6; 

Rollback Transaction; -- UNDO

Commit Transaction ; -- Permanent Commit in table

--NOTE: Either you should do the commit OR rollback to the transaction. (MUST ACTION)


-- We can have multiple operations inside a transaction. The condition is all the commands
-- should be correct and working. If any of the command fails, transaction will  be rollbacked.

Begin Transaction
	update Students set Name = 'Ayush' where Id = 5; 
	delete from Students where Id = 6;

-- after doing this transaction I have two options, either i can rollback the transaction or i can commit the changes permanently.

Rollback Transaction; -- UNDO

Commit Transaction ;


--Setting the ISOLATION LEVEL to READ UNCOMMITED by defaultt it is READ COMMITED.
/*
NOTE: If i open a new query tab (new connection) and try to do select * from Students in it. It will not
	  run as we have not commited the transaction. So we have to commit it.

	  we can make it visible in another connection

	  if we want to see the uncommited data in another connection, in that case we have to use :
*/
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;   --In  a seperate connection file, if we write this then we can se uncommited data.




--------------------------[TRY CATCH]--------------
--1.  Demonstrate try-catch
		BEGIN TRY
			select 10/0
			print 'New Line for testing'
		END TRY

		BEGIN CATCH
			print 'Cannot divide by zero'
		END CATCH


--2. Example: Storing varchar in Age column
		BEGIN TRY
			Update Students set Age = 'abc' where id = 1
		END TRY

		BEGIN CATCH
			print 'You cannot insert string value in this attribute'
		END CATCH


/*
	We can get the information about the error like, error number, error severity etc.
	we have fucntions for this

	1. ERROR_NUMBER()
	2. ERROR_SEVERITY()
	3. ERROR_STATE()
	4. ERROR_PROCEDURE()
	5. ERROR_LINE()
	6. ERROR_MESSAGE()
*/


		BEGIN TRY
			select 10/0
			print 'New Line for testing'
		END TRY

		BEGIN CATCH
		print 'cannot divide by zero'
		select
			ERROR_NUMBER() as [ERROR NUMBER],
			ERROR_SEVERITY() as [ERROR SEVERITY],
			ERROR_STATE() as [ERROR STATE],
			ERROR_PROCEDURE() as [ERROR PROCEDURE],
			ERROR_LINE() as [ERROR LINE],
			ERROR_MESSAGE() as [ERROR MESSAGE]
		END CATCH



-- For a Procedure
create Procedure ErrorProcedure
as
BEGIN
		BEGIN TRY
			select 10/0
			print 'New Line for testing'
		END TRY

		BEGIN CATCH
		print 'cannot divide by zero'
		select
			ERROR_NUMBER() as [ERROR NUMBER],
			ERROR_SEVERITY() as [ERROR SEVERITY],
			ERROR_STATE() as [ERROR STATE],
			ERROR_PROCEDURE() as [ERROR PROCEDURE],
			ERROR_LINE() as [ERROR LINE],
			ERROR_MESSAGE() as [ERROR MESSAGE]
		END CATCH
END
	
execute ErrorProcedure



-----------------------------[TRANSACTIONS WITH TRY CATCH]----------------------
select *from Students;

/*
	write 3 insert statements inside a transaction, if last transaction fails then, you have to rollback
	the transaction to its original state.
*/

BEGIN TRY
	BEGIN TRANSACTION
		insert into Students(Name, Age, Class) values ('Anisha',16,8);
		insert into Students(Name, Age, Class) values ('Neha',17,8);
		insert into Students(Name, Age, Class) values ('Mayank',19,9);
	COMMIT TRANSACTION --permanent data save
	print 'Transaction Successfully Done'
END TRY

BEGIN CATCH
--if any error occurs in any of the 3 lines then transaction will be rolled back.
	ROLLBACK TRANSACTION
	print 'Transaction Failed..!'
	select ERROR_MESSAGE() as [ERROR MESSAGE]
END CATCH

--this will execute successfully..!


BEGIN TRY
	BEGIN TRANSACTION
		insert into Students(Name, Age, Class) values ('Anish',17,9);
		insert into Students(Name, Age, Class) values ('Rahul','Meena',9); -- this line will not execute, and it will rollback
																		   -- all the above lines.
		
	COMMIT TRANSACTION --permanent data save
	print 'Transaction Successfully Done'
END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION
	print 'Transaction Failed..!'
	select ERROR_MESSAGE() as [ERROR MESSAGE]
END CATCH


delete from Students where id = 10



-----------------------SAVE POINTS IN TRANSACTIONS-----------------------------------

BEGIN TRANSACTION
	insert into Students(Name, Age, Class) values ('Nitasha',21,9);
	SAVE TRANSACTION SAVE_PT1



BEGIN TRANSACTION
	insert into Students(Name, Age, Class) values ('Raman',23,10);
	SAVE TRANSACTION SAVE_PT2


insert into Students(Name, Age, Class) values ('Vanshika',20,8);


--ROLLING BACK TO THE SPECIFIC SAVE POINT

BEGIN TRANSACTION
	ROLLBACK TRANSACTION SAVE_PT1

















----------------------[TEMPORARY TABLES]-----------------------------
--1. similar to permanent tables, these are stored in tempDB(system databases in SSMS)
--2. If we want to store the tempoary data -> go for temporary tables

/* 
	TYPES: 
		1. LOCAL TEMPORARY TABLE
		2. GLOBAL TEMPORARY TABLE
*/


-- LOCAL TEMPORARY TABLE (#)---------------------------
create table #EmpData(
	Name varchar(50),
	Gender varchar(50)
)
--location - > system databases - > tempDB

select name from tempdb..sysobjects
where name like '%EmpData%'

select *from #EmpData;

insert into #EmpData values('Alok', 'Male');

/*
	1. Local Temp Table is available only in the connection in which it is made. It is not accessible
		outside that connection.
	2. Local temp table is automatically dropped, when connection is closed.
	3. if temporary table is created inside SP then it is dropped when SP completes its execution.
	4. we can have local temp table with same name in different connections.

*/

create procedure spEmpData
AS
BEGIN
	create table #EmpData1(
	Name varchar(50),
	Gender varchar(50)
	)

	insert into #EmpData1 values('Alok', 'Male');
	select *from #EmpData1;
END


execute spEmpData
select *from EmpData1; --here we can see this table is not created. 



-- GLOBAL TEMPORARY TABLE (##)---------------------------

/*
	1. Global tables are accessible in all the connections.
	2. if we close the connection that has created the global temporary
		table then the global temporary table will automatically deleted.
	3. Cant create the global temporary table with same name in different connections.
	4.  No Suffix are generated at the end of Global Temp Tables.

	Location -> tempDB same as temporary table
*/

create table ##EmpData(
	Name varchar(50),
	Gender varchar(50)
)
--location - > system databases - > tempDB

select name from tempdb..sysobjects
where name like '%EmpData%'

select *from ##EmpData;

insert into ##EmpData values('Alok', 'Male');





---------------------[ COALESCE() ]------------------------------
/*
	1. It return the first non-null value in a list.
	2.  COALESCE(val1, val2...val3)
	


*/

select coalesce(NULL, NULL, 'Alok', NULL, 'HELLO WORLD'); -- it returns 1st NON-NULL value.

create table fullName(
	Id int identity,
	First_name  varchar(20),
	Middle_Name varchar(20),
	Last_name varchar(20)
)

insert into fullName values( NULL, 'Alok',NULL)
insert into fullName values (NULL, NULL, 'Singh')
insert into fullName values('Naman',NULL,NULL)
insert into fullName values( NULL, 'Kumar','Rawat')
insert into fullName values('Ayush', NULL,'Mehta')

select *from fullName

--TASK: Fetch first non-null value from each row
select id, coalesce(First_name,Middle_Name,Last_name) from fullName


--------------------------COALESCE() vs ISNULL()-------------------
--1. ISNULL() - It only takes two arguments, COALSCE() takes multiple arguments.
	--iSNULL() takes 2 arguments. Dono arguments mei se jo non-null hoga vo return krdega bs. 
--2. COALSCE() gives first non-null value from the list, not the case with ISNULL()
select id, ISNULL(Middle_Name,Last_name) from fullName



-------------------CAST() IN SQL-----------------------------
--1. CAST() coverts a value into a specified datatype.

		select CAST(23.45 as int) as Value;
		select CAST('2023-05-03' as datetime) as Date;


-- Create Employee_joining table
CREATE TABLE Employee_joining (
    Id INT IDENTITY PRIMARY KEY,
    Name VARCHAR(50),
    Joining_date DATETIME
);

-- Insert data into Employee_joining table
INSERT INTO Employee_joining (Name, Joining_date)
VALUES
('Rajesh', '2024-05-10 09:30:00'),
('Amit', '2024-05-11 10:00:00'),
('Pooja', '2024-05-12 11:15:00'),
('Suresh', '2024-05-13 12:45:00'),
('Neha', '2024-05-14 14:30:00'),
('Ravi', '2024-05-15 15:00:00'),
('Anita', '2024-05-16 16:20:00'),
('Sunil', '2024-05-17 17:35:00');

select *from Employee_joining

0
select name + ' - ' +id from Employee_joining;
--this will give error Conversion failed when converting the varchar value 'Rajesh - ' to data type int.

select name + ' - ' +CAST(id as varchar(10)) as [Name - Id] from Employee_joining;



--TASK: suppose we have to insert Age along with the Name in Name column

insert into Employee_joining values('Nisha'+CAST(26 as varchar(10)), '2024-05-17 17:35:00')



--Inserting string date as DateTime using CAST()
insert into Employee_joining values('Raman', cast('2024-05-17 17:35:00' as datetime))



--I want the data of employees who joined on  specified date.
select *from Employee_joining where CAST(Joining_date as date) = '2024-05-12 11:15:00.000';

select id, CAST(Joining_date as date) as Joining_Date from Employee_joining where CAST(Joining_date as date) = '2024-05-12 11:15:00.000';


select CAST(Joining_date as date) as Joining_Date, count(id) from Employee_joining
GROUP BY CAST(Joining_date as date) 








--------------------Stored Procedure Once Again-----------------------------

/*
	1. How to create store procedure?
	2. How to modify store procedure?
	3. How to drop stored procedure?
	4. How to send parameters in stored procedure?
	5. Types of parameters in stored procedure
	6. How to encrypt stored procedure.

	data of SP is stored in cache
	Query is not saved permanently, but stored procedures are. thats why we use them.
*/


CREATE TABLE employee_Information (
    EmpId INT IDENTITY(1,1) PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptId INT,
    Salary DECIMAL(10, 2),
    JoinYear INT
);


INSERT INTO employee_Information (EmpName, DeptId, Salary, JoinYear) VALUES
('Amit', 1, 50000.00, 2015),
('Neha', 2, 60000.00, 2016),
('Raj', 3, 55000.00, 2017),
('Priya', 1, 58000.00, 2018),
('Anil', 2, 52000.00, 2019),
('Sunita', 3, 59000.00, 2020),
('Vikram', 1, 53000.00, 2021),
('Ritu', 2, 62000.00, 2015),
('Rohit', 3, 51000.00, 2016),
('Kavita', 1, 57000.00, 2017);



select *from Employee_Information;

select *from employee_Information where DeptId = 1;
--If i have to compute this result again and again, then i have to run the query again and again
--which is not feasible. So we will create stored procedure.

create Procedure spDeptList
AS
BEGIN
	select *from employee_Information where DeptId = 1;
END

--Executing SP
execute spDeptList

-- Modifying the SP

alter Procedure spDeptList
AS
BEGIN
	select *from employee_Information where DeptId = 1;
	select *from employee_Information where DeptId = 2;
END

execute spDeptList

--Dropping SP
drop procedure spDeptList


-- TASK: I want to make the SP dynamic, that takes id and computes the result


create Procedure spDeptListDynamic
@dept_id int,
@emp_name varchar(50)
AS
BEGIN
	select *from employee_Information where DeptId = @dept_id;
	select *from employee_Information where EmpName = @emp_name;
END


execute spDeptListDynamic 1, 'Raj'; --here values are passed in order
--but what if i dont want to pass them in order

--Solution
execute spDeptListDynamic @emp_name = 'Raj', @dept_id = 1;




--Assigning the default parameters
create Procedure spDeptListDynamic1
@dept_id int = 1,
@emp_name varchar(50) = 'Raj'
AS
BEGIN
	select *from employee_Information where DeptId = @dept_id;
	select *from employee_Information where EmpName = @emp_name;
END


execute spDeptListDynamic1 --it will take the default values.

execute spDeptListDynamic1 1, 'Priya' -- here default parameters are overrriden




------------OUTPUT PARAMETERS------------------
create Procedure spAddDigit
@num1 int,
@num2 int,
@Result int OUTPUT
AS
BEGIN
	set @Result = @num1 + @num2
END

declare @addition int
execute spAddDigit 4, 4, @addition OUTPUT;
select @addition;

use batch_2021;
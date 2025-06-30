--create a stored procedure which returns the total number of employees according to gender asked to stored procedure

create table SP_employee(
	empid int PRIMARY KEY,
	empName varchar(45),
	salary float,
	gender varchar(10))


insert into SP_employee values(1,'Shivam',50000,'Male');
insert into SP_employee values(2,'Sarthak',51000,'Male');
insert into SP_employee values(3,'XYZ',50000,'Female');
insert into SP_employee values(4,'ABC',50000,'Female');

select * from SP_employee

--here is the solution to return number of employees with certain gender
create procedure sp_num_employees1 @gender varchar(10), @count int output
as 
begin
	select @count = count(empid) from SP_employee
	where gender = @gender;
end

DECLARE @count int 
EXEC sp_num_employees1 @gender = 'Male' , @count = @count output
PRINT 'Number of Employees : '+CAST(@count as varchar);

 
--if you want to return a table
create procedure sp_num_employees2 @gender varchar(10)
as 
begin
	select * from SP_employee
	where gender = @gender;
end

EXEC sp_num_employees2 @gender = 'Male' 



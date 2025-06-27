select * from Employees_procedure

--we have to create a stored procedure to increase the salary and return using output parameter
create or alter PROCEDURE increase_salary3 @emp_id int, @updated_salary decimal(10,2) OUTPUT
AS
BEGIN
	--update salary in table by 10%
	UPDATE Employees_procedure
	set salary = salary+0.10*salary
	where emp_id = @emp_id;

	--updating value for output parameter
	select @updated_salary = salary
	from Employees_procedure where emp_id = @emp_id;
END

--calling the stored procedure for emp_id 1
DECLARE @updated_salary decimal(10,2)
EXEC increase_salary3 1, @updated_salary output
PRINT @updated_salary

select * from Employees_procedure
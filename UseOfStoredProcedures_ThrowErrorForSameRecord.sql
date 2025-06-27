CREATE TABLE Employees_procedure (
    emp_id INT IDENTITY(1,1) PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL(10,2),
    joining_date DATE
);

INSERT INTO Employees_procedure (emp_name, salary, joining_date) VALUES
('Alice', 50000.00, '2023-01-01'),
('Bob', 60000.00, '2023-03-15');


select * from Employees_procedure

--creating a procedure to check if there exists a same name and joining date
CREATE OR ALTER PROCEDURE pc_check
	@name varchar(100), 
	@salary DECIMAL(10,2),
	@j_date DATE
AS
BEGIN
		IF EXISTS(select 1 from Employees_procedure where emp_name = @name AND joining_date = @j_date)
			BEGIN
				--error starts from 50000 and then we pass message, then state which defines the location
				THROW 50000, 'SAME NAME AND SALARY NOT ALLOWED',1;
			END
		ELSE
			BEGIN
				--if there is no record then insert into table
				insert into Employees_procedure(emp_name,salary,joining_date) values(@name,@salary,@j_date);
			END
END

--calling the procedure
exec pc_check 'John' , 50000.00, '2023-01-01'
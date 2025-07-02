CREATE TABLE Employees_fn (
    EmpID INT PRIMARY KEY,
    EmpName NVARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    HireDate DATE,

);

INSERT INTO Employees_fn (EmpID, EmpName, DepartmentID, Salary, HireDate) VALUES
(1, 'Chirag', 101, 75000, '2021-01-03'),
(2, 'Satyam', 102, 68000, '2021-10-03');

select * from Employees_fn

--function to return the number of years of experience of employees
create or alter function fn_exp(@id int)
returns int
as 
begin
	return (
		select DATEDIFF(year,HireDate,GETDATE()) - 
		CASE WHEN MONTH(HireDate)>MONTH(GETDATE()) OR MONTH(HireDate)=Month(GETDATE()) AND DAY(HireDate)>DAY(GETDATE())
		THEN 1 ELSE 0
		END
		from Employees_fn where EmpID = @id)
end

--calling function using DBO.function name DBO is DATABASE ORAGANIZER
select DBO.fn_exp(2) as Experience; 
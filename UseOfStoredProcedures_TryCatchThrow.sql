
--create a procedure to throw an error if number if odd using try catch block
create procedure pc_isEven @num int
as 
begin
	if @num%2 = 0
		PRINT 'GOOD'
	ELSE THROW 50000,'NOT GOOD',1;
end

--calling procedure using try catch block to print the error
BEGIN TRY
	exec pc_isEven @num =47
END TRY

BEGIN CATCH
	PRINT ERROR_MESSAGE();
END CATCH
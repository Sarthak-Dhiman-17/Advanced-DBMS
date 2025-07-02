
--procedure for fibonacci nth number in sql server
create or alter procedure fib2 @n int,@result int output
as 
begin
	DECLARE @x int = 0,@y int = 1;
	WHILE @n >0
	BEGIN
		DECLARE @curr int = @x+@y;
		SET @x = @y;
		SET @y = @curr;
		SET @n = @n-1;
	END
	SET @result = @x
end

--calling the procedure
DECLARE @result int
exec fib2 10, @result output
PRINT 'Number at 10 is : '+CAST(@result AS VARCHAR)
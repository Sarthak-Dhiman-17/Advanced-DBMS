--factorial of a number using recursion
create or alter procedure Fact @n int,@result int output
as 
begin
	if @n<=1
		set @result = 1;
	ELSE
	BEGIN
		DECLARE @x int=@n-1
		--here recursion occurs
		EXEC Fact @x, @result OUTPUT
		SET @result = @result*@n;
	END
end

--calling the procedure
DECLARE @result int 
exec Fact 5,@result output
PRINT @result
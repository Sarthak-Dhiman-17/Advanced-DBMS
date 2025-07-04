CREATE TABLE Employee_t(
    ID INT PRIMARY KEY,
    NAME VARCHAR(100),
    PER_HOUR_SALARY DECIMAL(10, 2),
    REQUIRED_HOURS INT,
    PAYABLE_AMOUNT DECIMAL(18, 2)  -- manually maintained
);

INSERT INTO Employee_t (ID, NAME, PER_HOUR_SALARY, REQUIRED_HOURS)
VALUES (1, 'SHALABH', 1000, 22),
       (2, 'NISHA', 20000, 22);


select * from Employee_t

--Trigger in SQL SERVER
--Insert into table if payable amount is less than 25000 else throw error
create or alter TRIGGER restrict_user
ON Employee_t
INSTEAD OF INSERT
AS 
BEGIN
	IF EXISTS(SELECT 1 from INSERTED where PER_HOUR_SALARY*REQUIRED_HOURS >25000)
	BEGIN
		THROW 50000,'CAN NOT PAY MORE THAN 25000',1;
	END 
	ELSE
	BEGIN
        INSERT INTO Employee_t (ID, NAME, PER_HOUR_SALARY, REQUIRED_HOURS, PAYABLE_AMOUNT)
        SELECT 
            ID,
            NAME,
            PER_HOUR_SALARY,
            REQUIRED_HOURS,
            PER_HOUR_SALARY * REQUIRED_HOURS
        FROM inserted;
    END
END

truncate table Employee_t

INSERT INTO Employee_t (ID, NAME, PER_HOUR_SALARY, REQUIRED_HOURS, PAYABLE_AMOUNT)
VALUES (4, 'Aayush', 5000.00, 40, NULL); 

-- Create the Employees table
CREATE TABLE Employees (
    EMP_ID INT PRIMARY KEY,
    EMAIL VARCHAR(100)
);

-- Insert data

INSERT INTO Employees (EMP_ID, EMAIL)
VALUES 
(1, 'AMAN@GMAIL.COM'),
(2, 'SHREYA@OUTLOOK.COM'),
(3, 'PIYUSH@HOTMAIL.COM');

-- find the domains of email used only 
select SUBSTRING(EMAIL, charindex('@',EMAIL) + 1,
LEN(EMAIL)-charindex('@',EMAIL)) as Domain from Employees
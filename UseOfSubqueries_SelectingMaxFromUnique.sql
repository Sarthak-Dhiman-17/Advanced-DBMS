-- Create the table
CREATE TABLE Emp_SWC (
    Emp_Id INT
);

INSERT INTO Emp_SWC(Emp_Id) VALUES (2);
INSERT INTO Emp_SWC(Emp_Id) VALUES (5);
INSERT INTO Emp_SWC(Emp_Id) VALUES (6);
INSERT INTO Emp_SWC(Emp_Id) VALUES (6);
INSERT INTO Emp_SWC(Emp_Id) VALUES (7);



INSERT INTO Emp_SWC(Emp_Id) VALUES (8);
INSERT INTO Emp_SWC(Emp_Id) VALUES (8);

select * from Emp_SWC

--actual answer
select TOP 1 Emp_Id from Emp_SWC
GROUP BY Emp_Id HAVING COUNT(*) = 1
order by Emp_Id desc

--using subquery
Select MAX(Emp_Id)'Emp_Id' from (
	select Emp_Id from Emp_SWC
	GROUP BY Emp_Id HAVING Count(Emp_Id) = 1
) as Emp_Id


create table Employee2(
	ID int primary key,
	Name varchar(50),
	City varchar(50),
);

create table Employee3(
	ID int primary key,
	EName varchar(50),
	EAdd varchar(50),
);

insert into Employee3 (ID, EName, EAdd) values(1,'John','NY'),(2,'Alice',NULL),(3,'Bob',''),(4,NULL,'Chicago'),(5,'Eva',''),(6,'Chris','Los Angelas');

select * from Employee2 where 
City<>NULL OR City<>'' AND Name is NOT NULL;

create view viewCLass AS
Select Employee2.ID, Employee2.Name, Employee2.City,  Employee3.EName, Employee3.EAdd 
from Employee2 INNER JOIN Employee3 ON Employee2.ID = Employee3.ID;

select * from viewClass;


Delete from viewCLass where EName is NULL;

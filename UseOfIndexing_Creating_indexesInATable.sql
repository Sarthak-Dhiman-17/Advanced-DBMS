--create a table employee for indexing
create table Employee_index(
user_id int PRIMARY KEY,
name varchar(20));

--inserting values such that 102 is first to be inserted
insert into Employee_index values(102,'Aayush');
insert into Employee_index values(101,'Sarthak');
 
--after viewing the table, values will be sorted because PK is by default indexing
select * from Employee_index

--creating a clustered index on name, there can be two ways:
CREATE INDEX Name_index on Employee_index(name);
CREATE NONCLUSTERED INDEX Name_Index on Employee_index(name);

--droping index;
DROP INDEX INDEX_NAME


--creating new table for UNIQUE INDEX demonstration
create table Employee_index2(
user_id int PRIMARY KEY,
name varchar(20));

insert into Employee_index2 values(102,'Aayush');
insert into Employee_index2 values(101,'Sarthak');

--creating unique index on name
create UNIQUE INDEX name_unique on Employee_index2(name);
--this will be terminated and not be inserted;
insert into Employee_index2 values(103,'Sarthak');
create table Customer1(
C_ID int primary key)

create table Orders1(
CUST_ID int primary key)


create view vw_CO_view
AS select C_ID, CUST_ID from Customer1 INNER JOIN Orders1 ON Customer1.C_ID = Orders1.CUST_ID;

insert into Customer1 values(1)
insert into Customer1 values(2)
insert into Customer1 values(3)
insert into Customer1 values(4)
insert into Customer1 values(5)


insert into Orders1 values(1)
insert into Orders1 values(2)
insert into Orders1 values(4)


select * from vw_CO_view

insert into vw_CO_view values(20,30)

ALTER table vw_CO_view
SET C_ID = 10
where CUST_ID = 4
-- Create Thief_1_2016 table
CREATE TABLE Thief_1_2016 (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Insert data into Thief_1_2016
INSERT INTO Thief_1_2016 (id, name) VALUES
(1, 'Sumit'),
(2, 'Nisha'),
(3, 'Akash');




-- Create Thief_2_2017 table
CREATE TABLE Thief_2_2017 (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Insert data into Thief_2_2017
INSERT INTO Thief_2_2017 (id, name) VALUES
(2, 'Nisha'),
(4, 'Charlie');

select * from Thief_1_2016
select * from Thief_2_2017

--court has decided to bail those criminal who have commited crime only once in both years
select id,name from Thief_1_2016 where not exists (select 1 from Thief_2_2017 where Thief_1_2016.id = Thief_2_2017.id)
union all
select id,name from Thief_2_2017 where not exists (select 1 from Thief_1_2016 where Thief_1_2016.id = Thief_2_2017.id)



--approach 2
select id,name from T bklhief_1_2016 where id not in (select id from Thief_2_2017)
UNION ALL 
select id, name from Thief_2_2017 where id not in (select id from Thief_1_2016)



--approach 3
with cte1 as (
	select id, name from Thief_1_2016
	where id not in(select id from Thief_2_2017)
), cte2 as (
	select id, name from Thief_2_2017
	where id not in (select id from Thief_1_2016
))

select * from cte1 
union all
select * from cte2
CREATE TABLE Student_Marks (
    Student_ID INT,
    Name VARCHAR(50),
    Subject VARCHAR(50),
    Marks INT CHECK (Marks BETWEEN 0 AND 50),
    PRIMARY KEY (Student_ID, Subject)
);



INSERT INTO Student_Marks (Student_ID, Name, Subject, Marks) VALUES
(1, 'Alice', 'CS', 45), (1, 'Alice', 'Aptitude', 38), (1, 'Alice', 'Science', 42),
(2, 'Bob', 'CS', 30), (2, 'Bob', 'Aptitude', 28), (2, 'Bob', 'Science', 35),
(3, 'Charlie', 'CS', 50), (3, 'Charlie', 'Aptitude', 48), (3, 'Charlie', 'Science', 49),
(4, 'David', 'CS', 20), (4, 'David', 'Aptitude', 22), (4, 'David', 'Science', 19),
(5, 'Emma', 'CS', 38), (5, 'Emma', 'Aptitude', 40), (5, 'Emma', 'Science', 37),
(6, 'Frank', 'CS', 25), (6, 'Frank', 'Aptitude', 30), (6, 'Frank', 'Science', 28),
(7, 'Grace', 'CS', 41), (7, 'Grace', 'Aptitude', 39), (7, 'Grace', 'Science', 42),
(8, 'Hank', 'CS', 33), (8, 'Hank', 'Aptitude', 31), (8, 'Hank', 'Science', 30),
(9, 'Ivy', 'CS', 45), (9, 'Ivy', 'Aptitude', 48), (9, 'Ivy', 'Science', 50),
(10, 'Jack', 'CS', 29), (10, 'Jack', 'Aptitude', 27), (10, 'Jack', 'Science', 26),
(11, 'Kevin', 'CS', 36), (11, 'Kevin', 'Aptitude', 33), (11, 'Kevin', 'Science', 39),
(12, 'Liam', 'CS', 40), (12, 'Liam', 'Aptitude', 41), (12, 'Liam', 'Science', 44),
(13, 'Mia', 'CS', 32), (13, 'Mia', 'Aptitude', 35), (13, 'Mia', 'Science', 31),
(14, 'Noah', 'CS', 50), (14, 'Noah', 'Aptitude', 49), (14, 'Noah', 'Science', 48),
(15, 'Olivia', 'CS', 27), (15, 'Olivia', 'Aptitude', 28), (15, 'Olivia', 'Science', 26),
(16, 'Paul', 'CS', 39), (16, 'Paul', 'Aptitude', 37), (16, 'Paul', 'Science', 40),
(17, 'Quinn', 'CS', 44), (17, 'Quinn', 'Aptitude', 42), (17, 'Quinn', 'Science', 45),
(18, 'Ryan', 'CS', 29), (18, 'Ryan', 'Aptitude', 27), (18, 'Ryan', 'Science', 32),
(19, 'Sophia', 'CS', 41), (19, 'Sophia', 'Aptitude', 39), (19, 'Sophia', 'Science', 43),
(20, 'Tom', 'CS', 48), (20, 'Tom', 'Aptitude', 46), (20, 'Tom', 'Science', 47),
(21, 'Uma', 'CS', 35), (21, 'Uma', 'Aptitude', 33), (21, 'Uma', 'Science', 38),
(22, 'Victor', 'CS', 28), (22, 'Victor', 'Aptitude', 30), (22, 'Victor', 'Science', 27),
(23, 'Wendy', 'CS', 42), (23, 'Wendy', 'Aptitude', 40), (23, 'Wendy', 'Science', 45),
(24, 'Xander', 'CS', 31), (24, 'Xander', 'Aptitude', 29), (24, 'Xander', 'Science', 34),
(25, 'Yara', 'CS', 47), (25, 'Yara', 'Aptitude', 45), (25, 'Yara', 'Science', 48),
(26, 'Zane', 'CS', 37), (26, 'Zane', 'Aptitude', 35), (26, 'Zane', 'Science', 40);

select*from Student_Marks

select TOP 3 Name, sum(Marks)'Total_Marks' from Student_Marks
Group by Name
Order by Total_Marks desc


select Subject, Name,Marks
,RANK() OVER (PARTITION BY Subject order by Marks desc) AS RANK
from Student_Marks



select Subject, Name,Marks
,DENSE_RANK() OVER (PARTITION BY Subject order by Marks desc) AS RANK
from Student_Marks



create table StudentID(
ID int Primary key,
Marks1 int,
Marks2 int)

insert into StudentID values(1,10,50)
insert into StudentID values(2,5,50)
insert into StudentID values(3,4,50)
insert into StudentID values(4,50,30)


Update StudentID
set Marks1 = Marks2,
    Marks2 = Marks1

select * from StudentID


update StudentID
set Marks1 = (Select max(Marks1) from StudentID)

select * from StudentID



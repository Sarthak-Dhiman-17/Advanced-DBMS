CREATE TABLE Student (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT
);

INSERT INTO Student (ID, Name, Age) VALUES (1, 'Alice', 20);
INSERT INTO Student (ID, Name, Age) VALUES (2, 'Bob', 22);
INSERT INTO Student (ID, Name, Age) VALUES (3, 'Charlie', 21);
INSERT INTO Student (ID, Name, Age) VALUES (4, 'Diana', 23);


CREATE TABLE Groups (
    GroupID INT PRIMARY KEY,
    GroupName VARCHAR(100)
);

INSERT INTO Groups (GroupID, GroupName) VALUES (1, 'Group1');
INSERT INTO Groups (GroupID, GroupName) VALUES (2, 'Group2');
INSERT INTO Groups (GroupID, GroupName) VALUES (3, 'Group3');


CREATE Table GROUP_RATING(

GROUP_ID INT PRIMARY KEY,
Group_Rating DECIMAL(2,1)
FOREIGN KEY (GROUP_ID) REFERENCES GROUPS(GroupID)
)

INSERT INTO GROUP_RATING (Group_ID, Group_Rating) VALUES (1, 3.5);
INSERT INTO GROUP_RATING (Group_ID, Group_Rating) VALUES (2, 4.0);
INSERT INTO GROUP_RATING (Group_ID, Group_Rating) VALUES (3, 5.0);



--we can also use cte here
select Student.ID, Student.Name, temp.GroupName from Student CROSS JOIN 
(select * from Groups g inner join GROUP_RATING g2 on g.GroupID=g2.GROUP_ID where g2.Group_Rating>=4) as temp


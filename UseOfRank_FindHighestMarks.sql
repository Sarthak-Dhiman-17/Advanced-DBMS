CREATE TABLE NTE (
    Enrolment_Number INT PRIMARY KEY,
    Name VARCHAR(100),
    Marks INT
);
INSERT INTO NTE VALUES (1, 'Aman', 88);
INSERT INTO NTE VALUES (2, 'Bhavna', 92);
INSERT INTO NTE VALUES (3, 'Chirag', 75);
INSERT INTO NTE VALUES (4, 'Divya', 89);
INSERT INTO NTE VALUES (5, 'Eshan', 95);  -- highest
INSERT INTO NTE VALUES (6, 'Farah', 67);
INSERT INTO NTE VALUES (7, 'Gopal', 84);
INSERT INTO NTE VALUES (8, 'Harshit', 91);
INSERT INTO NTE VALUES (9, 'Ishika', 78);
INSERT INTO NTE VALUES (10, 'Jay', 95);   -- highest
INSERT INTO NTE VALUES (11, 'Kiran', 88);
INSERT INTO NTE VALUES (12, 'Lakshay', 82);
INSERT INTO NTE VALUES (13, 'Meena', 95); -- highest
INSERT INTO NTE VALUES (14, 'Naveen', 73);
INSERT INTO NTE VALUES (15, 'Om', 90);
INSERT INTO NTE VALUES (16, 'Pooja', 85);
INSERT INTO NTE VALUES (17, 'Qasim', 86);
INSERT INTO NTE VALUES (18, 'Ritika', 91);
INSERT INTO NTE VALUES (19, 'Sarthak', 89);
INSERT INTO NTE VALUES (20, 'Tina', 80);

--find highest marks scorer 
with cte as(
select *,
RANK() over(ORDER BY Marks desc) as rank
from NTE)
select * from cte where rank = 1;
--select * from cte where rank = 4;






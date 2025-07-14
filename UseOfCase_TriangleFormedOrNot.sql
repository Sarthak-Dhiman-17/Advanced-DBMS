CREATE TABLE TriangleSegments (
    x INT,
    y INT,
    z INT
);


select * from TriangleSegments
-- Insert the data
INSERT INTO TriangleSegments (x, y, z) VALUES (13, 15, 30);
INSERT INTO TriangleSegments (x, y, z) VALUES (10, 20, 15);



--does triangle is fromed?
select *,
CASE 
	WHEN x+y > z AND x+z > y AND y+z > x THEN 'YES'
	ELSE 'No'
END AS TraingleFormed
from TriangleSegments
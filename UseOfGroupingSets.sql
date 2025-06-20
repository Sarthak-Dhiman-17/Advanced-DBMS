CREATE TABLE Student1 (
    Name VARCHAR(50),
    City VARCHAR(50),
    Marks INT
);

INSERT INTO Student1 (Name, City, Marks) VALUES 
('Alice', 'Mumbai', 85),
('Alice', 'Mumbai', 90),
('Alice', 'Pune', 75),
('Bob', 'Delhi', 78),
('Bob', 'Delhi', 82),
('Bob', 'Kolkata', 88),
('Charlie', 'Delhi', 70),
('Charlie', 'Delhi', 60),
('David', 'Pune', 80),
('David', 'Pune', 85),
('Eve', 'Mumbai', 91),
('Eve', 'Pune', 89);


select * from Student1

select Name, City,Count(*) from Student1
group by grouping sets((Name),(Name,City),(City),())
CREATE TABLE MultiValued (
    COL1 INT,
    COL2 VARCHAR(100)
);

INSERT INTO MultiValued (COL1, COL2) VALUES
(1, 'A,B,C'),
(2, 'A,B');
INSERT INTO MultiValued (COL1, COL2) VALUES
(3,'A,BC,D')

select * from MultiValued


--find how many alphabets are there in each column row
--sol - find (num of character - number 0f character without comman + 1)
 select COL1, LEN(COL2)-LEN(replace(COL2,',',''))+1 as NumCharacters from MultiValued

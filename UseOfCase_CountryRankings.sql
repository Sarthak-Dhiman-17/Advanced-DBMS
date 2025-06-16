CREATE TABLE tbl_happiness (
    SNo INT,
    Rankings INT,
    Country VARCHAR(100)
);


INSERT INTO tbl_happiness (SNo, Rankings, Country) VALUES (1, 1, 'Finland');
INSERT INTO tbl_happiness (SNo, Rankings, Country) VALUES (2, 2, 'Denmark');
INSERT INTO tbl_happiness (SNo, Rankings, Country) VALUES (3, 3, 'Iceland');
INSERT INTO tbl_happiness (SNo, Rankings, Country) VALUES (4, 4, 'Israel');
INSERT INTO tbl_happiness (SNo, Rankings, Country) VALUES (5, 5, 'Netherlands');
INSERT INTO tbl_happiness (SNo, Rankings, Country) VALUES (6, 6, 'Sweden');
INSERT INTO tbl_happiness (SNo, Rankings, Country) VALUES (7, 7, 'Norway');
INSERT INTO tbl_happiness (SNo, Rankings, Country) VALUES (8, 126, 'India');
INSERT INTO tbl_happiness (SNo, Rankings, Country) VALUES (9, 128, 'Sri Lanka');


select Rankings, Country from tbl_happiness
order by CASE
	WHEN Country = 'India' THEN 0
	WHEN Country = 'Sri Lanka' THEN 1
	ELSE 2
END, Rankings DESC




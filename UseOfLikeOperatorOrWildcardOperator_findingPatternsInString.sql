CREATE TABLE Users1 (
    User_id INT PRIMARY KEY,
    Username VARCHAR(50)
);

INSERT INTO Users1 (User_id, Username) VALUES
(1, '_admin'),
(2, 'a_%user'),
(3, 'admin_user'),
(4, 'user_admin'),
(5, '%manager'),
(6, 'a%man'),
(7, 'test_user'),
(8, 'usertest');


--find Username start with %
select * from Users1
where Username like '\%%' ESCAPE '\'

select * from Users1
where Username like '[%]%'

--find username starts with _
select * from Users1
where Username like '\_%' ESCAPE '\'

--find username containing % in between
select * from Users1
where Username like '%\%%' ESCAPE '\'

--fund username with _ in between
select * from Users1
where Username like '%\_%' ESCAPE '\'

--find username containing both % and _
select * from Users1
where Username like '%[%]%' AND Username like '%[_]%'



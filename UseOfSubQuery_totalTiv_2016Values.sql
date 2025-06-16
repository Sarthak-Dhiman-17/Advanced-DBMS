CREATE TABLE insurance (
    pid INT PRIMARY KEY,
    tiv_2015 FLOAT,
    tiv_2016 FLOAT,
    lat FLOAT,
    lon FLOAT
);

-- Insert data
INSERT INTO insurance (pid, tiv_2015, tiv_2016, lat, lon)
VALUES 
(1, 10, 5, 10, 10),
(2, 20, 20, 20, 20),
(3, 10, 30, 20, 20),
(4, 10, 40, 40, 40),
(5, 30, 15, 25, 25),
(6, 30, 5, 35, 35);

select *from insurance

--write a query that the sum of all tiv values for 2016 for all placeholder is : 
--1. who have same tiv_2015 value as at least one or more than other person and 
--2. are not located in the same city as any other policy holder and lat = long

select sum(tiv_2016) from insurance 
where tiv_2015 in
(select tiv_2015 from insurance 
group by tiv_2015 having count(*)>1)
and lat in
(select lat from insurance 
group by lat having count(*) = 1)
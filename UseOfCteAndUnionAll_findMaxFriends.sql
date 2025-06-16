CREATE TABLE Friends1 (
    p1_id INT,
    p2_id INT
);

INSERT INTO Friends1 (p1_id, p2_id) VALUES
(1, 2),
(1, 3),
(2, 3),
(3, 4);

--find the person with maximum number of friends
-- first approach
with cte as(select p1_id as person from Friends1
union all
select p2_id from Friends1)
select top 1 person, count(*) as num from cte group by person order by num desc


-- second approach subquery
select top 1 person, count(*) as num from(
	select p1_id as person from Friends1
	union all
	select p2_id from Friends1
)as temp
group by person order by num desc

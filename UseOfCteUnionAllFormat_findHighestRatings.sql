CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100)
);

-- Create Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE MovieRating (
    movie_id INT,
    user_id INT,
    rating INT,
    created_at DATE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


INSERT INTO Movies (movie_id, title)
VALUES
(1, 'Avengers'),
(2, 'Frozen 2'),
(3, 'Joker');

-- Insert data into Users table
INSERT INTO Users (user_id, name)
VALUES
(1, 'Daniel'),
(2, 'Monica'),
(3, 'Maria'),
(4, 'James');


INSERT INTO MovieRating (movie_id, user_id, rating, created_at)
VALUES 
(1, 1, 3, '2020-01-12'),
(1, 2, 4, '2020-02-11'),
(1, 3, 2, '2020-02-12'),
(1, 4, 1, '2020-01-01'),
(2, 1, 5, '2020-02-17'),
(2, 2, 2, '2020-02-01'),
(2, 3, 2, '2020-03-01'),
(3, 1, 3, '2020-02-22'),
(3, 2, 4, '2020-02-25');


-- id with highest number of ratings, in case of tie, return lexically smaller number 
-- my approach(complex using subqueries)
select u.name from Users u INNER JOIN MovieRating m on u.user_id = m.user_id
where u.user_id = ( 
select top 1 MAX(user_id) from MovieRating 
group by user_id )
group by u.name;
 --2nd approach
with cte as (select top 1 u.name as results from Users u INNER JOIN MovieRating m on u.user_id = m.user_id
group by u.name
order by count(*) desc,
u.name),

--find movie with highest average rating
cte1 as ( select top 1  m1.title from Movies m1 INNER JOIN MovieRating m2 on m1.movie_id = m2.movie_id
where FORMAT(m2.created_at,'yyyy-MM') = '2020-02'
group by m1.title
order by AVG(m2.rating*1.00) desc,
m1.title)

select *  from cte 
union all 
select * from cte1



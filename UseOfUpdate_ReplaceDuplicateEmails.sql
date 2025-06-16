
CREATE TABLE UserProfile (
    user_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Email VARCHAR(100)
);

INSERT INTO UserProfile (user_ID, Name, Age, Email) VALUES
(1, 'Rajesh', 28, 'rajesh@gmail.com'),
(2, 'Priya', 25, 'priya@gmail.com'),
(3, 'Suresh', 30, 'rajesh@gmail.com'),
(4, 'Anjali', 24, 'priya@gmail.com');

select * from UserProfile


update UserProfile
set Email = 'duplicate email'
where UserProfile.user_ID in(
select u.user_ID from UserProfile as u
join UserProfile as u2 on u.Email = u2.Email
where u.user_ID <> u2.user_ID AND u.user_ID > u2.user_ID
)

select * from UserProfile
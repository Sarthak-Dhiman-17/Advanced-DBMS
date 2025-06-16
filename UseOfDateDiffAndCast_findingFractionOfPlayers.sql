CREATE TABLE Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT
);

INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-03-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

--higher date is written at last in date diff function
--here we use subquery and count*1.00 to get the decimal value then use cast function to decimal with total 5 digits and upto 2 places after decimal
--here we use scalar subquery(as it runs only one time)
select CAST(COUNT(*)*1.00/(Select Count(Distinct player_id) from Activity) as decimal(5,2)) as fraction from Activity a1 join Activity a2 
on a1.player_id=a2.player_id where DATEDIFF(day,a1.event_date,a2.event_date)=1;

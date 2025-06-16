
CREATE TABLE Flight_Seats (
    SEAT_ID INT PRIMARY KEY,
    FREE_SLOT BIT
);

-- Insert the data
INSERT INTO Flight_Seats (SEAT_ID, FREE_SLOT)
VALUES 
(1, 1),
(2, 0),

(3, 1),
(4, 0),
(5, 1),
(6, 1),
(7, 1),
(8, 0),
(9, 1),
(10, 1);

--find consecutive free slots
with cte as(
select *,
LEAD(FREE_SLOT,1,0) over(ORDER BY SEAT_ID) as nextr,
LAG(FREE_SLOT,1,0) OVER (ORDER BY SEAT_ID) as prevr
from Flight_Seats
)
select SEAT_ID from cte
where FREE_SLOT = 1 AND ( nextr = 1 or prevr = 1 )
CREATE TABLE CU_EMPLOYEES (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    salary DECIMAL(10, 2)
);



INSERT INTO CU_EMPLOYEES(id, name, age, salary) VALUES
(1, 'Amit Sharma', 28, 55000.00),
(2, 'Bhavesh Patel', 32, 62000.00),
(3, 'Chirag Mehta', 25, 48000.00),
(4, 'Deepak Kumar', 30, 58000.00),
(5, 'Ekta Singh', 26, 51000.00),
(6, 'Farhan Ali', 29, 54000.00),
(7, 'Garima Joshi', 31, 60000.00),
(8, 'Harsh Vardhan', 27, 53000.00),
(9, 'Ishita Desai', 33, 63000.00),
(10, 'Jatin Verma', 28, 56000.00),
(11, 'Kavita Bansal', 30, 59000.00),
(12, 'Lakshay Kapoor', 35, 67000.00),
(13, 'Meera Iyer', 24, 47000.00),
(14, 'Nikhil Rao', 26, 52000.00),
(15, 'Omisha Thakur', 29, 55000.00),
(16, 'Pranav Saxena', 34, 66000.00),
(17, 'Qadir Khan', 31, 61000.00),
(18, 'Riya Bhatt', 27, 52000.00),
(19, 'Siddharth Das', 25, 49000.00),
(20, 'Tanvi Nair', 32, 62000.00),
(21, 'Uday Joshi', 28, 56000.00),
(22, 'Vaishali Reddy', 30, 59000.00),
(23, 'Wasim Sheikh', 29, 55000.00),
(24, 'Xenia Dutta', 33, 64000.00),
(25, 'Yamini Menon', 26, 51000.00),
(26, 'Zaid Khan', 31, 60000.00),
(27, 'Ankit Chauhan', 27, 53000.00),
(28, 'Bhoomi Sharma', 24, 47000.00),
(29, 'Chetan Bhagat', 35, 68000.00),
(30, 'Divya Soni', 28, 56000.00),
(31, 'Eshan Malhotra', 30, 59000.00),
(32, 'Fatima Noor', 26, 51000.00),
(33, 'Gaurav Jain', 29, 54000.00),
(34, 'Harleen Kaur', 31, 61000.00),
(35, 'Irfan Malik', 32, 62000.00),
(36, 'Juhi Chawla', 25, 48000.00),
(37, 'Kunal Arora', 28, 55000.00),
(38, 'Lavanya Pillai', 33, 63000.00),
(39, 'Manish Gupta', 27, 53000.00),
(40, 'Neha Rathi', 29, 55000.00),
(41, 'Om Prakash', 30, 58000.00),
(42, 'Pooja Dubey', 26, 51000.00),
(43, 'Rakesh Mishra', 31, 60000.00),
(44, 'Shalini Pandey', 34, 65000.00),
(45, 'Tushar Goel', 25, 49000.00),
(46, 'Urvashi Jain', 27, 53000.00),
(47, 'Vikram Sen', 32, 62000.00),
(48, 'Wamiqa Anand', 28, 56000.00),
(49, 'Xavier D Costa', 30, 59000.00),
(50, 'Yuvraj Singh', 29, 55000.00);


select * from CU_EMPLOYEES

--creating pagination of a table by page number and page size
create or alter PROCEDURE pagination @page_num int, @page_size int
as 
begin
	select * from CU_EMPLOYEES
	order by id
	OFFSET ((@page_num-1)*@page_size)  ROWS FETCH NEXT @page_size ROWS ONLY; --skip n-1*size rows and select next page size rows
end

--calling procedure
exec pagination 4,10

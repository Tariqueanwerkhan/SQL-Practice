CREATE TABLE employee_data1(
	employee_id	INT	PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,	
	department VARCHAR(20),	
	salary NUMERIC(10,2),	
	joining_date DATE,	
	age INT	
);

INSERT INTO employee_data1(employee_id, first_name, last_name, department, salary, joining_date, age)
Values(1, 'Ethan', 'Carter', 'HR', 52000, '2018-03-15', 29),
(2, 'Olivia', 'Smith', 'Finance', 61000, '2019-07-21', 32),
(3, 'Liam', 'Johnson', 'IT', 70000, '2020-11-03', 28),
(4, 'Sophia', 'Miller', 'Marketing', 48000, '2017-05-17', 26),
(5, 'Noah', 'Anderson', 'Sales', 55000, '2018-09-12', 31),
(6, 'Ava', 'Brown', 'Finance', 67000, '2021-01-25', 27),
(7, 'Mason', 'Wilson', 'IT', 72000, '2019-08-10', 30),
(8, 'Isabella', 'Taylor', 'HR', 51000, '2020-02-18', 25),
(9, 'Lucas', 'Martinez', 'Sales', 59000, '2016-06-09', 34),
(10, 'Mia', 'Thomas', 'Marketing', 53000, '2017-12-14', 28),
(11, 'James', 'Moore', 'Finance', 64000, '2018-04-22', 33),
(12, 'Charlotte', 'Jackson', 'IT', 75000, '2021-07-11', 29),
(13, 'Benjamin', 'White', 'HR', 50000, '2019-05-16', 26),
(14, 'Amelia', 'Harris', 'Sales', 60000, '2018-10-30', 27),
(15, 'Elijah', 'Martin', 'Marketing', 56000, '2020-03-20', 32),
(16, 'Harper', 'Thompson', 'Finance', 68000, '2017-09-13', 31),
(17, 'William', 'Garcia', 'IT', 74000, '2019-11-27', 28),
(18, 'Evelyn', 'Martins', 'HR', 52000, '2021-06-02', 25),
(19, 'Alexander', 'Martinez', 'Sales', 61000, '2018-01-08', 30),
(20, 'Abigail', 'Robinson', 'Marketing', 57000, '2020-09-19', 29),
(21, 'Daniel', 'Clark', 'Finance', 66000, '2016-08-23', 34),
(22, 'Ella', 'Rodriguez', 'IT', 78000, '2019-02-14', 27),
(23, 'Matthew', 'Lewis', 'HR', 51000, '2020-04-10', 26),
(24, 'Scarlett', 'Lee', 'Sales', 59000, '2017-07-05', 28),
(25, 'Henry', 'Walker', 'Marketing', 55000, '2018-11-18', 32),
(26, 'Grace', 'Hall', 'Finance', 67000, '2020-05-30', 29),
(27, 'Joseph', 'Allen', 'IT', 76000, '2017-12-07', 33),
(28, 'Victoria', 'Young', 'HR', 52000, '2019-09-16', 25),
(29, 'David', 'King', 'Sales', 60000, '2018-03-28', 31),
(30, 'Aria', 'Wright', 'Marketing', 54000, '2020-12-09', 27),
(31, 'Samuel', 'Scott', 'Finance', 65000, '2016-05-14', 34),
(32, 'Lily', 'Green', 'IT', 77000, '2019-06-23', 28),
(33, 'Owen', 'Baker', 'HR', 50000, '2017-04-12', 26),
(34, 'Chloe', 'Adams', 'Sales', 58000, '2018-08-19', 27),
(35, 'Jack', 'Nelson', 'Marketing', 56000, '2021-03-15', 30),
(36, 'Zoe', 'Hill', 'Finance', 69000, '2019-01-25', 29),
(37, 'Sebastian', 'Ramirez', 'IT', 73000, '2017-07-31', 32),
(38, 'Hannah', 'Campbell', 'HR', 51000, '2020-02-22', 25),
(39, 'Aiden', 'Mitchell', 'Sales', 60000, '2016-09-18', 33),
(40, 'Layla', 'Perez', 'Marketing', 55000, '2019-10-07', 28),
(41, 'Gabriel', 'Roberts', 'Finance', 67000, '2020-06-17', 30),
(42, 'Zoey', 'Carter', 'IT', 79000, '2017-02-14', 29),
(43, 'Julian', 'Phillips', 'HR', 52000, '2018-11-05', 26),
(44, 'Penelope', 'Evans', 'Sales', 59000, '2021-07-08', 25),
(45, 'Levi', 'Turner', 'Marketing', 56000, '2016-12-13', 31),
(46, 'Riley', 'Torres', 'Finance', 68000, '2019-09-29', 32),
(47, 'Isaac', 'Parker', 'IT', 74000, '2020-08-21', 27),
(48, 'Nora', 'Collins', 'HR', 50000, '2018-05-24', 28),
(49, 'Wyatt', 'Edwards', 'Sales', 61000, '2017-03-12', 29),
(50, 'Lillian', 'Stewart', 'Marketing', 53000, '2019-07-17', 26),
(51, 'Christopher', 'Sanchez', 'Finance', 66000, '2020-01-03', 33),
(52, 'Addison', 'Morris', 'IT', 78000, '2016-06-21', 28),
(53, 'Joshua', 'Rogers', 'HR', 51000, '2017-10-27', 30),
(54, 'Eleanor', 'Reed', 'Sales', 59000, '2019-11-11', 25),
(55, 'Andrew', 'Cook', 'Marketing', 55000, '2020-04-19', 27),
(56, 'Hazel', 'Morgan', 'Finance', 67000, '2018-01-09', 31),
(57, 'Lincoln', 'Bell', 'IT', 75000, '2017-08-14', 29),
(58, 'Stella', 'Murphy', 'HR', 52000, '2019-02-26', 26),
(59, 'Nathan', 'Bailey', 'Sales', 60000, '2021-03-05', 28),
(60, 'Paisley', 'Rivera', 'Marketing', 54000, '2018-06-12', 25),
(61, 'Dylan', 'Cooper', 'Finance', 69000, '2019-09-28', 32),
(62, 'Aurora', 'Richardson', 'IT', 77000, '2020-07-18', 30),
(63, 'Ryan', 'Cox', 'HR', 50000, '2016-10-23', 29),
(64, 'Savannah', 'Howard', 'Sales', 61000, '2019-05-30', 27),
(65, 'Caleb', 'Ward', 'Marketing', 56000, '2017-01-15', 26),
(66, 'Brooklyn', 'Torres', 'Finance', 67000, '2018-07-09', 31),
(67, 'Eli', 'Peterson', 'IT', 73000, '2021-01-19', 28),
(68, 'Leah', 'Gray', 'HR', 52000, '2017-03-05', 25),
(69, 'Hunter', 'Ramsey', 'Sales', 59000, '2019-11-23', 30),
(70, 'Violet', 'Watson', 'Marketing', 55000, '2016-04-11', 34),
(71, 'Christian', 'Brooks', 'Finance', 66000, '2020-09-07', 29),
(72, 'Audrey', 'Kelly', 'IT', 79000, '2017-12-29', 27),
(73, 'Ezra', 'Sanders', 'HR', 50000, '2019-08-08', 26),
(74, 'Claire', 'Price', 'Sales', 61000, '2018-02-10', 31),
(75, 'Thomas', 'Bennett', 'Marketing', 54000, '2017-09-04', 29),
(76, 'Skylar', 'Wood', 'Finance', 67000, '2019-03-19', 28),
(77, 'Charles', 'Barnes', 'IT', 75000, '2020-10-17', 30),
(78, 'Camila', 'Ross', 'HR', 52000, '2016-05-27', 27),
(79, 'Isaiah', 'Henderson', 'Sales', 60000, '2018-06-15', 33),
(80, 'Lucy', 'Coleman', 'Marketing', 56000, '2019-12-21', 25),
(81, 'Adam', 'Jenkins', 'Finance', 69000, '2017-11-06', 31),
(82, 'Madison', 'Perry', 'IT', 78000, '2019-07-24', 29),
(83, 'Nicholas', 'Powell', 'HR', 51000, '2020-02-02', 26),
(84, 'Eleanor', 'Long', 'Sales', 59000, '2016-03-20', 32),
(85, 'Jonathan', 'Patterson', 'Marketing', 55000, '2018-05-17', 28),
(86, 'Bella', 'Hughes', 'Finance', 66000, '2019-09-09', 27),
(87, 'Anthony', 'Flores', 'IT', 77000, '2017-07-30', 33),
(88, 'Sofia', 'Washington', 'HR', 50000, '2018-11-15', 25),
(89, 'Dominic', 'Butler', 'Sales', 60000, '2020-01-22', 29),
(90, 'Scarlett', 'Simmons', 'Marketing', 54000, '2016-08-18', 34),
(91, 'Carter', 'Foster', 'Finance', 67000, '2019-12-28', 28),
(92, 'Avery', 'Bryant', 'IT', 75000, '2017-05-05', 30),
(93, 'Miles', 'Alexander', 'HR', 52000, '2018-09-27', 26),
(94, 'Samantha', 'Russell', 'Sales', 59000, '2020-06-10', 25),
(95, 'Evan', 'Griffin', 'Marketing', 55000, '2019-02-13', 31),
(96, 'Natalie', 'Diaz', 'Finance', 69000, '2017-01-21', 29),
(97, 'Aaron', 'Hayes', 'IT', 73000, '2021-08-03', 27),
(98, 'Luna', 'Myers', 'HR', 51000, '2016-06-19', 28),
(99, 'Jason', 'Ford', 'Sales', 61000, '2018-04-07', 30),
(100, 'Aubrey', 'Hamilton', 'Marketing', 56000, '2019-07-01', 26);


SELECT first_name, last_name, salary,
(salary * 0.1) as Bonus
FROM employee_data1;

-- calculate new salary
SELECT first_name, last_name, salary,
(salary * 12) as annual_salary,
(salary * 0.05) as increment_salary,
(salary + salary * 0.05) as new_salary,
(salary * 1.05) as_new_salary2
from employee_data1;


-- matches age 30
Select * from employee_data1
where age = 30;
select count(*) as total_employe_age_30
from employee_data1
where age = 30;

select count(*) from employee_data1
where age = 30;


-- matches all except 30
Select employee_id, first_name, last_name, age from employee_data1
where age != 30;

select count(*) from employee_data1
where age != 30;


-- salary greather than 50000

Select first_name, salary from employee_data1
where salary > 50000;

select employee_id, first_name, last_name, salary from employee_data1
where salary > 50000 order by employee_id asc;

-- AND operator
Select * from employee_data1
where age >= 40 and salary >= 50000;

-- OR operator
Select * from employee_data1
where age >= 35 or salary >= 60000;

-- NOT operator
select * from employee_data1
where not(department='Sales');

-- 1) Retrieve employees whose salary is between 40,000 and 60,000. - Use BETWEEN Operators

Select first_name, last_name, salary from employee_data1
where salary between 40000 and 60000;

-- 2) Find employees whose email addresses end with gmail.com - Use LIKE Operators
select employee_id, first_name, last_name 
from employee_data1
where last_name like "%n";

select first_name from employee_data1
where first_name like "%a%";


-- 3) Retrieve employees who belong to either the 'Finance' or 'Marketing' departments-- Use IN Operator
Select first_name, last_name, department from employee_data1
where department in ('Finance', 'Marketing', 'IT');

-- Find employees where the department column is NULL ( if applicable).
select first_name, last_name, department
from employee_data1
where department is null;


-- List employees sorted by salary in DESCENDING order.
select first_name, last_name, salary
from employee_data1
order by salary asc;


-- Retrieve the top 5 highest-paid employees.
select first_name, last_name, salary 
from employee_data1
order by salary desc limit 5;


-- Retrieve a list of unique departments
select count(distinct department) AS DEP_UNIQUE_COUNT
FROM employee_data1;

select distinct department
from employee_data1;


select * from employee_data1;


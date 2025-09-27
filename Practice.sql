CREATE DATABASE company;

Create table employee(
employee_id serial primary key,
name varchar(100) not null,
posiition varchar(50),
department varchar(50),
hire_date date,
salary numeric(10,2)
);

INSERT INTO employee(name, position, department, hire_date, salary)
		VALUES ('Ajit Sharma', 'Data Analyst', 'Data Science', '2022-05-15', 65000.00),
			('Priya Desai','Software Engineer', 'IT', '2021-09-20',75000.00),
			('Rajesh Kumar', 'HR Manager', 'Human Resources', '2019-03-10', 82000.00),
			('Sneha Patel', 'Marketing Specialist', 'Marketing', '2020-11-25', 58000.00),
			('Vikram Singh', 'Sales Executive', 'Sales', '2023-02-12', 62000.00);

alter table employee rename column posiition to position;
truncate table employee;
select * from employee;


#-----------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE employee2(
	employee_id INT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	position VARCHAR(50),
	department VARCHAR(50),
	hire_date DATE,
	salary NUMERIC(10,2)
);

INSERT INTO employee2 (employee_id, name, position, department, hire_date, salary)
		VALUES(101, 'Amit Sharma','Data Analyst', 'Data Science', '2022-05-15',65000.00),
			(102, 'Priya Desai','Software Engineer', 'IT', '2021-09-20',75000.00),
			(103, 'Rajesh Kumar', 'HR Manager', 'Human Resources', '2019-03-10', 82000.00),
			(104, 'Sneha Patel', 'Marketing Specialist', 'Marketing', '2020-11-25', 58000.00),
			(105, 'Vikram Singh', 'Sales Executive', 'Sales', '2023-02-12', 62000.00),
            (106, 'Debansh Sharma', 'Data Engineer', 'Data Science', '2023-02-01', 70000.00);

delete from employee2 where employee_id = 105;
alter table employee2 drop column salary;
drop table if exists employee2; #warning this will delete whole table
SELECT * FROM employee2;


#----------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE Users2(
user_id int primary key,
name varchar(50) not null,
email varchar(100) unique,
age integer check(age >= 18),
reg_date timestamp default current_timestamp
);

# INSERTING DATA INTO TABLE
INSERT INTO Users2 (user_id, name, email, age)
VALUES (1, 'John Doe', 'john.doe@example.com', 25);

# INSERTING DATA INTO TABLE2
INSERT INTO Users2 (user_id, name, email, age) 
VALUES (2, 'John Doe', 'john1.doe@example.com', 19);

select * from Users2;


#--------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE IF NOT EXISTS users3 (
user_id serial primary key,
username varchar(50) not null,
email varchar(100) unique,
age int,
city varchar(50)
);

INSERT INTO users3(username, email, age, city)
values('Raejsh', 'Rajesh@gmail.com', 25, 'Mumbai'),
('Priya', 'priya@yahoo.com', 30, 'Delhi'),
('Ankit', 'ankit@gmail.com', 28, 'Bangalore'),
('Sneha', 'sneha@hotmail.com', 35, 'Pune'),
('Vikram', 'vikram@gmail.com', 22, 'Hyderabad');

SELECT username, city FROM users3;
UPDATE users3 SET age = 28 WHERE username = 'Raejsh';
select * from users3;

SET SQL_SAFE_UPDATES = 0;
UPDATE users3 
SET age = 28 
WHERE username = 'Raejsh';
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM users3 ORDER BY user_id ASC;
UPDATE users3 SET city='Chennai' WHERE age>=30;
UPDATE users3 SET age=age+1 WHERE email LIKE '%@gmail.com';
DELETE FROM users3 WHERE user_id=6;
ALTER TABLE users3
RENAME COLUMN username TO full_name;
SELECT * FROM users3 ORDER BY USER_ID ASC;
ALTER TABLE users3 MODIFY age SMALLINT;
ALTER TABLE users3 MODIFY city VARCHAR(50) NOT NULL;
ALTER TABLE users3 drop age;
ALTER TABLE users3 ADD age INT;
ALTER TABLE users3 ADD CONSTRAINT age CHECK(age>=18);
INSERT INTO users3 (FULL_NAME,EMAIL, AGE,CITY)
VALUES ('Vinod', 'rajesh@gmail.com',19, 'Mumbai');

#----------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE employees_data (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10, 2) CHECK (salary > 0),
    joining_date DATE NOT NULL,
    age INT CHECK (age >= 18)
);

INSERT INTO employees_data (first_name, last_name, department, salary, joining_date, age) VALUES
('Amit', 'Sharma', 'IT', 60000.00, '2022-05-01', 29),
('Neha', 'Patel', 'HR', 55000.00, '2021-08-15', 32),
('Ravi', 'Kumar', 'Finance', 70000.00, '2020-03-10', 35),
('Anjali', 'Verma', 'IT', 65000.00, '2019-11-22', 28),
('Suresh', 'Reddy', 'Operations', 50000.00, '2023-01-10', 26);

-- Assignment Questions
-- Q1: Retrieve all employees’ first_name and their departments.
SELECT first_name, department from employees_data;

-- Q2: Update the salary of all employees in the 'IT' department by increasing it by 10%.
UPDATE employees_data
set salary = salary + (salary*0.1)
where department = "IT";

-- Q3: Delete all employees who are older than 34 years.
Delete FROM employees_data
where age > 34;

-- Q4: Add a new column `email` to the `employees` table.
ALTER TABLE employees_data
ADD column email varchar(100);

-- Q5: Rename the `department` column to `dept_name`.
ALTER TABLE employees_data
RENAME column department to dept_nname;

-- Q6: Retrieve the names of employees who joined after January 1, 2021.
SELECT first_name, last_name, joining_date from employees_data
where joining_date > '2021-01-01';

-- Q7: Change the data type of the `salary` column to `INTEGER`.
ALTER TABLE employees_data
Modify salary INT;

-- Q8: List all employees with their age and salary in descending order of salary.
Select first_name, last_name, age, salary from employees_data
order by salary desc;

-- Q9: Insert a new employee with the following details: 
		-- ('Raj', 'Singh', 'Marketing', 60000, '2023-09-15', 30)
INSERT INTO employees_data(first_name, last_name, dept_nname, salary, joining_date, age)
values('Raj', 'Singh', 'Marketing', 60000, '2023-09-15', 30);

-- Q10: Update age of employee +1 to every employee 
Update employees_data
set age = age+1;

Select * from employees_data;






CREATE TABLE Employees5 (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    department_name VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    city VARCHAR(50)
);

INSERT INTO Employees5(first_name, last_name, department_id, department_name, salary, hire_date, city)
VALUES('Amit', 'Sharma', 101, 'HR', 45000, '2021-05-10', 'Delhi'),
('Priya', 'Verma', 102, 'Finance', 60000, '2019-03-22', 'Mumbai'),
('Rahul', 'Singh', 103, 'IT', 75000, '2020-07-15', 'Bangalore'),
('Sneha', 'Mehta', 104, 'Marketing', 50000, '2018-09-01', 'Pune'),
('Vikram', 'Yadav', 101, 'HR', 47000, '2022-01-12', 'Delhi'),
('Anjali', 'Kapoor', 102, 'Finance', 58000, '2021-11-20', 'Chennai'),
('Rohan', 'Kumar', 103, 'IT', 80000, '2020-06-25', 'Hyderabad'),
('Neha', 'Jain', 104, 'Marketing', 52000, '2019-08-14', 'Delhi'),
('Karan', 'Malhotra', 101, 'HR', 49000, '2023-02-05', 'Mumbai'),
('Simran', 'Arora', 102, 'Finance', 61000, '2022-03-11', 'Bangalore'),
('Manish', 'Chauhan', 103, 'IT', 78000, '2019-12-09', 'Pune'),
('Pooja', 'Gupta', 104, 'Marketing', 53000, '2021-10-30', 'Kolkata'),
('Arjun', 'Reddy', 101, 'HR', 46000, '2020-01-18', 'Hyderabad'),
('Isha', 'Bhatia', 102, 'Finance', 64000, '2018-05-21', 'Delhi'),
('Suresh', 'Nair', 103, 'IT', 82000, '2022-08-16', 'Chennai'),
('Tanya', 'Dixit', 104, 'Marketing', 51000, '2021-07-19', 'Mumbai'),
('Deepak', 'Joshi', 101, 'HR', 48000, '2019-11-23', 'Pune'),
('Alok', 'Mishra', 102, 'Finance', 65000, '2020-09-17', 'Hyderabad'),
('Meena', 'Rao', 103, 'IT', 79000, '2021-04-02', 'Bangalore'),
('Rita', 'Shah', 104, 'Marketing', 55000, '2022-06-28', 'Chennai'),
('Nikhil', 'Patel', 101, 'HR', 49500, '2020-08-10', 'Kolkata'),
('Geeta', 'Agarwal', 102, 'Finance', 63000, '2023-01-04', 'Delhi'),
('Sanjay', 'Menon', 103, 'IT', 77000, '2018-10-12', 'Mumbai'),
('Payal', 'Kohli', 104, 'Marketing', 56000, '2021-12-22', 'Pune'),
('Ravi', 'Srivastava', 101, 'HR', 50000, '2022-09-15', 'Bangalore');

select employee_id, first_name, last_name, salary, city from employees5;

select * from employees5
where salary > 55000;
select * from employees5 where department_name = 'HR';
select * from employees5 where department_name in ('IT', 'Finance');
SELECT * FROM employees5 where hire_date > '2021-05-12';
SELECT * FROM employees5 where hire_date between '2021-01-01' and '2022-01-01';
select * from employees5 where hire_date is not null;

select * from employees5 where first_name like '%a';
select * from employees5 where last_name like '%ia%';

select * from employees5 where department_name = 'IT' and hire_date > '2021-01-01';
select * from employees5 where salary > '50000' and city = 'mumbai';
select * from employees5 where employee_id between '10' and '20';

select * from employees5 limit 5 offset 4;
select * from employees5 limit 4, 7;

select first_name, last_name, salary from employees5
where salary between 50000 and 65000 
order by salary desc;
select *from employees5 order by hire_date desc;
select * from employees5 order by first_name asc;
select * from employees5 order by city asc limit 6;

update employees5 set first_name = 'Ayaan' where employee_id = 5;
update employees5 set last_name = 'Elric' where employee_id = 5;
update employees5 set department_name = 'IT' where employee_id = 5; 

ALTER TABLE employees5 ADD COLUMN is_active BOOLEAN DEFAULT TRUE;
ALTER TABLE employees5 drop column is_active;
select * from employees5;

select count(salary) as salary_count
from employees5
where salary > 55000;

select count(*) from employees5 
where department_name != 'IT';

Select employee_id, first_name, last_name, city from employees5
where city != 'Delhi';

select first_name, last_name, department_name from employees5
where department_name in ('Finance', 'Marketing', 'IT');


select first_name, last_name, salary
from employees5
order by salary desc;

select first_name, last_name, salary
from employees5
order by salary desc limit 5;

select count(distinct department_name) as dep_unique_count
from employees5;

select distinct department_name
from employees5;




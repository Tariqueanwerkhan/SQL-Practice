create table employee (
emp_ID int, 
emp_NAME varchar(50), 
DEPT_NAME varchar(50), 
SALARY int
);
insert into employee (emp_Id, emp_name, dept_name, salary)
values(101, 'Mohan', 'Admin', 4000),
(102, 'Rajkumar', 'HR', 3000),
(103, 'Akbar', 'IT', 4000),
(104, 'Dorvin', 'Finance', 6500),
(105, 'Rohit', 'HR', 3000),
(106, 'Rajesh',  'Finance', 5000),
(107, 'Preet', 'HR', 7000),
(108, 'Maryam', 'Admin', 4000),
(109, 'Sanjay', 'IT', 6500),
(110, 'Vasudha', 'IT', 7000),
(111, 'Melinda', 'IT', 8000),
(112, 'Komal', 'IT', 10000),
(113, 'Gautham', 'Admin', 2000),
(114, 'Manisha', 'HR', 3000),
(115, 'Chandni', 'IT', 4500),
(116, 'Satya', 'Finance', 6500),
(117, 'Adarsh', 'HR', 3500),
(118, 'Tejaswi', 'Finance', 5500),
(119, 'Cory', 'HR', 8000),
(120, 'Monica', 'Admin', 5000),
(121, 'Rosalin', 'IT', 6000),
(122, 'Ibrahim', 'IT', 8000),
(123, 'Vikram', 'IT', 8000),
(124, 'Dheeraj', 'IT', 11000);

select * from employee;

-- Find each employee’s salary and the rank of salary within their department.
select emp_id, emp_name, dept_name, salary,
	rank() over(partition by dept_name order by salary desc) as salary_count
from employee;


-- Find each employee’s salary and the dense rank of salary across the whole company.
select emp_id, emp_name, dept_name, salary,
	dense_rank() over(order by salary desc) as salary_rank
from employee;


-- Show each employee’s salary and the difference between their salary 
-- and the highest salary in their department.
select emp_id, emp_name, dept_name, salary, 
	(max(salary) over(partition by dept_name) - salary) as salary_difference
from employee;

-- Show each employee’s salary and the average salary of their department.
select emp_id, emp_name, dept_name, salary,
	avg(salary) over(partition by dept_name) as dept_avg_salary
from employee;


-- Find each employee’s salary and the cumulative sum of salaries 
-- in their department ordered by salary.
select emp_id, emp_name, dept_name, salary,
	sum(salary) over(partition by dept_name order by salary rows unbounded preceding) as cumulative_sum
from employee;


-- Find each employee’s salary and the percentage of salary contribution in their department.
select emp_id, emp_name, dept_name, salary,
	(salary * 100.0 / sum(salary) over(partition by dept_name)) as salary_percentage
from employee;


-- For each department, find the employee who has the minimum salary.
select emp_id, emp_name, dept_name, salary,
	min(salary) over(partition by dept_name) as employee_min_salary
from employee;


-- For each employee, find their salary and the salary of the previous employee 
-- in the same department (based on salary order).
select emp_id, emp_name, dept_name, salary,
	lag(salary) over(partition by dept_name order by salary desc) as previous_salary
from employee;


-- For each employee, find their salary and the salary of the next employee 
-- in the same department (based on salary order).
select emp_id, emp_name, dept_name, salary,
	lead(salary) over(partition by dept_name order by salary desc) as next_salary
from employee;

-- For each department, display employee name, salary,
-- and (row number, rank, dense_rank) ordered by salary descending.
select emp_id, emp_name, dept_name, salary,
	row_number() over(partition by dept_name order by salary desc) as row_num,
	rank() over(partition by dept_name order by salary desc) as rnk,
	dense_rank() over(partition by dept_name order by salary desc) as dns_rnk  
from employee;

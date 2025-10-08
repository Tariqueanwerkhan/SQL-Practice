create table employee001 (
emp_ID int, 
emp_NAME varchar(50), 
DEPT_NAME varchar(50), 
SALARY int
);

insert into employee001 (emp_Id, emp_name, dept_name, salary)
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

select dept_name, max(salary) from employee001
group by dept_name;

-- By using MAX as an window function, SQL will not reduce records but the result will be shown corresponding to each record.
select e.*,
max(salary) over(partition by dept_name) as max_salary
from employee001 e;


-- Checking the different between rank, dense_rnk and row_number window functions:
select e.*,
row_number() over(partition by dept_name order by salary desc) as rn,
rank() over(partition by dept_name order by salary desc) as rnk,
dense_rank() over(partition by dept_name order by salary desc) as dns_rnk
from employee001 e;

-- row_number()
select e.*,
row_number() over(partition by dept_name) as rn
from employee001 e;

-- Fetch the first 2 employees from each department to join the company.
select * from
(select e.*,
row_number() over(partition by dept_name order by emp_id) as rn
from employee001 e) as x
where x.rn < 3;

-- Fetch the top 3 employees in each department earning the max salary.
select * from
(select e.*,
rank() over(partition by dept_name order by salary desc) as rnk
from employee001 e) as x
where x.rnk < 4;


-- lead and lag
-- fetch a query to display if the salary of an employee is higher, lower or equal to the previous employee.
select e.*,
lag(salary) over(partition by dept_name order by emp_id) as prev_emp_salary,
case when e.salary > lag(salary) over(partition by dept_name order by emp_id) then 'Higher than previous employee'
when e.salary < lag(salary) over(partition by dept_name order by emp_id) then 'Lower than previous employee'
when e.salary = lag(salary) over(partition by dept_name order by emp_id) then 'same as previous employee'
end as sal_range
from employee001 e;


-- Similarly using lead function to see how it is different from lag.
select e.*,
lag(salary) over(partition by dept_name order by emp_id) as prev_emp_salary,
lead(salary) over(partition by dept_name order by emp_id) as next_emp_salary
from employee001 e;

-- Assign a row number to each employee ordered by salary (highest first).
SELECT emp_name, dept_name, salary,
row_number() over(order by salary desc) as row_num
from employee001;

-- Rank employees within each department by salary using RANK().
select emp_id, dept_name, salary,
rank() over(partition by dept_name order by salary desc) as salary_rank
from employee001;

-- Do the same as above but with DENSE_RANK() (to see the difference).
select emp_id, dept_name, salary,
dense_rank() over(partition by dept_name order by salary desc) as dns_salary_rank
from employee001;

-- Divide employees into 4 equal salary groups using NTILE(4).
select emp_name, dept_name, salary,
NTILE(4) over(order by salary desc) as salary_group
from employee001;

-- Show each employee’s salary along with the previous employee’s salary (use LAG).
select emp_name, dept_name, salary,
lag(salary, 1) over(order by salary desc) as previous_salary
from employee001; 

-- Show each employee’s salary along with the next employee’s salary (use LEAD).
select emp_name, dept_name, salary,
LEAD(salary, 1) over(order by salary desc) as next_salary
from employee001;

-- Calculate the running total of salaries ordered by salary.
select emp_name, dept_name, salary,
sum(salary) over(order by salary desc, emp_id) as running_total
from employee001;

-- Find the highest salary per department using a window function.
select emp_name, dept_name, salary,
max(salary) over(partition by dept_name) as max_salary
from employee001;

-- Find the average salary per department (without using GROUP BY, only window functions).
select emp_name, dept_name, salary,
avg(salary) over(partition by dept_name) as avg_salary
from employee001;

-- For each employee, show the difference between their salary and the average salary of their department.
select emp_name, dept_name, salary, 
avg(salary) over(partition by dept_name) as avg_salary,
salary - avg(salary) over(partition by dept_name) as diff_from_avg
from employee001;

select * from employee001;


-------------------------------------------------------------------------------------------------------------------------

create table emp
(emp_ID int, 
emp_NAME varchar(50),
SALARY int);

insert into emp values(101, 'Mohan', 40000);
insert into emp values(102, 'James', 50000);
insert into emp values(103, 'Robin', 60000);
insert into emp values(104, 'Carol', 70000);
insert into emp values(105, 'Alice', 80000);
insert into emp values(106, 'Jimmy', 90000);


with avg_sal(avg_salary) as 
(select cast(avg(salary) as SIGNED)from emp)
select * from emp e
join avg_sal av
on e.salary > av.avg_salary;

select * from emp;



create table sales
(store_id int,
store_name varchar(50),
product varchar(50),
quantity int,
cost int);

insert into sales values
(1, 'Apple Originals 1','iPhone 12 Pro', 1, 1000),
(1, 'Apple Originals 1','MacBook pro 13', 3, 2000),
(1, 'Apple Originals 1','AirPods Pro', 2, 280),
(2, 'Apple Originals 2','iPhone 12 Pro', 2, 1000),
(3, 'Apple Originals 3','iPhone 12 Pro', 1, 1000),
(3, 'Apple Originals 3','MacBook pro 13', 1, 2000),
(3, 'Apple Originals 3','MacBook Air', 4, 1100),
(3, 'Apple Originals 3','iPhone 12', 2, 1000),
(3, 'Apple Originals 3','AirPods Pro', 3, 280),
(4, 'Apple Originals 4','iPhone 12 Pro', 2, 1000),
(4, 'Apple Originals 4','MacBook pro 13', 1, 2500);

-- Find total sales per each store
select s.store_id, sum(s.cost) as total_sales_per_Store
from sales s
group by s.store_id;


-- Find average sales with respect to all stores
select cast(avg(total_sales_per_store) as signed) as avg_total_sales_per_store
from (select s.store_id, sum(s.cost) as total_sales_per_store
from sales s 
group by s.store_id) as x;

-- Find stores who's sales where better than the average sales accross all stores
select * from
(select s.store_id, sum(s.cost) as total_sales_per_store
from sales s
group by s.store_id) as total_sales
join
(select cast(avg(total_sales_per_store) as signed) as avg_sales_for_all_store
from (select s.store_id, sum(s.cost) as total_sales_per_store
from sales s 
group by s.store_id) as x) avg_sales
on total_sales.total_sales_per_store > avg_sales.avg_sales_for_all_store;



-- with clause (CTE)
WITH total_sales as
(select s.store_id, sum(s.cost) as total_sales_per_store 
from sales s 
group by s.store_id),
avg_sales as
(select cast(avg(total_sales_per_store) as signed) as avg_sales_for_all_store
from total_sales)
select * 
from total_sales
join avg_sales
on total_sales.total_sales_per_store > avg_sales.avg_sales_for_all_store;

select * from sales;

-----------------------------------------------------------------------------------------------------------------------------


create table employees_cte (
    emp_id int primary key,
    emp_name varchar(50),
    dept_name varchar(50),
    salary int,
    manager_id int
);

insert into employees_cte values
(1, 'Amit', 'IT', 60000, 5),
(2, 'Rohit', 'HR', 45000, 6),
(3, 'Sneha', 'Finance', 55000, 7),
(4, 'Priya', 'IT', 70000, 5),
(5, 'Rajesh', 'IT', 90000, NULL),
(6, 'Meena', 'HR', 80000, NULL),
(7, 'Karan', 'Finance', 95000, NULL),
(8, 'Vikas', 'IT', 40000, 5),
(9, 'Nidhi', 'HR', 38000, 6),
(10, 'Pooja', 'Finance', 42000, 7),
(11, 'Sahil', 'IT', 50000, 5),
(12, 'Arjun', 'Finance', 60000, 7),
(13, 'Manish', 'HR', 55000, 6),
(14, 'Tina', 'IT', 48000, 5),
(15, 'Deepak', 'Finance', 52000, 7),
(16, 'Komal', 'HR', 60000, 6),
(17, 'Alok', 'Finance', 75000, 7),
(18, 'Shivam', 'IT', 65000, 5),
(19, 'Riya', 'HR', 47000, 6),
(20, 'Neha', 'Finance', 58000, 7);

select * from employees_cte;

-- Find the average salary of each department using a CTE. 
with dept_avg as
(select dept_name, avg(salary) as avg_salary
from employees_cte
group by dept_name)
select * from dept_avg;

-- List employees whose salary is above the average salary of their department (use CTE).
with dept_avg as
(select dept_name, avg(salary) as avg_salary
from employees_cte
group by dept_name)
select e.emp_id, e.emp_name, e.dept_name, e.salary
from employees_cte e
join dept_avg d
on e.dept_name = d.dept_name
where e.salary > d.avg_salary;

-- Find the highest-paid employee in each department using CTE.
with dept_max as
(select dept_name, max(salary) as max_salary
from employees_cte 
group by dept_name)
select e.emp_id, e.emp_name, e.dept_name, e.salary
from employees_cte e
join dept_max d 
on e.dept_name = d.dept_name
and e.salary = d.max_salary; 

-- Calculate the difference between each employee's salary and their department’s average salary (with CTE).
with dept_avg as 
(select dept_name, avg(salary) as avg_salary
from employees_cte
group by dept_name)
select e.emp_name, e.dept_name, e.salary, e.salary - d.avg_salary as salary_diff
from employees_cte e 
join dept_avg d 
on e.dept_name = d.dept_name;

-- List all employees along with their manager’s name (self-join with CTE).
with emp_mgr as
(select e.emp_id, e.emp_name, e.dept_name, e.salary, e.manager_id
from employees_cte e)
select e.emp_name as employee, m.emp_name as manager
from emp_mgr e
left join employees_cte m 
on e.manager_id = m.emp_id;

-- Find the second-highest salary in each department using CTE.
with dept_rank as
(select emp_id, emp_name, dept_name, salary,
dense_rank() over(partition by dept_name order by salary desc) as rnk
from employees_cte)
select emp_id, emp_name, dept_name, salary
from dept_rank
where rnk = 2;

-- Get the count of employees per department using CTE.
with dept_count as
(select dept_name, count(*) as emp_count
from employees_cte
group by dept_name)
select * from dept_count;

-- Find total salary paid by each department (CTE + SUM).
with dept_total as
(select dept_name, sum(salary) as total_salary
from employees_cte
group by dept_name)
select * from dept_total;

-- Find employees who earn more than the overall average salary (using CTE). 
with overall_avg as
(select avg(salary) as avg_salary
from employees_cte)
select e.emp_id, e.emp_name, e.salary
from employees_cte e 
join overall_avg o
where e.salary > o.avg_salary;

select * from employees_cte;
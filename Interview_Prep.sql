-- Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO Departments (department_id, department_name) VALUES
(101, 'Engineering'),
(102, 'Data Science'),
(103, 'Human Resources');

select * from departments;



--Employees Table 
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    hire_date DATE,
    job_title VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Employees VALUES
(1, 'John', 'Smith', 101, '2018-03-15', 'Software Engineer', 60000, 5),
(2, 'Sarah', 'Johnson', 102, '2019-07-01', 'Data Analyst', 55000, 6),
(3, 'Michael', 'Brown', 101, '2017-11-20', 'Senior Engineer', 80000, 5),
(4, 'Emily', 'Davis', 103, '2020-05-18', 'HR Specialist', 50000, 7),
(5, 'David', 'Wilson', 101, '2015-01-10', 'Engineering Mgr', 95000, NULL),
(6, 'Linda', 'Martinez', 102, '2016-02-25', 'Data Science Mgr', 105000, NULL),
(7, 'James', 'Anderson', 103, '2014-09-12', 'HR Manager', 90000, NULL),
(8, 'Robert', 'Taylor', 101, '2021-08-09', 'Intern', 30000, 5);


select * from Employees;



-- Projects table
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT,
    budget DECIMAL(10,2),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Projects VALUES
(201, 'AI Chatbot', 102, 200000, '2021-01-01', '2021-12-31'),
(202, 'Mobile App', 101, 150000, '2020-06-01', '2021-06-01'),
(203, 'Recruitment Drive', 103, 80000, '2021-03-01', '2021-09-01'),
(204, 'Cloud Migration', 101, 300000, '2019-04-01', '2022-04-01');

select * from Projects;




-- 1. Select all employees from Engineering department.
select first_name, last_name
from employees
where department_id = 101;

-- 2. Find employees who joined after 2018.
select first_name, last_name, hire_date
from employees 
where hire_date > '2018-12-31';

-- 3. List employees with salary greater than 70,000.
select first_name, last_name, salary
from employees 
where salary > 70000;

-- 4. Show distinct job titles in the company.
select distinct job_title
from employees;

-- 5. Sort employees by hire_date (earliest first).
select first_name, last_name, hire_date
from employees
order by hire_date asc;

-- 6. Find the average salary of each department.
select d.department_name, avg(e.salary) as avg_salary
from employees e
join departments d on e.department_id = d.department_id
group by department_name;

-- 7. List employees along with their department name.
select e.first_name, e.last_name, d.department_name
from employees e
join departments d on e.department_id = d.department_id;

-- 8. Find the highest paid employee in Data Science.
select first_name, last_name, job_title, salary
from employees
where department_id = 102
order by salary desc
limit 1;

-- 9. Count how many employees each manager supervises.
select manager_id, count(*) as num_employees 
from employees
where manager_id is not null
group by manager_id;

select * from employees;

-- 10. Show employees working in projects with a budget over 200,000.
select e.first_name, e.last_name, p.project_name, p.budget
from employees e 
join departments d on e.department_id = d.department_id
join projects p on d.department_id = p.department_id
where p.budget > 200000;

-- 11. Find employees whose salary is above the company average.
select first_name, last_name, salary from employees
where salary > (select avg(salary) as company_avg from employees);

-- 12. List departments that have more than 2 employees.
select d.department_name, count(e.employee_id) as emp_count
from employees e
join departments d on e.department_id = d.department_id
group by department_name 
having count(e.employee_id) > 2;


-- 13. Show employees who do not manage anyone.
select employee_id, first_name, last_name
from employees 
where employee_id not in (select distinct manager_id from employees 
where manager_id is not null);

-- 14. Find employees who are not assigned to any project.
select e.first_name, e.last_name
from employees e
left join projects p on e.department_id = p.department_id
where p.project_id is null;

-- 15. Get the 2nd highest salary in the company.
select max(salary) as max_salary 
from employees
where salary < (select max(salary) from employees);


select distinct salary from employees 
order by salary desc
limit 1 offset 1;

-- 16. Rank employees within each department by salary.
select e.first_name, e.last_name, d.department_name, e.salary,
rank() over(partition by e.department_id order by e.salary desc) as salary_rank
from employees e 
join departments d on e.department_id = d.department_id;


-- 17. Find the top 3 highest paid employees in the company.
select first_name, last_name, salary
from (select e.*, dense_rank() over(order by salary desc) as rnk from employees e) t
where rnk <= 3;


-- 18. Show cumulative salary expense ordered by hire_date.
select first_name, last_name, hire_date, salary,
sum(salary) over(order by hire_date asc) as running_total
from employees;


-- 19. Find departments where average salary is higher than the overall company average.


-- 20. List employees with their manager’s name.
select e.first_name as employees, m.first_name as manager 
from employees e
left join employees m on e.manager_id = m.employee_id;

-- 21. Retrieve the total salary paid by each department.
SELECT d.department_id, d.department_name, sum(e.salary) as total_salary
from employees e
join departments d 
on e.department_id = d.department_id
group by d.department_id
order by total_salary desc;

-- 22. Find employees hired in the year 2020.
select first_name, last_name, hire_date
from employees 
where extract(year from hire_date) = 2020;

-- another method
SELECT first_name, last_name, hire_date
FROM Employees
WHERE hire_date >= '2020-01-01' and hire_date < '2021-01-01';


-- 23. List employees whose name starts with 'J'.
select first_name, last_name 
from employees
where first_name like 'J%';


-- 24. Get employees who earn between 50,000 and 90,000.
SELECT first_name, last_name, salary
from employees
where salary between 50000 and 90000;

-- 25. Show department name and number of projects handled by each.
select d.department_id, d.department_name, count(p.project_id) as project_count
from departments d
left join projects p 
on d.department_id = p.department_id
group by d.department_id;

-- 26. Find projects that ended before 2021.
select project_name, end_date
from projects
where end_date < '2020-01-01';

-- 27. Show employees who joined before their manager.
select e.first_name, e.last_name, e.hire_date, 
m.first_name as manager, m.hire_date as manager_hire
from employees e
join employees m
on e.manager_id = m.employee_id
where e.hire_date < m.hire_date;

-- 28. Find the minimum and maximum salary in each department.
select d.department_name, min(e.salary) as min_salary, max(salary) as max_salary
from employees e
join departments d 
on e.department_id = d.department_id 
group by department_name;


-- 29. Show employees with the same job title.
select job_title, count(*) as count
from employees 
group by job_title
having count(*) > 1;

-- 30. Retrieve employees hired in the last 3 years.

select first_name, last_name, hire_date
from employees
where hire_date >= current_date - interval '3 years';


-- 31. Find employees working on projects starting in 2021.
select distinct e.first_name, e.last_name, p.project_name, p.start_date
from employees e
join departments d 
on e.department_id = d.department_id 
join projects p 
on d.department_id = p.department_id 
where extract(year from p.start_date) = 2021;


-- 32. Show managers who earn less than some of their team members.
select distinct m.first_name, m.last_name, m.salary
from employees m
join employees e
on m.employee_id = e.manager_id
where m.salary < e.salary;


-- 33. Find departments that don’t have any projects.
select d.department_name
from departments d
left join projects p
on d.department_id = p.department_id
where p.project_id is null;


-- 34. Show employees who work in more than one project (if project assignments were tracked by department).
select e.first_name, e.last_name, count(p.project_id) as project_count
from employees e
join projects p on e.department_id = p.department_id
group by e.employee_id
having count(p.project_id) > 1;


-- 35. Get employees whose salary is equal to the department average.
select e.first_name, e.last_name, e.salary, d.department_name
from employees e 
join departments d on e.department_id = d.department_id
where e.salary = (
	select avg(salary) as avg_salary
	from employees 
	where department_id = e.department_id
);


-- 36. Find the project with the largest budget.
select project_name, budget
from projects 
order by budget desc
limit 1;


-- 37. Show departments and their highest paid employee.
select d.department_name, e.first_name, e.last_name, e.salary
from employees e
join departments d on e.department_id = d.department_id
where e.salary = (
	select max(salary) as max_salary from employees
	where department_id = e.department_id
);


-- 38. Find employees who joined in the same year as their manager.
select e.first_name, e.last_name, m.first_name as Manager_name
from employees e
join employees m on e.manager_id = m.employee_id
where extract(year from e.hire_date) = extract(year from m.hire_date);


-- 39. Get the average project budget by year.
select 
	extract(year from start_date)::int as year,
	avg(budget)::numeric(12,2) as avg_budget
	from projects
	group by year
	order by year;

-- 40. List all employees and indicate whether they are a manager or not.
select e.employee_id, e.first_name, e.last_name,
	case
		when e.employee_id in(
				select distinct manager_id from employees 
				where manager_id is not null) 
			then 'Yes'
			else 'No'
		end as is_manager
from employees e
order by e.employee_id;


-- 41. Show the longest running project.
select project_name, (end_date - start_date) as duration_days
from projects
order by duration_days desc
limit 1;


-- 42. Get department name sorted by average salary (descending).
select d.department_name, avg(e.salary) as avg_salary
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
group by d.department_name
order by avg_salary desc;


-- 43. Find employees who earn more than their manager.
select e.first_name, e.last_name, e.salary, 
m.first_name as manager, m.salary as manager_salary
from employees e
join employees m on e.manager_id = m.employee_id
where e.salary > m.salary;


-- 44. List projects with no end date (ongoing projects).
select project_name, end_date 
from projects 
where end_date is null;

-- 45. Show total salary expense per year based on hire_date.
select extract(year from hire_date) as year, sum(salary) as total_salary
from employees
group by extract(year from hire_date)
order by year;

-- 46. Find the difference between highest and lowest salary in the company.
select max(salary) - min(salary) as salary_difference
from employees;

-- 47. Retrieve employees ranked by salary across the company.
select first_name, last_name, salary,
rank() over(order by salary desc) as rank_in_company
from employees;

-- 48. Show employees hired in each department, ordered by hire_date.
select d.department_name, e.first_name, e.last_name, e.hire_date
from employees e
join departments d on e.department_id = d.department_id
order by d.department_name, e.hire_date;


-- 49. Find the project with the smallest budget.
select project_name, budget
from projects
order by budget
limit 1;

-- 50. Get employees with salaries above their department’s average.
select e.first_name, e.last_name, e.salary, d.department_name
from employees e
join departments d on e.department_id = d.department_id
where e.salary > (select avg(salary) from employees
                where department_id = d.department_id);

---------------------------------------------------------------------------------------------
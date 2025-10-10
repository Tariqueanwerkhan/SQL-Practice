CREATE TABLE Departments01 (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

INSERT INTO Departments01 (department_id, department_name)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales');

select * from departments01;

CREATE TABLE Employees01 (
    employee_id serial PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    joining_date DATE,
    FOREIGN KEY (department_id) REFERENCES Departments01(department_id)
);

INSERT INTO Employees01 (first_name, last_name, department_id, salary, joining_date) 
VALUES
('Amit', 'Sharma', 1, 50000, '2021-05-10'),
('Neha', 'Verma', 2, 60000, '2020-07-15'),
('Raj', 'Kumar', 3, 75000, '2019-11-20'),
('Priya', 'Singh', 4, 55000, '2022-01-12'),
('Karan', 'Patel', 5, 45000, '2023-03-18'),
('Sara', 'Ali', 3, 80000, '2018-06-25'),
('Vikram', 'Mehta', NULL, 40000, '2022-09-30');

select * from employees01;

select d.department_id, e.first_name, e.last_name, d.department_name
from employees01 e
inner join departments01 d
on e.department_id = d.department_id;


select e.first_name, e.last_name, e.salary, d.department_name
from employees01 e
left join departments01 d
on e.department_id = d.department_id;


select e.first_name, e.last_name, e.salary, d.department_name
from employees01 e
right join departments01 d
on e.department_id = d.department_id;


select e.first_name, e.last_name, e.salary, d.department_name
from employees01 e 
left join departments01 d 
on e.department_id = d.department_id
union
select e.first_name, e.last_name, e.salary, d.department_name
from employees01 e 
right join departments01 d 
on e.department_id = d.department_id;


select e.first_name, e.last_name, d.department_name
from employees01 e
cross join departments01 d;




CREATE TABLE Projects (
    project_id serial PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (department_id) REFERENCES Departments01(department_id)
);

INSERT INTO Projects (project_name, department_id, start_date, end_date) 
VALUES('Payroll System', 2, '2021-01-01', '2021-12-31'),
('Website Redesign', 3, '2022-03-01', '2022-09-30'),
('Recruitment Drive', 1, '2020-06-01', '2020-12-31'),
('Sales CRM', 4, '2023-01-01', '2023-12-31'),
('Ad Campaign', 5, '2022-05-15', '2022-11-15');

-- Employees with their departments and projects
select e.first_name, e.last_name, d.department_name, p.project_name
from employees01 e
join departments01 d on e.department_id = d.department_id
join projects p on d.department_id = p.department_id;

-- Show all departments and their projects (even if no employee assigned)
select d.department_name, p.project_name, e.first_name, e.last_name
from departments01 d
left join projects p on d.department_id = p.department_id
left join employees01 e on d.department_id = e.department_id;

-- Find employees who are not assigned to any department
select e.first_name, e.last_name
from employees01 e
left join departments01 d on e.department_id = d.department_id
where d.department_id is null;

-- Find departments that don’t have any project
select d.department_name
from departments01 d
left join projects p on d.department_id = p.department_id
where p.project_id is null;



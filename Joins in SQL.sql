-- Create Employees Table
CREATE TABLE Employees4(
employee_id serial primary key,
first_name varchar(50),
last_name varchar(50),
department_id int
);

-- insert data into table
INSERT INTO Employees4(first_name, last_name, department_id)
values('Rahul', 'Sharma', 101),
('Priya', 'Mehta', 102),
('Ankit', 'Verma', 103),
('Simran', 'Kaur', NULL),
('Aman', 'Singh', 101);
select * from Employees4;


-- create deparment table
Create table Departments(
department_id int primary key,
department_name varchar(50)
);


-- insert data into table
INSERT INTO Departments(department_id, department_name)
values (101, 'Sales'),
(102, 'Marketing'),
(103, 'IT'),
(104, 'HR');
select * from Departments;


-- right join
Select e.employee_id, e.first_name, e.last_name, d.department_id, d.department_name
from Employees4 e
right join
Departments d
on e.department_id = d.department_id;

-- left join
Select e.employee_id, e.first_name, e.last_name, d.department_id, d.department_name
from Employees4 e
left join
Departments d
on e.department_id = d.department_id;

-- inner join
select e.employee_id, e.first_name, e.last_name, d.department_id, d.department_name
from Employees4 e
INNER JOIN 
Departments d
on e.department_id = d.department_id;

-- full outer join, use UNION IN mysql
Select e.employee_id, e.first_name, e.last_name, d.department_id, d.department_name
from Employees4 e
LEFT JOIN
Departments d
on e.department_id = d.department_id
UNION
Select e.employee_id, e.first_name, e.last_name, d.department_id, d.department_name
from Employees4 e
Right join
Departments d
on e.department_id = d.department_id;


-- CROSS JOIN
select e.first_name, e.last_name, d.department_name
from Employees4 e
cross join
departments d; 


-- self join
SELECT e1.first_name AS Employee_name1,
	   e2.first_name AS Employee_name2,
	   d.department_name
FROM employees3 e1 JOIN employees3 e2
ON e1.department_id=e2.department_id AND e1.employee_id!=e2.employee_id
JOIN 
departments d
ON	
e1.department_id=d.department_id;



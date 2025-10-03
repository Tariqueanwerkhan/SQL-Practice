CREATE TABLE Employees02 (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO Employees02 (emp_name, department) VALUES
('Amit Sharma', 'HR'),
('Neha Verma', 'IT'),
('Raj Kumar', 'Finance'),
('Priya Singh', 'IT'),
('Karan Patel', 'Marketing'),
('Sara Ali', 'HR');

select * from Employees02;


CREATE TABLE Salaries02 (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    FOREIGN KEY (emp_id) REFERENCES Employees02(emp_id)
);

INSERT INTO Salaries02 (emp_id, salary, bonus) VALUES
(1, 40000, 5000),
(2, 55000, 7000),
(4, 60000, 10000),
(6, 45000, 3000);

select * from Salaries02;

-- inner join
select e.emp_id, e.emp_name, s.salary
from Employees02 e
inner join salaries02 s 
on e.emp_id = s.emp_id;

-- left join
select e.emp_id, e.emp_name, s.salary
from Employees02 e 
left join salaries02 s 
on e.emp_id = s.emp_id;

-- right join
select e.emp_id, e.emp_name, s.emp_id, s.salary
from Employees02 e 
right join salaries02 s 
on e.emp_id = s.emp_id;

-- full outer joins
select e.emp_id, e.emp_name, s.emp_id, s.salary
from Employees02 e 
left join salaries02 s 
on e.emp_id = s.emp_id
union
select e.emp_id, e.emp_name, s.emp_id, s.salary
from Employees02 e 
right join salaries02 s 
on e.emp_id = s.emp_id;


-- cross join
select e.emp_name, s.salary
from employees02 e 
cross join
salaries02 s;


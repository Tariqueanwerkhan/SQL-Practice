CREATE TABLE Employees1(
EmpID int NOT NULL,
EmpName Varchar,
Gender Char,
Salary int,
City Char(20) 
)

INSERT INTO Employees1
VALUES (1, 'Arjun', 'M', 75000, 'Pune'),
(2, 'Ekadanta', 'M', 125000, 'Bangalore'),
(3, 'Lalita', 'F', 150000 , 'Mathura'),
(4, 'Madhav', 'M', 250000 , 'Delhi'),
(5, 'Visakha', 'F', 120000 , 'Mathura')




CREATE TABLE EmployeeDetail (
EmpID int NOT NULL,
Project Varchar,
EmpPosition Char(20),
DOJ date )

INSERT INTO EmployeeDetail
VALUES (1, 'P1', 'Executive', '26-01-2019'),
(2, 'P2', 'Executive', '04-05-2020'),
(3, 'P1', 'Lead', '21-10-2021'),
(4, 'P3', 'Manager', '29-11-2019'),
(5, 'P2', 'Manager', '01-08-2020')


select * from employees1;

select * from employeedetail;


-- Q1(a): Find the list of employees whose salary ranges between 2L to 3L.
SELECT EmpName, Salary FROM Employees1
WHERE Salary > 200000 AND Salary < 300000
-- OR
SELECT EmpName, Salary FROM Employees1
WHERE Salary BETWEEN 200000 AND 300000


-- Q1(b): Write a query to retrieve the list of employees from the same city.
SELECT E1.EmpID, E1.EmpName, E1.City
FROM Employees1 E1, Employees1 E2
WHERE E1.City = E2.City AND E1.EmpID != E2.EmpID


-- Q1(c): Query to find the null values in the Employee table.
SELECT * FROM Employees1
WHERE EmpID IS NULL


-- Q2(a): Query to find the cumulative sum of employee’s salary.
SELECT EmpID, Salary, 
SUM(Salary) OVER (ORDER BY EmpID) AS CumulativeSum
FROM Employees1;


-- Q2(b): What’s the male and female employees ratio.
SELECT
(COUNT(*) FILTER (WHERE Gender = 'M') * 100.0 / COUNT(*)) AS MalePct,
(COUNT(*) FILTER (WHERE Gender = 'F') * 100.0 / COUNT(*)) AS FemalePct
FROM Employees1;


-- Q2(c): Write a query to fetch 50% records from the Employee table.
SELECT * FROM Employees1
WHERE EmpID <= (SELECT COUNT(EmpID)/2 from Employees1);


-- Q3: Query to fetch the employee’s salary but replace the LAST 2 digits with ‘XX’
-- i.e 12345 will be 123XX
SELECT Salary,
CONCAT(SUBSTRING(Salary::text, 1, LENGTH(Salary::text)-2), 'XX') as masked_number
FROM Employees1;


-- Q4: Write a query to fetch even and odd rows from Employee table.

---Fetch even rows
SELECT * FROM
(SELECT *, ROW_NUMBER() OVER(ORDER BY EmpId) AS
RowNumber
FROM Employees1) AS Emp
WHERE Emp.RowNumber % 2 = 0


---Fetch odd rows
SELECT * FROM
(SELECT *, ROW_NUMBER() OVER(ORDER BY EmpId) AS
RowNumber
FROM Employees1) AS Emp
WHERE Emp.RowNumber % 2 = 1


---Fetch even rows
SELECT * FROM Employees1
WHERE MOD(EmpID,2)=0;


---Fetch odd rows
SELECT * FROM Employees1
WHERE MOD(EmpID,2)=1;



-- Q5(a): Write a query to find all the Employee names whose name:
-- • Begin with ‘A’
-- • Contains ‘A’ alphabet at second place
-- • Contains ‘Y’ alphabet at second last place
-- • Ends with ‘L’ and contains 4 alphabets
-- • Begins with ‘V’ and ends with ‘A’

SELECT * FROM Employees1 WHERE EmpName LIKE 'A%';
SELECT * FROM Employees1 WHERE EmpName LIKE '_a%';
SELECT * FROM Employees1 WHERE EmpName LIKE '%y_';
SELECT * FROM Employees1 WHERE EmpName LIKE '____l';
SELECT * FROM Employees1 WHERE EmpName LIKE 'V%a';


-- Q5(b): Write a query to find the list of Employee names which is:
-- • starting with vowels (a, e, i, o, or u), without duplicates
-- • ending with vowels (a, e, i, o, or u), without duplicates
-- • starting & ending with vowels (a, e, i, o, or u), without duplicates

SELECT DISTINCT EmpName
FROM Employees1
WHERE LOWER(EmpName) SIMILAR TO '[aeiou]%';
SELECT DISTINCT EmpName
FROM Employees1
WHERE LOWER(EmpName) SIMILAR TO '%[aeiou]';
SELECT DISTINCT EmpName
FROM Employees1
WHERE LOWER(EmpName) SIMILAR TO '[aeiou]%[aeiou]';



-- Q6: Find Nth highest salary from employee table with and without using the LIMIT keywords.
SELECT Salary FROM EmployeeS1 E1
WHERE N-1 = (
SELECT COUNT( DISTINCT ( E2.Salary ) )
FROM EmployeeS1 E2
WHERE E2.Salary > E1.Salary );

-- USING LIMIT
SELECT Salary FROM Employee
ORDER BY Salary DESC
LIMIT 1 OFFSET N-1;


-- Q7(a): Write a query to find and remove duplicate records from a table.
SELECT EmpID, EmpName, gender, Salary, city,
COUNT(*) AS duplicate_count
FROM Employees1
GROUP BY EmpID, EmpName, gender, Salary, city
HAVING COUNT(*) > 1;


-- Q7(b): Query to retrieve the list of employees working in same project.
WITH CTE AS
(SELECT e.EmpID, e.EmpName, ed.Project
FROM Employees1 AS e
INNER JOIN EmployeeDetail AS ed
ON e.EmpID = ed.EmpID)
SELECT c1.EmpName, c2.EmpName, c1.project
FROM CTE c1, CTE c2
WHERE c1.Project = c2.Project AND c1.EmpID != c2.EmpID AND c1.EmpID < c2.EmpID;


-- Q8: Show the employee with the highest salary for each project
SELECT ed.Project, MAX(e.Salary) AS ProjectSal
FROM Employees1 AS e
INNER JOIN EmployeeDetail AS ed
ON e.EmpID = ed.EmpID
GROUP BY Project
ORDER BY ProjectSal DESC;


-- Q9: Query to find the total count of employees joined each year
SELECT EXTRACT('year' FROM doj) AS JoinYear, COUNT(*) AS EmpCount
FROM Employees1 AS e
INNER JOIN EmployeeDetail AS ed ON e.EmpID = ed.EmpID
GROUP BY JoinYear
ORDER BY JoinYear ASC



-- Q10: Create 3 groups based on salary col, salary less than 1L is low, between 1 -
-- 2L is medium and above 2L is High

select empname, salary,
	case
		when salary > 200000 then 'High'
		when salary between 100000 and 200000 then 'Medium'
		else 'Low'
	end as salary_count
from employees1;


-- Query to pivot the data in the Employee table and retrieve the total
-- salary for each city.
-- The result should display the EmpID, EmpName, and separate columns for each city
-- (Mathura, Pune, Delhi), containing the corresponding total salary.
SELECT
EmpID,
EmpName,
SUM(CASE WHEN City = 'Mathura' THEN Salary END) AS "Mathura",
SUM(CASE WHEN City = 'Pune' THEN Salary END) AS "Pune",
SUM(CASE WHEN City = 'Delhi' THEN Salary END) AS "Delhi"
FROM Employees1
GROUP BY EmpID, EmpName;


select * from employees1;
CREATE TABLE students_cte (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course_name VARCHAR(50),
    marks INT,
    mentor_id INT
);


INSERT INTO students_cte VALUES
(1, 'Ankit', 'Math', 85, 11),
(2, 'Rohit', 'Science', 78, 12),
(3, 'Sneha', 'English', 92, 13),
(4, 'Priya', 'Math', 66, 11),
(5, 'Raj', 'Science', 59, 12),
(6, 'Kiran', 'English', 73, 13),
(7, 'Nidhi', 'Math', 90, 11),
(8, 'Deepak', 'Science', 82, 12),
(9, 'Komal', 'English', 88, 13),
(10, 'Sahil', 'Math', 55, 11),
(11, 'Meena', 'Mentor', NULL, NULL),
(12, 'Arjun', 'Mentor', NULL, NULL),
(13, 'Tina', 'Mentor', NULL, NULL),
(14, 'Vikas', 'Science', 61, 12),
(15, 'Riya', 'Math', 72, 11),
(16, 'Shivam', 'English', 95, 13),
(17, 'Manish', 'Science', 84, 12),
(18, 'Alok', 'English', 77, 13),
(19, 'Neha', 'Math', 81, 11),
(20, 'Pooja', 'Science', 68, 12);

select * from students_cte;

-- Find the average marks of each course using a CTE.
with marks_avg as(
select course_name, avg(marks) as avg_marks
from students_cte
where marks is not null
group by course_name)
select * from marks_avg;

-- List the students whose marks are above the average marks of their course.
with marks_avg as(
select course_name, avg(marks) as avg_marks
from students_cte
where marks is not null
group by course_name)
select s.student_id, s.student_name, s.course_name, s.marks
from students_cte s 
join marks_avg m 
on s.course_name = m.course_name
where s.marks > m.avg_marks;


-- Find the highest scoring student in each course using a CTE.
with highest_score as (
select course_name, max(marks) as max_marks
from students_cte
group by course_name)
select s.student_id, s.student_name, s.course_name, s.marks
from students_cte s 
join highest_score h 
on s.course_name = h.course_name
where s.marks = h.max_marks; 


-- Show each student’s marks and the difference from their course’s average marks.
with marks_avg as (
select course_name, avg(marks) as avg_marks
from students_cte
where marks is not null
group by course_name
)
select s.student_name, s.course_name, s.marks, s.marks - m.avg_marks as diff_marks
from students_cte s 
join marks_avg m
on s.course_name = m.course_name
where s.marks is not null;


-- List all students along with their mentor’s name (self-join using CTE).
with mentor_students as (
select student_id, student_name, course_name, marks, mentor_id
from students_cte
where course_name <> 'mentor'
)
select m.student_name as Student, 
m.course_name as Course, 
m.marks as Marks, 
s.student_name as Mentor
from mentor_students m
left join students_cte s 
on m.mentor_id = s.student_id;


-- Find the second-highest marks in each course using CTE.
with course_rank as(
select student_id, student_name, course_name, marks,
dense_rank() over(partition by course_name order by marks desc) as rnk
from students_cte
)
select student_id, student_name, course_name, marks
from course_rank 
where rnk = 2;


-- Get the count of students per course using a CTE.
with course_count as(
select course_name, count(*) as students_count
from students_cte 
group by course_name
)
select * from course_count; 


-- Find the total marks obtained by students in each course (using CTE + SUM).
with course_total as(
select course_name, sum(marks) as total_marks
from students_cte 
where course_name <> 'mentor'
group by course_name
)
select * from course_total;


-- ek hi CTE me tum SUM, AVG, MAX, MIN sab calculate karna hai
with course_stats as(
select course_name, 
		sum(marks) as total_marks,
		avg(marks) as avg_marks,
        max(marks) as max_marks,
        min(marks) as min_marks,
        count(*) as student_count
from students_cte
where course_name <> 'Mentor'
group by course_name
)
select * from course_stats;


-- List the students who scored more than the overall average marks (using CTE).
with overall_avg as (
select avg(marks) as avg_marks
from students_cte
)
select s.student_id, s.student_name, course_name, s.marks
from students_cte s 
join overall_avg o 
on s.marks > o.avg_marks;

-- alternate method
WITH overall_avg AS (
    SELECT AVG(marks) AS avg_marks
    FROM students_cte
)
SELECT s.student_id, s.student_name, s.course_name, s.marks
FROM students_cte s, overall_avg o
WHERE s.marks > o.avg_marks;



-----------------------------------------------------------------------------------------------------------------------




CREATE TABLE sales_cte (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price_per_unit INT,
    sale_date DATE,
    region VARCHAR(50),
    salesperson_id INT
);

INSERT INTO sales_cte VALUES
(1, 'Laptop', 'Electronics', 2, 50000, '2025-01-10', 'North', 101),
(2, 'Mobile', 'Electronics', 5, 20000, '2025-01-12', 'South', 102),
(3, 'Tablet', 'Electronics', 3, 15000, '2025-01-15', 'East', 103),
(4, 'Chair', 'Furniture', 10, 2000, '2025-01-18', 'West', 104),
(5, 'Table', 'Furniture', 4, 8000, '2025-01-20', 'North', 105),
(6, 'Sofa', 'Furniture', 1, 25000, '2025-01-22', 'South', 101),
(7, 'Bed', 'Furniture', 2, 30000, '2025-01-25', 'East', 102),
(8, 'AC', 'Electronics', 1, 40000, '2025-01-28', 'West', 103),
(9, 'Fridge', 'Electronics', 2, 35000, '2025-01-30', 'North', 104),
(10, 'Washing Machine', 'Electronics', 1, 28000, '2025-02-01', 'South', 105),
(11, 'Microwave', 'Electronics', 3, 12000, '2025-02-03', 'East', 101),
(12, 'Mixer', 'Electronics', 4, 5000, '2025-02-05', 'West', 102),
(13, 'TV', 'Electronics', 2, 45000, '2025-02-07', 'North', 103),
(14, 'Fan', 'Electronics', 5, 3000, '2025-02-09', 'South', 104),
(15, 'Cupboard', 'Furniture', 1, 15000, '2025-02-11', 'East', 105),
(16, 'Bookshelf', 'Furniture', 2, 7000, '2025-02-13', 'West', 101),
(17, 'Lamp', 'Furniture', 6, 1200, '2025-02-15', 'North', 102),
(18, 'Mattress', 'Furniture', 3, 10000, '2025-02-17', 'South', 103),
(19, 'Headphones', 'Electronics', 8, 2000, '2025-02-19', 'East', 104),
(20, 'Keyboard', 'Electronics', 10, 1500, '2025-02-21', 'West', 105);
 
 
 
-- Find the total sales amount for each category using a CTE.
with total_sale as(
select category, sum(quantity * price_per_unit) as total_sales_amount
from sales_cte
group by category)
select * from total_sale;

-- Find the average sales amount per region using a CTE.
with avg_sale as(
select region, avg(quantity * price_per_unit) as avg_sales_amount
from sales_cte
group by region)
select * from avg_sale;

-- Same question with SUM, AVG, MAX, MIN, COUNT.
with region_stats as(
select region, 
sum(quantity * price_per_unit) as total_sales_amount,
avg(quantity * price_per_unit) as avg_sales_amount,
max(quantity * price_per_unit) as max_sales_amount,
min(quantity * price_per_unit) as min_sales_amount,
count(*) total_transaction
from sales_cte
group by region)
select * from region_stats;


-- List sales above the overall average sales amount
with overall_avg as(
select avg(quantity * price_per_unit) as avg_sales_amount
from sales_cte)
select s.sale_id, s.product_name, s.category, s.quantity, s.price_per_unit, (s.quantity * s.price_per_unit) as total_sales_amount
from sales_cte s 
join overall_avg o 
on (s.quantity * s.price_per_unit) > o.avg_sales_amount;


-- Find the highest sales transaction in each region using CTE.
with highest_sales as (
select region, max(quantity * price_per_unit) as max_sales_amount
from sales_cte 
group by region)
select s.sale_id, s.product_name, s.category, s.quantity, s.price_per_unit, 
(s.quantity * s.price_per_unit) as highest_sales_amount,
s.region
from sales_cte s 
join highest_sales h 
on s.region = h.region
where (s.quantity * s.price_per_unit) = h.max_sales_amount;


-- Show each salesperson’s total sales using CTE.
with salesperson_total as(
select salesperson_id, sum(quantity * price_per_unit) as total_sales
from sales_cte
group by salesperson_id)
select * from salesperson_total;


-- Find the second highest sales per category using CTE + DENSE_RANK.
with category_rank as(
select product_name, category, quantity, price_per_unit, region,
dense_rank() over(partition by category order by (quantity * price_per_unit) desc) as rnk
from sales_cte)
select product_name, category, quantity, price_per_unit, region
from category_rank
where rnk = 2;


-- List products sold along with their total quantity per category (CTE + SUM).
with product_quantity as(
select product_name, category, sum(quantity) as total_quantity
from sales_cte
group by product_name, category)
select * from product_quantity;


-- Get the monthly sales totals (CTE + GROUP BY month).
with monthly_sale as(
select extract(month from sale_date) as month,
sum(quantity * price_per_unit) as total_sales
from sales_cte
group by extract(month from sale_date)
)
select * from monthly_sale;


-- Find which region has the maximum total sales using CTE.
 with region_sales as(
 select region, sum(quantity * price_per_unit) as total_sales
 from sales_cte
 group by region
 )
 select region , total_sales
 from region_sales
 order by total_sales desc
 limit 1;
 

select * from sales_cte;

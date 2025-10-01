CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    age INT,
    city VARCHAR(50)
);

INSERT INTO students (student_name, age, city) 
VALUES('Amit Kumar', 20, 'Delhi'),
('Riya Sharma', 22, 'Mumbai'),
('Karan Mehta', 21, 'Pune'),
('Sana Ali', 23, 'Delhi'),
('Arjun Singh', 24, 'Bangalore'),
('Neha Verma', 22, 'Kolkata');

select * from students;

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    duration_months INT
);

INSERT INTO courses (course_name, duration_months) 
VALUES('Data Science', 6),
('Web Development', 4),
('Cloud Computing', 5),
('AI & ML', 8),
('Cyber Security', 6);

select * from courses;

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO enrollments (student_id, course_id, enrollment_date) 
VALUES(1, 1, '2024-01-15'),
(2, 2, '2024-02-20'),
(3, 1, '2024-01-25'),
(4, 3, '2024-03-10'),
(5, 4, '2024-04-05'),
(6, 2, '2024-02-28'),
(1, 5, '2024-05-12');

select * from enrollments;

-- 1 List all students and the courses they are enrolled in.
select s.student_id, s.student_name, e.student_id, c.course_name, c.course_id
from students s
inner join enrollments e 
on s.student_id = e.student_id
inner join courses c 
on e.course_id = c.course_id;


-- Show all students even if they are not enrolled in any course
select s.student_id, s.student_name, e.student_id, c.course_name, c.course_id
from students s
left join enrollments e 
on s.student_id = e.student_id
left join courses c 
on e.course_id = c.course_id;


-- List all courses and the students enrolled in them.
select c.course_name, s.student_name
from courses c
left join enrollments e 
on c.course_id = e.course_id
left join students s 
on e.student_id = s.student_id;


-- Find all students who are not enrolled in any course
select s.student_id, s.student_name
from students s 
left join enrollments e 
on s.student_id = e.student_id
where e.course_id is null;


-- Find all courses which have no students enrolled
-- (RIGHT JOIN + WHERE s.student_id IS NULL).
select c.course_id, c.course_name
from enrollments e
right join courses c  
on e.course_id = c.course_id
where e.student_id is null;


-- Show student names and their courses but avoid duplicates
select distinct s.student_name, c.course_name
from students s 
inner join enrollments e 
on s.student_id = e.student_id
inner join courses c 
on e.course_id = c.course_id;


-- Get the count of students in each course
select c.course_name, count(e.student_id) as total_student
from courses c 
left join enrollments e 
on c.course_id = e.course_id
group by c.course_name;


-- Get students who are enrolled in more than 1 course
select s.student_id, s.student_name, count(e.student_id) as total_student
from students s 
inner join enrollments e 
on s.student_id = e.student_id
group by s.student_id, s.student_name
having count(e.student_id) > 1;


-- List students and courses ordered by student_name
select s.student_name, c.course_name
from students s 
inner join enrollments e
on s.student_id = e.student_id
inner join courses c 
on e.course_id = c.course_id
order by s.student_name;

 
 -- List all possible student-course combinations (CROSS JOIN)
select s.student_name, c.course_name
from students s
cross join courses c;


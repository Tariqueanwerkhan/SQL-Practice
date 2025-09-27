Create table students_2023(
student_id int primary key,
student_name varchar(100),
course varchar(50)
);

INSERT INTO students_2023(student_id, student_name, course)
VALUES(1, 'Aarav Sharma', 'Computer Science'),
(2, 'Ishita Verma', 'Mechanical Engineering'),
(3, 'Kabir Patel', 'Electronics'),
(4, 'Ananya Desai', 'Civil Engineering'),
(5, 'Rahul Gupta', 'Computer Science');


SELECT * FROM students_2023;


create table student_2024(
student_id int primary key,
student_name varchar(100),
course varchar(50)
);

INSERT INTO student_2024(student_id, student_name, course)
VALUES(3, 'Kabir Patel', 'Electronics'),   -- Same as students_2023
(4, 'Ananya Desai', 'Civil Engineering'), -- Same as students_2023
(6, 'Meera Rao', 'Computer Science'),
(7, 'Vikram Singh', 'Mathematics'),
(8, 'Sanya Kapoor', 'Physics');

SELECT * FROM student_2024;


-- UNION -- Combines results, removes duplicates
Select student_id, student_name, course
from students_2023
UNION
Select student_id, student_name, course
from student_2024;


-- UNION ALL - Combines results, keeps duplicates
Select student_id, student_name, course
from students_2023
UNION ALL
Select student_id, student_name, course
from student_2024;


-- INTERSECT - Returns common results in both tables
SELECT s1.student_id, s1.student_name, s1.course
FROM students_2023 s1
INNER JOIN student_2024 s2
ON s1.student_id = s2.student_id
AND s1.student_name = s2.student_name
AND s1.course = s2.course;


-- EXCEPT  -- Returns results in the first table but not in the second
Select student_id, student_name, course
from students_2023
Where (student_id, student_name, course)
Not in (select student_id, student_name, course
from student_2024);

-- Agar tum sirf student_id pe comparison karna chahte ho (aur baaki columns ignore karna chahte ho):
Select student_id, student_name, course
from students_2023
where student_id not in(select student_id from student_2024);




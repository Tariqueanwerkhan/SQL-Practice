CREATE DATABASE startersql;
use startersql;

Create table users (
id INT auto_increment primary key,
name varchar(100) not null,
email varchar(100) unique not null,
gender enum('male', 'female', 'others'),
date_of_birth date,
created_at timestamp default current_timestamp
);


INSERT INTO users (name, email, gender, date_of_birth, created_at) VALUES
('Bob', 'bob@example.com', 'Male', '1990-11-23', DEFAULT),
('Charlie', 'charlie@example.com', 'Others', '1988-02-17', DEFAULT),
('Eva', 'eva@example.com', 'Female', '1993-12-30', DEFAULT),
('Tarique', 'Tarique@example.com', 'Male', '2000-07-18', DEFAULT),
('Rafia', 'Rafia@example.com', 'Female', '2003-01-20', DEFAULT),
('Elric', 'Elric@example.com', 'Male', '1992-02-27', DEFAULT),
('Mehta', 'Mehta@example.com', 'Male', '1995-07-21', DEFAULT);

truncate table users;
select name, gender, date_of_birth from users;
select * from users where gender = 'male';

select * from users where date_of_birth > '2000-01-01';
select * from users where id > 10;
select * from users where id between 11 and 12;
select * from users where date_of_birth is not null;
select * from users where date_of_birth between '1999-01-01' and '2004-01-01';
select * from users where gender in('male', 'others');
select * from users where name like 'A%';
select * from users where name like '%que%';
select * from users where gender = 'female' and date_of_birth > '1995-01-01';
select * from users where gender = 'male' or gender = 'others';
select * from users limit 5 offset 2;
select * from users limit 3, 2;
select * from users order by date_of_birth desc;
select * from users order by name asc;
select * from users order by created_at asc limit 6;

update users set name = 'Rajesh' where id = 9; 
update users set name = 'eva' where id = 10;

update users set name = 'Robert', email = 'Robert@example.com' where id = 9;
Select * from users;

Rename TABLE users to customers;

Rename Table customers to Users;

ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

ALTER TABLE users DROP COLUMN is_active;

ALTER TABLE users MODIFY COLUMN name VARCHAR(150);

ALTER TABLE users MODIFY COLUMN email VARCHAR(100) AFTER name;

# ALTER TABLE users MODIFY COLUMN gender enum('male', 'female', 'others') after name;
#---------------------------------------------------------------------------------------------------------------------------------------- 


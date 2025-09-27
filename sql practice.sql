CREATE TABLE Customers02 (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO Customers02 (customer_name, city) VALUES
('  Rohit Sharma  ', 'Delhi'),
('Anjali Mehta', 'Mumbai'),
('Vikram Singh', NULL),
('  sara khan', 'Delhi'),
('Karan Gupta', 'Kolkata');

-- Customer names ko clean karo
select customer_id, upper(trim(customer_name)) as clean_name
from customers02;

select customer_id, trim(customer_name) as cleaned_name, upper(city) as city_upper
from customers02;

-- Customer name ka first 5 letters dikhana
select customer_name, substring(customer_name, 1, 5) as short_name
from customers02;

-- Customer name + city ko ek column me merge karo 
select customer_name, city,
concat(customer_name, ' - ', city) as full_info
from customers02;


select customer_name, coalesce(city, 'unknown') as fixed_city
from customers02;


select city, count(*) as total_customer
from customers02
group by city
having total_customer > 1;


select * from customers02;


CREATE TABLE Sales02 (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_name VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers02(customer_id)
);

INSERT INTO Sales02 (customer_id, product_name, amount, sale_date) VALUES
(1, 'Laptop', 55000, '2023-01-15'),
(2, 'Mobile', 20000, '2023-02-20'),
(1, 'Tablet', 15000, '2023-03-05'),
(4, 'Headphones', NULL, '2023-04-10'),
(3, 'Monitor', 18000, '2023-05-22'),
(5, 'Keyboard', 3000, '2023-06-30'),
(1, 'Charger', NULL, '2023-07-15');

-- Har sale ke liye sale_date aur aaj ke date ke beech difference nikaalo
select product_name, datediff(curdate(), sale_date) as day_since_sale
from sales02;

-- Sale date me 30 din add karo
select product_name, date_add(sale_date, interval 30 day) as new_date
from sales02; 

-- Sale date se month extract karo
select product_name, extract(Month from sale_date) as sale_month
from sales02;


select product_name, ifnull(amount, 0) as fixed_amount
from sales02; 

-- average amount
select avg(ifnull(amount, 0)) as avg_amount
from sales02;

select customer_id, sum(amount) as total_spent
from sales02
group by customer_id
having total_spent > 20000;


select customer_id, amount,
row_number() over(order by amount desc) as row_num,               -- give unique number to every row  
rank() over(order by amount desc) as rnk,                          -- give the same rank for ties and skip the next rank
dense_rank() over(order by amount desc) as dense_rnk               -- give the same rank for ties but don't skip the new rank.
from sales02;


SELECT
  customer_id,
  product_name,
  amount,
  SUM(amount) OVER (
    PARTITION BY customer_id
    ORDER BY product_name
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total
FROM sales02;


select * from sales02;



-- joinssssssssss
-- show total speanding of every customer 
-- aggregate function + group by
select c.customer_name, trim(customer_name) as final_name_list, sum(ifnull(s.amount, 0)) as total_amount
from customers02 c
left join sales02 s 
on c.customer_id = s.customer_id
group by c.customer_name;


-- HAVING Clause
-- show customers whose total spending > 30000.
select c.customer_name, sum(ifnull(s.amount, 0)) as total_amount
from customers02 c
left join sales02 s 
on c.customer_id = s.customer_id
group by c.customer_name
having total_amount >= 30000;




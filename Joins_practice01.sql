CREATE TABLE Customers01 (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO Customers01 (customer_name, city) VALUES
('Rohit Sharma', 'Delhi'),
('Anjali Mehta', 'Mumbai'),
('Vikram Singh', 'Bangalore'),
('Sara Khan', 'Delhi'),
('Karan Gupta', 'Kolkata');

select * from customers01;

CREATE TABLE Orders01 (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_name VARCHAR(50),
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers01(customer_id)
);

INSERT INTO Orders01 (customer_id, product_name, amount) VALUES
(1, 'Laptop', 55000),
(2, 'Mobile', 20000),
(1, 'Tablet', 15000),
(4, 'Headphones', 3000);

select * from orders01;

-- Show all customers with their orders
select c.customer_id, c.customer_name, o.product_name
from customers01 c
inner join orders01 o on 
c.customer_id = o.customer_id; 


-- Show all customers, even if they have not placed any order (LEFT JOIN).
Select c.customer_id , c.customer_name, o.product_name
from customers01 c 
left join orders01 o 
on c.customer_id = o.customer_id;

-- Show all orders with customer details (RIGHT JOIN).
select c.customer_id, c.customer_name, o.order_id, o.product_name
from customers01 c 
right join orders01 o 
on c.customer_id = o.customer_id;

-- Find customers who haven’t placed any order.
select c.customer_id, c.customer_name, o.product_name, o.amount
from customers01 c 
left join orders01 o 
on c.customer_id = o.customer_id
where o.order_id is null;

-- Get total spending by each customer (JOIN + GROUP BY).
select c.customer_id, c.customer_name, sum(o.amount) as total_spending
from customers01 c 
inner join orders01 o 
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;



-- List customers from “Delhi” with their orders.
select c.customer_id, c.customer_name, c.city, o.product_name, o.amount
from customers01 c 
inner join orders01 o 
on c.customer_id = o.customer_id
where c.city = 'Delhi';

-- Show the most expensive order with customer name.
select c.customer_id, c.customer_name, o.product_name, o.amount
from customers01 c 
inner join orders01 o
on c.customer_id = o.customer_id
where o.amount = (select max(amount) from orders01);

-- group by + limit
select c.customer_id, c.customer_name, o.product_name, o.amount
from customers01 c 
inner join orders01 o
on c.customer_id = o.customer_id
order by o.amount desc
limit 1;

-- Show all customer names and all product names (CROSS JOIN).
select c.customer_name, o.product_name
from customers01 c 
cross join orders01 o;
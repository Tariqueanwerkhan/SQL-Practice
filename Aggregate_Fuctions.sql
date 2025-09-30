CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10, 2),
    quantity INT,
    added_date DATE,
    discount_rate NUMERIC(5, 2)
);

INSERT INTO products(product_name, category, price, quantity, added_date, discount_rate)
VALUES('Laptop', 'Electronics', 75000.50, 10, '2024-01-15', 10.00),
('Smartphone', 'Electronics', 45000.99, 25, '2024-02-20', 5.00),
('Headphones', 'Accessories', 1500.75, 50, '2024-03-05', 15.00),
('Office Chair', 'Furniture', 5500.00, 20, '2023-12-01', 20.00),
('Desk', 'Furniture', 8000.00, 15, '2023-11-20', 12.00),
('Monitor', 'Electronics', 12000.00, 8, '2024-01-10', 8.00),
('Printer', 'Electronics', 9500.50, 5, '2024-02-01', 7.50),
('Mouse', 'Accessories', 750.00, 40, '2024-03-18', 10.00),
('Keyboard', 'Accessories', 1250.00, 35, '2024-03-18', 10.00),
('Tablet', 'Electronics', 30000.00, 12, '2024-02-28', 5.00);


-- Total Quantity Available of all products
Select sum(quantity) as total_quantity
from products;

select sum(quantity) as total_quantity_ele
from products
where category = 'Electronics' and price > 20000;


-- Total number of products
select count(*) as total_product
from product;

-- Total number of category
select count(category) as total_category
from products;

-- count with condition
select count(*) as total_products
from products
where category like '%Electronics%';

-- average price of products
select avg(price) as average_price
from products;

-- average price with condition
select avg(price) as average_price
from products
where category = 'Accessories' and added_date > '2024-02-01';


-- Maximum and Minimum price
select max(price) as max_price, min(price) as min_price
from products;


Select * from products;




------------------------------------ String function in sql --------------------------------------

-- Get all the categories in Uppercase
select upper(category) as category_capital
from products;

-- Get all the categories in Lowercase
Select lower(category) as category_lower
from products;


-- Join Product_name and category text with hypen.
select concat(product_name,'_',category) as product_details
from products;

-- Extract the first 5 characters from product_name
select substring(product_name,1,5) as short_name
from products;

-- Count length
Select product_name, length(product_name) as count_of_char
from products;

-- Remove leading and trailing spaces from string
select length(trim('  Monitor    ')) as trimmed_text;          -- 7
select length('  Monitor    ') as trimmed_text;                -- 13

-- Replace the word "phone" with "device" in product names
select replace(product_name, 'phone','device') as updated
from products;

-- Get the first 3 characters from category
select left(category, 3) as category_capital
from products;

select right(category, 3) as category_capital
from products;


Select * from products;




--------------------------------------------- Date and Time Function in sql ---------------------------------------------

-- 1. NOW() – Get Current Date and Time
Select Now() as current_datetime;

-- 2. CURRENT_DATE() – Get Current Date
Select current_date as today_date;

select Added_date, Current_date, (Current_date- Added_date) as Days_difference
from products;

-- 3. EXTRACT() – Extract Parts of a Date
-- Extract the year, month, and day from the added_date column.
select product_name,
Extract(Year from added_date) as Year_Added,
EXTRACT(Month from added_date) as Month_Added,
EXTRACT(DAY from added_date) as Day_Added
From products;


-- 5. DATEDIFF() Calculate Age Between Dates
-- Calculate the time difference between added_date and today’s date.
SELECT product_name,
       DATEDIFF(CURRENT_DATE, added_date) AS days_since_added
FROM products;

-- SELECT product_name,
--        DATEDIFF(CURDATE(), added_date) AS Age_in_days
-- FROM products;

SELECT product_name,
       TIMESTAMPDIFF(YEAR, added_date, CURDATE()) AS Age_in_years,
       TIMESTAMPDIFF(MONTH, added_date, CURDATE()) as Age_in_months,
       TIMESTAMPDIFF(DAY, added_date, CURDATE()) As Age_in_days
from products;


-- 5. DATE_FORMAT() – Format Dates as Strings
-- Format added_date in a custom format (DD-Mon-YYYY).
Select product_name,
date_format(added_date, '%d-%b-%Y') as formated_date
from products;

-- 6. Extract – Get Specific Date Part
-- Extract the day of the week from added_date.
Select Product_name, added_date,
extract(Month from added_date) as Month_number
from products;

-- Extract the day of the week from added_date.
Select product_name, added_date,
dayofweek(added_date) as day_of_week
from products;


-- 7. DATE_FORMAT()
-- Truncate added_date to the start of the month.
SELECT product_name, added_date,
       DATE_FORMAT(added_date, '%Y-%m-%d') AS day_start,
       STR_TO_DATE(CONCAT(YEARWEEK(added_date, 3), ' Monday'), '%X%V %W') AS week_start,
       DAYOFWEEK(added_date) AS day_of_week
FROM products;


-- 8. Date_add() - Add or Subtract Time Intervals
-- Add 6 months to the added_date.
select product_name, added_date,
Date_add(added_date, Interval 6 month) as new_date
from products;

-- Sub 6 months to the added_date.
Select product_name, added_date,
date_sub(added_date, Interval 6 month) as new_date
from products;


-- 9. CURRENT_TIME() – Get Current Time
-- Retrieve only the current time.

select CURRENT_TIME() AS "current_time";
select CURRENT_TIME();



-- 10. TO_DATE() – Convert String to Date
-- Convert a string to a date format.
select str_to_date('2024-03-12', '%Y-%m-%d') as converted_date;



----------------------------------------- Assignment on case functions in sql --------------------------------------------



/* 1. CASE Function – Categorizing Based on Conditions
 We will categorize products into price ranges:

Expensive if the price is greater than or equal to 50,000.
Moderate if the price is between 10,000 and 49,999.
Affordable if the price is less than 10,000.
*/
select product_name, price,
case
when price >= 50000 then 'Expensive'
when price >= 10000 and price <= 49999 then 'Moderate'
else 'Afordable' end as price_category
from products;


/* 2. CASE with AND & OR Operators – Stock Status
We will classify products based on quantity available:

In Stock if quantity is 10 or more.
Limited Stock if quantity is between 5 and 9.
Out of Stock Soon if quantity is less than 5.
*/
select product_name, quantity,
case
when quantity >= 10 then 'In stock'
when quantity between 6 and 9 then 'Limiteed stock'
else 'out of stock soon' end as stock_status
from products;



/* 3. CASE with LIKE Operator – Category Classification
Check if the category name contains "Electronics" or "Furniture" using LIKE.
*/
select product_name, category,
case
when category like 'Electronics%' then 'Electronics Items'
when category like 'Furniture%' then 'Furniture_Item'
else 'Accessories Items' end as category_Status
from products;


----------------------------------- sql COALESCE function -----------------------------------

ALTER TABLE products 
ADD COLUMN discount_price NUMERIC(10,2);
ALTER TABLE products 
drop COLUMN discount_price;

SET SQL_SAFE_UPDATES = 0;

UPDATE products
SET discount_price = NULL
WHERE product_name IN('Laptop','Desk');



UPDATE products
SET discount_price = price*0.9
WHERE product_name NOT IN('Laptop','Desk');

SELECT product_name, price, discount_price 
FROM products;

SELECT product_name, 
		COALESCE(discount_price, price) AS Final_price
FROM products;

select * from products;



-------------------------------------------- Windows function in sql ----------------------------------------------

-- Assign a unique row number to each product within the same category.

select product_name, category, price,
row_number() over(partition by category order by price desc) as ranking
from products;

select product_name, category, price,
dense_rank() over(partition by category order by price desc) as ranking
from products;

select product_name, category, price,
rank() over(partition by category order by price desc) as ranking
from products;


select product_name, category, price,
sum(price) over(partition by category order by price desc) as running_total
from products;

select * from products;




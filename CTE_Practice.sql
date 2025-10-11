create table orders_cte (
    order_id int,
    customer_name varchar(50),
    product_name varchar(50),
    category varchar(50),
    quantity int,
    price_per_unit decimal(10,2),
    order_date date,
    region varchar(50)
);

insert into orders_cte values
(1, 'Amit', 'Laptop', 'Electronics', 1, 55000, '2025-01-05', 'North'),
(2, 'Rohit', 'Headphones', 'Electronics', 2, 2500, '2025-01-12', 'South'),
(3, 'Sneha', 'Table', 'Furniture', 1, 8000, '2025-01-15', 'East'),
(4, 'Priya', 'Chair', 'Furniture', 4, 2000, '2025-02-01', 'West'),
(5, 'Raj', 'Shoes', 'Fashion', 2, 3000, '2025-02-10', 'North'),
(6, 'Meena', 'T-shirt', 'Fashion', 5, 1200, '2025-02-18', 'South'),
(7, 'Karan', 'Mobile', 'Electronics', 1, 30000, '2025-03-02', 'East'),
(8, 'Pooja', 'Sofa', 'Furniture', 1, 20000, '2025-03-05', 'North'),
(9, 'Vikas', 'Watch', 'Fashion', 3, 5000, '2025-03-15', 'West'),
(10, 'Neha', 'Tablet', 'Electronics', 1, 20000, '2025-03-20', 'South'),
(11, 'Alok', 'Jacket', 'Fashion', 2, 4000, '2025-04-02', 'East'),
(12, 'Nidhi', 'Dining Table', 'Furniture', 1, 25000, '2025-04-07', 'North'),
(13, 'Deepak', 'Shoes', 'Fashion', 1, 3500, '2025-04-15', 'West'),
(14, 'Komal', 'Mobile', 'Electronics', 2, 28000, '2025-04-20', 'South'),
(15, 'Shivam', 'Bed', 'Furniture', 1, 30000, '2025-04-25', 'East');

select * from orders_cte;

-- Find total sales amount per region.
with total_sales as(
	select region, sum(quantity*price_per_unit) as total_sales_amount
	from orders_cte
	group by region
)
select * from total_sales;


-- Find average sales per category.
with avg_sales as(
	select category, avg(quantity*price_per_unit) as avg_sales_amount
	from orders_cte
	group by category

)
select * from avg_sales


-- List orders above the overall average sales.
with overall_sales as(
	select avg(quantity*price_per_unit) as avg_sales_amount
	from orders_cte
)
select o.*, (o.quantity*o.price_per_unit) as total_sales_amount
	from orders_cte o
	join overall_sales os
	on (o.quantity*o.price_per_unit) > os.avg_sales_amount;


-- Find highest order amount in each region.
with highest_sales as(
	select region, max(quantity*price_per_unit) as max_sales_amount
	from orders_cte
	group by region
)
select o.*, (o.quantity * o.price_per_unit) as highest_sales_amount
from orders_cte o
join highest_sales h
on o.region = h.region
where (o.quantity * o.price_per_unit) = h.max_sales_amount;


-- Find second highest order per category.
with category_rank as(
	select product_name, category, quantity, price_per_unit, region,
	dense_rank() over(partition by category order by (quantity*price_per_unit) desc) as rnk
	from orders_cte
)
select product_name, category, quantity, price_per_unit, region
from category_rank
where rnk = 2;


-- Get monthly sales totals.
with monthly_sales as(
	select extract(month from order_date) as month,
	sum(quantity*price_per_unit) as total_sales
	from orders_cte
	group by extract(month from order_date)
)
select * from monthly_sales;


-- Count of orders per customer.
with customer_count as(
	select customer_name , count(*) as orders_count
	from orders_cte
	group by customer_name
)
select * from customer_count;

-- Show each customer’s total spend.
with total_spend as(
	select customer_name, sum(quantity*price_per_unit) as total_spend
	from orders_cte
	group by customer_name
)
select * from total_spend;


-- Find customers who spent more than overall average spend.
with customer_spend as (
    select customer_name, sum(quantity*price_per_unit) as total_spend
    from orders_cte
    group by customer_name
),
overall_average as (
    select avg(total_spend) as overall_avg_spent
    from customer_spend
)
select cs.customer_name, cs.total_spend
from customer_spend cs
join overall_average oa
on cs.total_spend > oa.overall_avg_spent;


-- Show sales difference of each order compared to category average.
with category_avg as (
    select category, avg(quantity*price_per_unit) as avg_sales
    from orders_cte
    group by category
)
select o.order_id, o.customer_name, o.product_name, o.category,
       (o.quantity*o.price_per_unit) as order_sales,
       ((o.quantity*o.price_per_unit) - c.avg_sales) as diff_from_avg
from orders_cte o
join category_avg c
on o.category = c.category;


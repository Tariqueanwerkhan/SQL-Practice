CREATE TABLE sales (
    store_id INT,
    store_name VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    cost INT
);

INSERT INTO sales (store_id, store_name, product, quantity, cost) VALUES
(1, 'Apple Originals 1', 'iPhone 12 Pro', 1, 1600),
(1, 'Apple Originals 1', 'MacBook pro 13', 3, 2000),
(1, 'Apple Originals 1', 'AirPods Pro', 2, 280),
(2, 'Apple Originals 2', 'iPhone 12 Pro', 2, 1000),
(3, 'Apple Originals 3', 'iPhone 12 Pro', 1, 2000),
(3, 'Apple Originals 3', 'MacBook pro 13', 1, 1000),
(3, 'Apple Originals 3', 'MacBook Air', 4, 1100),
(3, 'Apple Originals 3', 'iPhone 12', 2, 1200),
(3, 'Apple Originals 3', 'AirPods Pro', 3, 300),
(4, 'Apple Originals 4', 'iPhone 12 Pro', 2, 1000),
(4, 'Apple Originals 4', 'MacBook pro 13', 1, 2500);

select * from sales;

-- find store who's sales were better than the average sales across all the stores
-- 1 Total sales per each store
select store_id, sum(cost) as total_sales_per_store
from sales
group by store_id;

-- 2 Find the average sales with respect all the stores. 
select cast(avg(total_sales_per_store) as int) as avg_sales_for_all_store
from(
	select store_id, sum(cost) as total_sales_per_store
	from sales
	group by store_id
) x;

-- 3 Find the stores where total sales > Avg_sales of all store.
with total_sales as(
			select store_id, sum(cost) as total_sales_per_store
			from sales
			group by store_id),
	avg_sales as(
			select cast(avg(total_sales_per_store) as int) as avg_sales_for_all_store
			from total_Sales)
select *
from total_sales
join avg_sales
on total_sales.total_sales_per_store > avg_sales.avg_sales_for_all_store;


















''' select *
from (
		select store_id, sum(cost) as total_sales_per_store
		from sales
		group by store_id) as total_sales
join (
		select cast(avg(total_sales_per_store) as int) as avg_sales_for_all_store
		from(
			select store_id, sum(cost) as total_sales_per_store
			from sales
			group by store_id) x) as avg_Sales
		on total_sales.total_sales_per_store > avg_sales.avg_sales_for_all_store; '''



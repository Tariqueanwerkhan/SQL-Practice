CREATE TABLE Students_data (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course VARCHAR(30),
    marks INT,
    gender CHAR(1),
    city VARCHAR(50)
);


INSERT INTO Students_data (student_id, student_name, course, marks, gender, city) VALUES
(1, 'Ayesha', 'Math', 95, 'F', 'Delhi'),
(2, 'Rohan', 'Science', 72, 'M', 'Mumbai'),
(3, 'Priya', 'English', 60, 'F', 'Pune'),
(4, 'Arjun', 'History', 30, 'M', 'Delhi'),
(5, 'Neha', 'Math', 82, 'F', 'Kolkata'),
(6, 'Aman', 'Science', 55, 'M', 'Lucknow'),
(7, 'Simran', 'English', 40, 'F', 'Jaipur'),
(8, 'Karan', 'Math', 20, 'M', 'Delhi'),
(9, 'Fatima', 'History', 75, 'F', 'Patna'),
(10, 'Ravi', 'Science', 90, 'M', 'Mumbai'),
(11, 'Pooja', 'English', 67, 'F', 'Chennai'),
(12, 'Sameer', 'Math', 48, 'M', 'Bangalore'),
(13, 'Kavya', 'Science', 85, 'F', 'Hyderabad'),
(14, 'Dev', 'History', 33, 'M', 'Pune'),
(15, 'Anjali', 'Math', 70, 'F', 'Delhi'),
(16, 'Sahil', 'English', 95, 'M', 'Lucknow'),
(17, 'Meera', 'Science', 25, 'F', 'Jaipur'),
(18, 'Rohit', 'History', 60, 'M', 'Kolkata'),
(19, 'Shruti', 'Math', 77, 'F', 'Mumbai'),
(20, 'Imran', 'Science', 88, 'M', 'Delhi'),
(21, 'Alia', 'English', 54, 'F', 'Pune'),
(22, 'Vikram', 'History', 42, 'M', 'Chennai');

-- Show each student’s name, marks, and whether they are Pass (>=40) or Fail (<40).
select student_name, marks,
	case
		when marks >= 40 then 'Pass'
        else 'Fail'
	end as result
FROM students_data;

-- Grading System Assign grades: A+ → marks >= 90 A → 75–89 B → 60–74 C → 40–59 Fail → below 40
select student_name, marks, 
	case
		when marks >= 90 then 'A+'
        when marks >= 75 then 'A'
        when marks >= 60 then 'B'
        when marks >= 40 then 'C'
        else 'Fail'
	end as grade
From students_data;

-- (Gender Label) Show student_name and a column gender_full with values: "Male" for M and "Female" for F.
select student_name, gender,
	case
		when gender = 'M' then 'Male'
        when gender = 'F' then 'Female'
        else 'others'
	end as gender_full
From students_data;

-- (Course Category) Show student_name and a column course_type where "STEM" = (Math, Science), "Arts" = (English, History).
select student_name, course, 
	case
		when course in ('Math', 'Science') then 'STEM'
        else 'Arts'
	end as course_category
from students_data;



-- (Performance Category) Classify students as: "Topper" (>=85), "Average" (40–84), "Weak" (<40).
select student_name, marks,
	case
		when marks >= 85 then 'Topper'
        when marks >= 40 then 'Average'
        else 'Weak'
	end as performance_category
from students_data;


-- City Region Classify cities: 
-- "North" (Delhi, Lucknow, Jaipur), 
-- "South" (Chennai, Bangalore, Hyderabad), 
-- "East" (Patna, Kolkata),
--  "West" (Mumbai, Pune), 
-- "Other". 
select student_name, city,
	case
		when city in ('Delhi', 'Lucknow', 'Jaipur') then 'North'
        when city in ('Chennai', 'Bangalore', 'Hyderabad') then 'South'
        when city in ('Patna', 'Kolkata') then 'East'
        when city in ('Mumbai', 'Pune') then 'West'
        else 'other'
	end as region
From students_data;


-- (Scholarship Eligibility) Students with marks >= 75 get "Eligible", otherwise "Not Eligible". 
select student_name, marks,
	case
		when marks >= 75 then 'Eligible'
        else 'Not Eligible'
	end as scholarship_Eligibility
from students_data;


-- (Result with Bonus) If course = Math and marks >= 80 → "Gold Medal", 
-- else if Science and marks >= 85 → "Silver Medal", else "No Medal". 
select student_name, course, marks,
	case
		when course = 'Math' and marks >= 80 then 'Gold Medal'
        when course = 'Science' and marks >= 85 then 'Silver Medal'
        Else 'No Medal'
	end as Result_With_Bonus
From students_data;
        
	
-- (Custom Message) For each student: "Excellent" if marks >= 90, 
-- "Good" if 70–89, "Needs Improvement" if 40–69, "Fail" otherwise.
select student_name, marks,
	case
		when marks >= 90 then 'Excellent'
        when marks BETWEEN 70 AND 89 then 'Good'
        when marks BETWEEN 40 AND 69 then 'Needs Improvement'
        else 'Fail'
	end as custom_message
from students_data;




select student_name, marks,
	case
		when marks >= 90 then 'Excellent'
        when marks >= 70 then 'Good'
        when marks >= 40 then 'Needs Improvement'
        else 'Fail'
	end as custom_message
from students_data;




-- (Combine Gender + Result)
-- Show student_name, marks, and a column:
-- "Passed Male"
-- "Passed Female"
-- "Failed Male"
-- "Failed Female"
select student_name, marks,
	case
		when marks >= 40 and gender = 'M' then 'Passed Male'
        when marks >= 40 and gender = 'F' then 'Passed Female'
        when marks < 40 and gender = 'M' then 'Failed Male'
        when marks < 40 and gender = 'F' then 'Failed Female'
	end as combine_result
From students_data;

select * from students_data;


------------------------------------------------------------------------------------------------------------------------------



CREATE TABLE products_data (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price INT,
    stock INT,
    rating DECIMAL(2,1),
    seller_city VARCHAR(30)
);


INSERT INTO products_data (product_id, product_name, category, price, stock, rating, seller_city) VALUES
(1, 'Laptop', 'Electronics', 55000, 12, 4.5, 'Delhi'),
(2, 'Smartphone', 'Electronics', 25000, 30, 4.2, 'Mumbai'),
(3, 'Washing Machine', 'Home Appliances', 30000, 8, 4.0, 'Chennai'),
(4, 'Refrigerator', 'Home Appliances', 40000, 5, 4.3, 'Kolkata'),
(5, 'Microwave', 'Home Appliances', 15000, 20, 3.8, 'Bangalore'),
(6, 'Shoes', 'Fashion', 3000, 50, 4.1, 'Pune'),
(7, 'T-Shirt', 'Fashion', 800, 100, 3.9, 'Hyderabad'),
(8, 'Jeans', 'Fashion', 2000, 40, 4.2, 'Lucknow'),
(9, 'Book - SQL Guide', 'Books', 600, 80, 4.7, 'Delhi'),
(10, 'Book - Data Science', 'Books', 900, 60, 4.8, 'Patna'),
(11, 'Headphones', 'Electronics', 2000, 70, 4.0, 'Mumbai'),
(12, 'Television', 'Electronics', 45000, 6, 4.6, 'Chennai'),
(13, 'Sofa', 'Furniture', 25000, 3, 4.4, 'Jaipur'),
(14, 'Bed', 'Furniture', 30000, 4, 4.5, 'Delhi'),
(15, 'Dining Table', 'Furniture', 20000, 2, 4.3, 'Bangalore');


-- (Price Range)
-- Show product_name, price, and classify as:  "Expensive" (>=40000), "Mid-Range" (10000–39999), "Budget" (<10000).
select product_name, price,
	case
		when price >= 40000 then 'Expensive'
        when price between 10000 and 39999 then 'Mid-Range'
        else 'Budget'
	end as Price_Range
from products_data;


-- Stock Status
-- Show product_name, stock, and classify as:  "Out of Stock" (stock = 0), "Low Stock" (1–10), "In Stock" (>10).
select product_name, stock, 
	case
		when stock = 0 then 'out of stock'
        when stock between 1 and 10 then 'Low stock' 
        else 'In stock'
	end as Stock_status
from products_data;


-- Rating Quality
-- Show product_name, rating, and label as:  "Excellent" (>=4.5), "Good" (4.0–4.4), "Average" (3.5–3.9), "Poor" (<3.5).
select product_name, rating,
	case
		when rating >= 4.5 then 'Excellent'
        when rating between 4.0 and 4.4 then 'Good'
        when rating between 3.5 and 3.9 then 'Average'
        else 'Poor'
	end as Rating_Quality
from products_data;


-- Category Type
-- Show product_name, category, and classify as:
-- "Lifestyle" (Fashion, Books, Furniture)
-- "Electronics" (Electronics, Home Appliances).
select product_name, category,
	case
		when category IN ('Fashion','Books','Furniture') then 'Lifestyle'
        when category IN ('Electronics','Home appliances') then 'Electronics'
	end as Category_type
from products_data;


-- Discount Eligibility
-- If price >= 30000 → "10% Discount", If 10000–29999 → "5% Discount", Else "No Discount".
SELECT product_name, price,
	case
		when price >= 30000 then '10% Discount'
        when price between 10000 and 29999 then '5% Discount'
        else 'No Discouunt'
	end as Discount_Eligibility
from products_data;


-- Seller Region
-- Classify seller_city into regions: North (Delhi, Lucknow, Jaipur), South (Chennai, Bangalore, Hyderabad), East (Patna, Kolkata),
-- West (Mumbai, Pune), Other.
select seller_city, 
	case
		when seller_city in ('Delhi','Lucknow','Jaipur') then 'North'
        when seller_city in ('Chennai','Bangalore','Hyderabad') then 'South'
        when seller_city in ('Patna','Kolkata') then 'East'
        when seller_city in ('Mumbai','Pune') then 'West'
        else 'other'
	end as seller_region
from products_data;



-- Popularity Check
-- If stock >= 50 AND rating >= 4.0 → "Hot Seller", Else "Normal".
select product_name, stock, rating,
	case
		when stock >= 50 and rating >= 4.0 then 'Hot Seller'
        else 'Normal'
	end as Popularity_Check
from products_data;


-- Book Pricing
-- For category = "Books": price >= 800 → "Premium Book" else "Regular Book".
select category, price,
	case
		when category = 'Books' and price >= 700 then 'Premium Book'
        when category = 'Books' and price < 700 then 'Regular Book'
        else 'Not a Book'
	end as Book_Pricing
from products_data;



-- Furniture Size Category
-- For category = "Furniture": price >= 30000 → "Large Furniture", price 15000–29999 → "Medium Furniture", else "Small Furniture".
select product_name, category, price,
	case
		when category = 'Furniture' and price >= 30000 then 'Large Furniture'
        when category = 'Furniture' and price between 15000 and 29999 then 'Medium Furniture' 
        when category != 'Furniture' then 'This is not Furniture'
        else 'Small Furniture'
	end as Furniture_size_category
from products_data;


-- Overall Product Label
-- Combine price + rating:
-- If price >= 40000 AND rating >= 4.5 → "Luxury Top Rated"
-- If price >= 40000 AND rating < 4.5 → "Luxury Standard"
-- If price < 40000 AND rating >= 4.0 → "Affordable Quality"
-- Else "Affordable Basic".
select product_name, price, rating,
	case
		when price >= 40000 and rating >= 4.5 then 'Luxury Top Rated'
        when price >= 40000 and rating < 4.5 then 'Luxury Standard'
        when price < 40000 and rating >= 4.0 then 'Affordable Quality'
        else 'Affordable Basic'
	end as Overall_Product_Label
from products_data;


select * from products_data;
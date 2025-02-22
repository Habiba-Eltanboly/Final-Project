-- Select the Database
USE temp1;

-- view data
SELECT TOP 10*
FROM [Superstore Sales Dataset];

-- check for duplicates
SELECT COUNT(*)-COUNT(DISTINCT Row_ID) AS no_of_duplicates 
FROM [Superstore Sales Dataset];

-- check for nulls
SELECT COUNT(*) AS no_of_nulls
FROM [Superstore Sales Dataset]
WHERE Row_ID IS NULL OR Row_ID = '' OR Order_ID IS NULL OR Order_ID = '' OR Order_Date IS NULL OR Order_Date = ''
      OR Ship_Date IS NULL OR Ship_Date = '' OR Ship_Mode IS NULL OR Ship_Mode = '' OR Customer_ID IS NULL OR Customer_ID = ''
	  OR Customer_Name IS NULL OR Customer_Name = '' OR Segment IS NULL OR Segment = '' OR Country IS NULL OR Country = ''
	  OR City IS NULL OR City = '' OR [State] IS NULL OR [State] = '' OR Postal_Code IS NULL OR Postal_Code = ''
	  OR Region IS NULL OR Region = '' OR Product_ID IS NULL OR Product_ID = '' OR Category IS NULL OR Category = ''
	  OR Sub_Category IS NULL OR Sub_Category = '' OR Product_Name IS NULL OR Product_Name = '' OR Sales IS NULL OR Sales = ''

-- delete the 11 null rows
DELETE FROM [Superstore Sales Dataset]
WHERE Row_ID IS NULL OR Row_ID = '' OR Order_ID IS NULL OR Order_ID = '' OR Order_Date IS NULL OR Order_Date = ''
      OR Ship_Date IS NULL OR Ship_Date = '' OR Ship_Mode IS NULL OR Ship_Mode = '' OR Customer_ID IS NULL OR Customer_ID = ''
	  OR Customer_Name IS NULL OR Customer_Name = '' OR Segment IS NULL OR Segment = '' OR Country IS NULL OR Country = ''
	  OR City IS NULL OR City = '' OR [State] IS NULL OR [State] = '' OR Postal_Code IS NULL OR Postal_Code = ''
	  OR Region IS NULL OR Region = '' OR Product_ID IS NULL OR Product_ID = '' OR Category IS NULL OR Category = ''
	  OR Sub_Category IS NULL OR Sub_Category = '' OR Product_Name IS NULL OR Product_Name = '' OR Sales IS NULL OR Sales = '';
 ----some analytical questions about the data superstore sales dataset
	 --1-what is the total sales in the store ?
	 select sum(sales)as total_sales
	 from [Superstore Sales Dataset]

	 --2-how many unique orders are in the dataset ?
	 select count(distinct order_ID)as unique_orders
	 from [Superstore Sales Dataset]

	 --3-which category has the highest sales ?
	 select category,sum(sales)as total_sales
	 from [Superstore Sales Dataset]
	 group by Category
	 order by total_sales desc
	 
	 --4-which customer has the highest total purchases ?
	 select customer_name,sum(sales)as total_sales
	 from [Superstore Sales Dataset]
	 group by customer_name 
	 order by total_sales desc

	 ---5-which city has the highest number of orders ?
	 select city, count (order_id)as order_count
	 from [Superstore Sales Dataset]
	 group by city 
	 order by order_count desc

	 --6-what are the most commonly used shipping modes?
	select ship_mode,count (order_id) as order_count 
	from [Superstore Sales Dataset]
	group by Ship_Mode
	order by order_count desc

	--7-what are the top selling products ?
	select product_name,sum(sales)as total_sales
	from [Superstore Sales Dataset]
	group by Product_Name
	order by total_sales desc

	--8-are there any customers who placed more than 10 orders ?
	select customer_name,count(order_id)as order_count
	from [Superstore Sales Dataset]
	group by Customer_Name
	having count(order_id)>10
	order by order_count desc
	  

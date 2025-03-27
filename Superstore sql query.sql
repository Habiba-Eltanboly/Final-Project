-- Select the Database
USE Store_Sales_DB;

-- view data
SELECT TOP 10*
FROM [Superstore Sales Dataset Edited by SQL];

-- check for duplicates
SELECT COUNT(*)-COUNT(DISTINCT Row_ID) AS no_of_duplicates 
FROM [Superstore Sales Dataset Edited by SQL];

-- check for nulls
SELECT COUNT(*) AS no_of_nulls
FROM [Superstore Sales Dataset Edited by SQL]
WHERE Row_ID IS NULL OR Row_ID = '' OR Order_ID IS NULL OR Order_ID = '' OR Order_Date IS NULL OR Order_Date = ''
      OR Ship_Date IS NULL OR Ship_Date = '' OR Ship_Mode IS NULL OR Ship_Mode = '' OR Customer_ID IS NULL OR Customer_ID = ''
	  OR Customer_Name IS NULL OR Customer_Name = '' OR Segment IS NULL OR Segment = '' OR Country IS NULL OR Country = ''
	  OR City IS NULL OR City = '' OR [State] IS NULL OR [State] = '' OR Postal_Code IS NULL OR Postal_Code = ''
	  OR Region IS NULL OR Region = '' OR Product_ID IS NULL OR Product_ID = '' OR Category IS NULL OR Category = ''
	  OR Sub_Category IS NULL OR Sub_Category = '' OR Product_Name IS NULL OR Product_Name = '' OR Sales IS NULL OR Sales = ''

-- There are 11 rows null, so it can be ignored or deleted

-- delete the 11 null rows
DELETE FROM [Superstore Sales Dataset Edited by SQL]
WHERE Row_ID IS NULL OR Row_ID = '' OR Order_ID IS NULL OR Order_ID = '' OR Order_Date IS NULL OR Order_Date = ''
      OR Ship_Date IS NULL OR Ship_Date = '' OR Ship_Mode IS NULL OR Ship_Mode = '' OR Customer_ID IS NULL OR Customer_ID = ''
	  OR Customer_Name IS NULL OR Customer_Name = '' OR Segment IS NULL OR Segment = '' OR Country IS NULL OR Country = ''
	  OR City IS NULL OR City = '' OR [State] IS NULL OR [State] = '' OR Postal_Code IS NULL OR Postal_Code = ''
	  OR Region IS NULL OR Region = '' OR Product_ID IS NULL OR Product_ID = '' OR Category IS NULL OR Category = ''
	  OR Sub_Category IS NULL OR Sub_Category = '' OR Product_Name IS NULL OR Product_Name = '' OR Sales IS NULL OR Sales = '';


--1-what is the total sales in the store?
SELECT SUM(sales)AS total_sales
FROM [Superstore Sales Dataset Edited by SQL]

-- Total sales by year
SELECT YEAR([Order_Date]) AS Year,ROUND(SUM([Sales]), 2) AS TotalSales
FROM [Superstore Sales Dataset Edited by SQL]
GROUP BY YEAR([Order_Date])
ORDER BY Year;

-- Monthly sales trend
SELECT YEAR([Order_Date]) AS Year,MONTH([Order_Date]) AS Month,ROUND(SUM([Sales]), 2) AS MonthlySales
FROM [Superstore Sales Dataset Edited by SQL]
GROUP BY YEAR([Order_Date]), MONTH([Order_Date])
ORDER BY Year, Month;


--2-which region has the highest sales?
-- Sales by region
SELECT [Region],ROUND(SUM([Sales]), 2) AS TotalSales
FROM [Superstore Sales Dataset Edited by SQL]
GROUP BY [Region]
ORDER BY TotalSales DESC;


--3-which city has the highest number of orders?
SELECT City, COUNT(Order_ID) AS Order_Count
FROM [Superstore Sales Dataset Edited by SQL]
GROUP BY City 
ORDER BY Order_Count DESC;


--4-which category has the highest sales?
-- Sales by category
SELECT [Category],ROUND(SUM([Sales]), 2) AS TotalSales
FROM [Superstore Sales Dataset Edited by SQL]
GROUP BY [Category]
ORDER BY TotalSales DESC;


--5-what are the top Selling products?
-- Top 10 best-selling products
SELECT TOP 10[Product_Name],ROUND(SUM([Sales]), 2) AS TotalSales,COUNT(*) AS OrderCount
FROM [Superstore Sales Dataset Edited by SQL]
GROUP BY [Product_Name]
ORDER BY TotalSales DESC;


--6-which customer segment has the highest sales?
-- Profit by segment 
SELECT [Segment],ROUND(SUM([Sales]), 2) AS TotalSales
FROM [Superstore Sales Dataset Edited by SQL]
GROUP BY [Segment]
ORDER BY TotalSales DESC;


--7-which shipping mode is most commonly used?
-- Shipping mode distribution
SELECT [Ship_Mode],COUNT(*) AS OrderCount,ROUND(SUM([Sales]), 2) AS TotalSales
FROM [Superstore Sales Dataset Edited by SQL]
GROUP BY [Ship_Mode]
ORDER BY OrderCount DESC;


--8-what is the average time between order date and ship date?
-- Overall avg. processing time (order to ship)
SELECT AVG(DATEDIFF(DAY, [Order_Date], [Ship_Date])) AS AvgDeliveryDays
FROM [Superstore Sales Dataset Edited by SQL];


--9-are there delays in time (order to ship) in certain regions?
-- Avg. delay by region
SELECT [Region],AVG(DATEDIFF(DAY, [Order_Date], [Ship_Date])) AS AvgDeliveryDays
FROM [Superstore Sales Dataset Edited by SQL]
GROUP BY [Region]
ORDER BY AvgDeliveryDays DESC;

--10-how does shipping mode affect delivery time?
-- Avg. delivery time (days) by shipping mode
SELECT [Ship_Mode],AVG(DATEDIFF(DAY, [Order_Date], [Ship_Date])) AS AvgDeliveryDays,COUNT(*) AS OrderCount
FROM [Superstore Sales Dataset Edited by SQL]
GROUP BY [Ship_Mode]
ORDER BY AvgDeliveryDays;


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

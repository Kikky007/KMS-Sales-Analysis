--CASE SCENARIO I-- Question 1: Which product category had the highest sales? --SELECT TOP 1 Product_Category, 
SUM(Sales) AS TotalSales
FROM KMS_data
GROUP BY Product_Category
ORDER BY TotalSales DESC


-- Question 2: What are the Top 3 and Bottom 3 regions in terms of sales? --
-- Top 3 Regions
SELECT TOP 3 Region, 
SUM(Sales) AS TotalSales
FROM dbo.KMS_data
GROUP BY Region
ORDER BY TotalSales DESC;

-- Bottom 3 Regions
SELECT TOP 3 Region, 
SUM(Sales) AS TotalSales
FROM dbo.KMS_data
GROUP BY Region
ORDER BY TotalSales ASC;


--Question 3: What were the total sales of appliances in Ontario?--
SELECT SUM(Sales) AS TotalApplianceSales
FROM dbo.KMS_data
WHERE Product_Sub_Category = 'Appliances' AND Region = 'Ontario';


-- Question 4: Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers--
--Bottom 10 customers by sales 
SELECT TOP 10 Customer_Name, 
SUM(Sales) AS TotalSales
FROM dbo.KMS_data
GROUP BY Customer_Name
ORDER BY TotalSales ASC;

 -- Advice to the Management: Create a survey to understand what customers need and want.
 -- KMS already has a Website, I would advise they add a chat feature to their website to help customers communicate with sales and support agents and establish good relationship with them as this helps to retain customers.


 -- Question 5: KMS incurred the most shipping cost using which shipping method?--
SELECT TOP 1 Ship_Mode, 
SUM(Shipping_Cost) AS TotalShippingCost
FROM dbo.KMS_data
GROUP BY Ship_Mode
ORDER BY TotalShippingCost DESC;


--CASE SCENARIO II

-- Question 6: Who are the most valuable customers, and what products or services do they typically purchase?
-- How valuable a customer is, can be determined by both sales and profit.

-- Top 5 customers by total profit
SELECT TOP 5 Customer_Name, 
SUM(Profit) AS TotalProfit,
SUM (Sales) AS TotalSales
FROM dbo.KMS_data
GROUP BY Customer_Name
ORDER BY TotalProfit DESC;

-- Their most frequent product categories
SELECT Customer_Name, Product_Category, 
COUNT(*) AS PurchaseCount
FROM dbo.KMS_data
WHERE Customer_Name IN (
    SELECT TOP 5 Customer_Name
    FROM dbo.KMS_data
    GROUP BY Customer_Name
    ORDER BY SUM(Profit) DESC
)

-- Top 5 Customer by Total Sales
SELECT TOP 5 Customer_Name, 
SUM(Profit) AS TotalProfit,
SUM (Sales) AS TotalSales
FROM dbo.KMS_data
GROUP BY Customer_Name
ORDER BY TotalSales DESC;

-- Their most frequent product categories
SELECT Customer_Name, Product_Category, 
COUNT(*) AS PurchaseCount
FROM dbo.KMS_data
WHERE Customer_Name IN (
    SELECT TOP 5 Customer_Name
    FROM dbo.KMS_data
    GROUP BY Customer_Name
    ORDER BY SUM(Sales) DESC
)
GROUP BY Customer_Name, Product_Category
ORDER BY Customer_Name,PurchaseCount DESC;


--Question 7: Which small business customer had the highest sales?
SELECT TOP 1 Customer_Name, 
SUM(Sales) AS TotalSales
FROM dbo.KMS_data
WHERE Customer_Segment = 'Small Business'
GROUP BY Customer_Name
ORDER BY TotalSales DESC;


--Question 8: Which Corporate Customer placed the most number of orders in 2009 – 2012?
SELECT TOP 1 Customer_Name, 
COUNT(DISTINCT Order_ID) AS OrderCount
FROM dbo.KMS_data
WHERE Customer_Segment = 'Corporate'
AND Order_Date BETWEEN '1/1/2009' AND '12/31/2012'
GROUP BY Customer_Name
ORDER BY OrderCount DESC;


--Question 9: Which consumer customer was the most profitable one?
SELECT TOP 1 Customer_Name, 
SUM(Profit) AS TotalProfit
FROM dbo.KMS_data
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Name
ORDER BY TotalProfit DESC;


-- Question 10: Which customer returned items, and what segment do they belong to?
SELECT DISTINCT 
    K.Customer_Name, 
    K.Customer_Segment
FROM dbo.KMS_data AS K
JOIN dbo.Orderstatus AS O
    ON K.Order_ID = O.Order_ID
WHERE O.Status = 'Returned';


-- Question 11:If the delivery truck is the most economical but the slowest shipping method and
-- Express Air is the fastest but the most expensive one, do you think the company
-- appropriately spent shipping costs based on the Order Priority? Explain your answerSELECT Order_Priority, Ship_Mode, 
COUNT(*) AS OrderCount, 
SUM(Shipping_Cost) AS TotalShippingCost
FROM dbo.KMS_data
GROUP BY Order_Priority, Ship_Mode
ORDER BY Order_Priority, Ship_Mode;---Answer to the question asked:--No, I don’t believe the company spent shipping costs appropriately based on order priority. --The data shows that Critical orders, which require urgent delivery, were often shipped, more than Express Air, using Delivery Truck, the slowest method. --Surprisingly, Delivery Truck incurred higher total shipping costs than Express Air, which is supposed to be the fastest and most expensive option. --This indicates a misalignment between shipping choices and order urgency.
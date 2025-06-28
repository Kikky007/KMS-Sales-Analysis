# KMS-Sales-Analysis
This project Is a Capstone Project which contains SQL-based business intelligence insights for Kultra Mega Stores (KMS), a furniture and office supplies company operating in Nigeria. The analysis supports the Abuja division using historical order data (2009–2012) to answer strategic business questions.

## Project Contents
KMS DATA Queries

KMS Data set 

## Case Study Objectives

The project answers two main sets of business questions using SQL:

### Case Scenario I
1. Which product category had the highest sales?
2. Top 3 and bottom 3 regions in terms of sales?
3. Total sales of appliances in Ontario?
4. Recommendations to grow revenue from bottom 10 customers?
5. Which shipping method incurred the most shipping cost?

### Case Scenario II
6. Who are the most valuable customers, and what do they purchase?
7. Highest-spending small business customer?
8. Corporate customer with the most orders (2009–2012)?
9. Most profitable consumer customer?
10. Which customers returned items, and what segment do they belong to?
11. Was shipping method aligned with order priority?

---

## Tools & Skills Used

- **SQL Server (T-SQL)**
- Data Cleaning & Aggregation
- Business Logic Translation
- Performance Optimization
- Joins, Group By, Subqueries

---

## Key Insights (Short Summary)

- The **Technology** category had the highest sales.
- **West** topped regional sales while **Nunavut** was the lowest.
- **Delivery Truck**, though intended as the cheapest option, had the **highest shipping cost** — suggesting misalignment with **order priority**

---

## 💡 Recommendations

- Align **shipping methods** better with **order priorities**.
- Offer **targeted incentives** to bottom 10 customers.
- Reevaluate logistics cost structure.

---

## 📎 Sample SQL Query (Example)

```sql
SELECT TOP 1 ProductCategory,
SUM(Sales) AS TotalSales
FROM dbo.KMS_data
GROUP BY ProductCategory
ORDER BY TotalSales DESC;

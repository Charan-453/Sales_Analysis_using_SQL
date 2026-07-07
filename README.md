# Task 6: Sales Trend Analysis Using Aggregations

## Objective
Analyze monthly sales performance by calculating:
- Monthly Revenue
- Monthly Order Volume

## Tools Used
- Oracle SQL Developer
- Oracle Database

## Dataset
Table Name: `sales`

Columns Used:
- Order_ID
- Order_Date
- Amount
- Product_ID
- PaymentMode
- Category
- Sub_Category
- CustomerName
- State
- City
- Quantity
- Profit

## SQL Concepts Used
- SELECT
- WHERE
- GROUP BY
- ORDER BY
- SUM()
- COUNT(DISTINCT)
- EXTRACT()
- HAVING
- FETCH FIRST

## Queries Performed

### 1. Monthly Revenue and Order Volume
```sql
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY year, month;
```

### 2. Total Revenue
```sql
SELECT SUM(amount) AS total_revenue
FROM sales;
```

### 3. Product-wise Revenue
```sql
SELECT product_id,
       SUM(amount) AS revenue
FROM sales
GROUP BY product_id
ORDER BY revenue DESC;
```

### 4. Top 3 Months by Revenue
```sql
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS revenue
FROM sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY revenue DESC
FETCH FIRST 3 ROWS ONLY;
```

### 5. Orders Per Month
```sql
SELECT
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY month;
```

## Output
The queries generate:
- Monthly Revenue Report
- Monthly Order Count
- Product-wise Revenue
- Top Performing Months
- Overall Sales Summary

## Learning Outcomes
- Learned how to use aggregate functions.
- Performed data grouping using GROUP BY.
- Sorted data using ORDER BY.
- Extracted Year and Month from dates.
- Used COUNT(DISTINCT) to calculate unique orders.
- Generated sales trend reports using Oracle SQL.

## Conclusion
The task demonstrates how SQL aggregate functions can be used to analyze sales trends, identify high-performing months, and summarize business performance efficiently.

# Task 6: Sales Trend Analysis Using Aggregations

## Overview
This task involves analyzing monthly revenue and order volume from an `online_sales` dataset using SQL aggregations. The goal is to understand sales trends over time by grouping data by month and year, calculating total revenue, and counting order volumes.

## Dataset
The dataset `online_sales` contains the following columns:
- `order_id`: Unique identifier for each order.
- `order_date`: Date when the order was placed.
- `amount`: Revenue generated from the order.
- `product_id`: Identifier for the product ordered.
  
## Key Learnings
Grouping Data: Learned how to group data by month and year using EXTRACT and GROUP BY.

Aggregate Functions: Explored functions like SUM, COUNT, AVG, MIN, and MAX to analyze sales trends.

Handling NULLs: Used COALESCE to handle NULL values in aggregates.

Top N Analysis: Identified the top 3 months by sales using ORDER BY and LIMIT.

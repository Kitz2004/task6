show databases;
use folder1;
CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id VARCHAR(10)
);
INSERT INTO online_sales (order_id, order_date, amount, product_id) 
VALUES
(101, '2024-01-03', 1100.00, 'P01'),
(102, '2024-01-10', 1250.00, 'P02'),
(103, '2024-01-20', 890.00, 'P03'),
(104, '2024-01-25', 1450.00, 'P01'),
(105, '2024-02-01', 970.00, 'P02'),
(106, '2024-02-09', 1590.00, 'P03'),
(107, '2024-02-14', 1320.00, 'P04'),
(108, '2024-02-27', 1100.00, 'P01'),
(109, '2024-03-03', 1250.00, 'P02'),
(110, '2024-03-10', 860.00, 'P04'),
(111, '2024-03-15', 960.00, 'P03'),
(112, '2024-03-20', 1760.00, 'P01'),
(113, '2024-03-29', 1350.00, 'P02'),
(114, '2024-04-02', 890.00, 'P03'),
(115, '2024-04-09', 990.00, 'P04'),
(116, '2024-04-16', 1120.00, 'P01'),
(117, '2024-04-21', 1400.00, 'P02'),
(118, '2024-04-28', 1500.00, 'P04'),
(119, '2024-05-01', 1000.00, 'P01'),
(120, '2024-05-08', 1450.00, 'P02'),
(121, '2024-05-14', 850.00, 'P03'),
(122, '2024-05-22', 1320.00, 'P01'),
(123, '2024-05-30', 1110.00, 'P04'),
(124, '2024-06-04', 1650.00, 'P02'),
(125, '2024-06-10', 1340.00, 'P03'),
(126, '2024-06-17', 990.00, 'P04'),
(127, '2024-06-25', 1200.00, 'P01'),
(128, '2024-07-02', 1370.00, 'P03'),
(129, '2024-07-09', 1550.00, 'P01'),
(130, '2024-07-15', 1260.00, 'P02'),
(131, '2024-07-22', 880.00, 'P04'),
(132, '2024-08-05', 1325.00, 'P02'),
(133, '2024-08-12', 990.00, 'P01'),
(134, '2024-08-19', 1110.00, 'P04'),
(135, '2024-08-25', 1080.00, 'P03'),
(136, '2024-09-03', 1430.00, 'P01'),
(137, '2024-09-10', 990.00, 'P02'),
(138, '2024-09-18', 1010.00, 'P03'),
(139, '2024-09-27', 1210.00, 'P04'),
(140, '2024-10-01', 1240.00, 'P01'),
(141, '2024-10-07', 1420.00, 'P02'),
(142, '2024-10-15', 940.00, 'P04'),
(143, '2024-10-21', 1000.00, 'P03'),
(144, '2024-11-05', 1350.00, 'P01'),
(145, '2024-11-11', 950.00, 'P02'),
(146, '2024-11-19', 1100.00, 'P03'),
(147, '2024-11-27', 1250.00, 'P04'),
(148, '2024-12-02', 1375.00, 'P02'),
(149, '2024-12-13', 1125.00, 'P03'),
(150, '2024-12-21', 1490.00, 'P01');

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month
FROM online_sales
GROUP BY year, month;

-- COUNT(*) counts all rows, including duplicates
SELECT COUNT(*) AS total_rows FROM online_sales;

-- COUNT(DISTINCT order_id) counts only unique order_ids
SELECT COUNT(DISTINCT order_id) AS unique_orders FROM online_sales;

SELECT
    SUM(amount) AS total_sales,
    AVG(amount) AS avg_sales,
    MIN(amount) AS min_sale,
    MAX(amount) AS max_sale
FROM online_sales;

SELECT
    SUM(COALESCE(amount, 0)) AS revenue_handling_null
FROM online_sales;

-- Aliasing and grouping separately
SELECT 
  ym.month,
  SUM(o.amount) AS monthly_revenue
FROM (
  SELECT 
    order_id,
    amount,
    DATE_FORMAT(order_date, '%Y-%m') AS month
  FROM online_sales
) AS ym
JOIN online_sales o ON o.order_id = ym.order_id
GROUP BY ym.month
ORDER BY monthly_revenue DESC
LIMIT 3;

















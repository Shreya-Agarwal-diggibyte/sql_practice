
--COMMON TABLE EXPRESSION

WITH AverageOrderValue AS (
    SELECT AVG(oi.quantity * oi.unit_price) AS avg_order_value
    FROM Order_Items oi
)
SELECT c.customer_name
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY c.customer_name
HAVING SUM(oi.quantity * oi.unit_price) > (SELECT avg_order_value FROM AverageOrderValue);


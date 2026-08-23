-- Xom Data · Trung bình mỗi khách của kênh mua mấy đơn
-- Problem: https://xomdata.com/practice/medium-frequency-006
-- Solved: 2026-08-23

SELECT
  c.channel,
  count(DISTINCT c.customer_id) AS customers,
  count(o.order_id) as total_orders,
  ROUND(count(o.order_id)*1.0 / count(DISTINCT c.customer_id), 2) as orders_per_customer
FROM
  customers c
  JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.channel
ORDER BY orders_per_customer desc, channel

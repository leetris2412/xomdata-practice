-- Xom Data · Customer spending per order
-- Problem: https://xomdata.com/practice/medium-join-001
-- Solved: 2026-08-20

WITH
  CTE_calculation AS (
    SELECT
      c.full_name,
      count(o.id) order_count,
      COALESCE(SUM(o.total_amount), 0) total_spending,
      COALESCE(ROUND(avg(o.total_amount), 0), 0) avg_order_value
    FROM
      customers c
      LEFT JOIN orders o ON c.id = o.customer_id
    GROUP BY
      c.id,
      c.full_name
  )
SELECT
  full_name,
  order_count,
  total_spending,
  avg_order_value,
  ROW_NUMBER() OVER(ORDER BY total_spending desc, full_name asc) as spending_rank
from CTE_calculation
ORDER BY spending_rank asc

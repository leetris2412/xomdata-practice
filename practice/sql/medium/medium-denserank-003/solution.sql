-- Xom Data · Spending tiers of loyal customers
-- Problem: https://xomdata.com/practice/medium-denserank-003
-- Solved: 2026-08-21

-- Viết SQL của bạn ở đây
WITH
  CTE_sum AS (
    SELECT
      customer_name,
      SUM(amount) AS total_spent
    FROM
      purchases
    GROUP BY customer_name
  )
SELECT
  customer_name,
  total_spent,
  DENSE_RANK() OVER (
    ORDER BY
      total_spent desc
  ) AS spend_tier
FROM
  CTE_sum
ORDER BY
  spend_tier,
  customer_name

-- Xom Data · Classify products by sales velocity
-- Problem: https://xomdata.com/practice/medium-case-110
-- Solved: 2026-08-19

WITH
  CTE_total AS (
    SELECT
      p.name,
      p.categories,
      sum(quantity) AS total_sold
    FROM
      products p
      JOIN transactions t ON p.id = t.product_id
    GROUP BY
      p.id,
      p.name,
      p.categories
  )
SELECT
  name,
  categories,
  total_sold,
  CASE
    WHEN total_sold >= 100 THEN 'Best Seller'
    WHEN total_sold >= 50 THEN 'Average'
    ELSE 'Slow Mover'
  END AS classification,
  DENSE_RANK() OVER(PARTITION BY categories ORDER BY total_sold desc) as rank_in_cat,
  ROUND(total_sold * 100.0 / sum(total_sold) OVER(PARTITION BY categories), 2) as pct_of_cat_total
from CTE_total
ORDER BY categories asc, rank_in_cat asc, name asc

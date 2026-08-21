-- Xom Data · The category's flagship next to each item
-- Problem: https://xomdata.com/practice/medium-firstval-001
-- Solved: 2026-08-21

-- Viết SQL của bạn ở đây
SELECT
  category,
  product_name,
  price,
  FIRST_VALUE(product_name) OVER(PARTITION BY category ORDER BY price desc, product_name asc) as top_product
from catalog
ORDER BY category, price desc, product_name

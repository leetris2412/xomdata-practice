-- Xom Data · Revenue by product category
-- Problem: https://xomdata.com/practice/easy-groupby-002
-- Solved: 2026-08-27

-- Viết SQL của bạn ở đây
SELECT category, sum(amount) as total_revenue
from sales
GROUP BY category
ORDER BY category

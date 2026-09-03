-- Xom Data · Which sales channel leads in orders
-- Problem: https://xomdata.com/practice/easy-groupby-004
-- Solved: 2026-09-03

-- Viết SQL của bạn ở đây
SELECT channel, count(order_code) as num_orders
from orders
GROUP BY channel
ORDER BY num_orders desc, channel

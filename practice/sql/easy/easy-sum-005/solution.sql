-- Xom Data · Total spend for one budget category
-- Problem: https://xomdata.com/practice/easy-sum-005
-- Solved: 2026-08-29

-- Viết SQL của bạn ở đây
SELECT sum(amount) as total_spent
from expenses
WHERE category = 'Marketing'

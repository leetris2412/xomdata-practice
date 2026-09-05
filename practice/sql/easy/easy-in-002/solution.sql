-- Xom Data · Dishes off this season's menu
-- Problem: https://xomdata.com/practice/easy-in-002
-- Solved: 2026-09-05

-- Viết SQL của bạn ở đây
SELECT dish_name, category
from dishes
WHERE category not in ('Grill', 'Hotpot')

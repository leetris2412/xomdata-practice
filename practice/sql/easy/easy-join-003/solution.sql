-- Xom Data · Line totals from the price list
-- Problem: https://xomdata.com/practice/easy-join-003
-- Solved: 2026-09-05

-- Viết SQL của bạn ở đây
SELECT product_name, quantity, quantity*price as line_total
FROM products p
join sale_items s
on p.id = s.product_id

-- Xom Data · Customers in key cities
-- Problem: https://xomdata.com/practice/easy-in-001
-- Solved: 2026-09-05

-- Viết SQL của bạn ở đây
SELECT customer_name, city
FROM customers
where city = 'Hanoi' or city ='Da Nang' or city ='Ho Chi Minh City'

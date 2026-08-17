-- Xom Data · Total shipping fees collected
-- Problem: https://xomdata.com/practice/easy-sum-004
-- Solved: 2026-08-17

SELECT sum(shipping_fee) as total_fee
FROM shipments

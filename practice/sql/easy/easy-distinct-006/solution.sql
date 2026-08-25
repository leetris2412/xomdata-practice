-- Xom Data · Types of bank accounts
-- Problem: https://xomdata.com/practice/easy-distinct-006
-- Solved: 2026-08-25

SELECT account_type
FROM accounts
group by account_type

-- Xom Data · Top 5 highest-paid employees
-- Problem: https://xomdata.com/practice/easy-limit-004
-- Solved: 2026-08-25

SELECT full_name, salaries
FROM employees
ORDER BY salaries desc 
limit 5

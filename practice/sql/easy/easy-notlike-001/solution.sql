-- Xom Data · Excluding internal accounts from the report
-- Problem: https://xomdata.com/practice/easy-notlike-001
-- Solved: 2026-08-20

-- Viết SQL của bạn ở đây
SELECT email, plan
FROM signups
WHERE email not LIKE '%@corp.io'

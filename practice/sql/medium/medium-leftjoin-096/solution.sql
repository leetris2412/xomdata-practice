-- Xom Data · Accounts with no posts
-- Problem: https://xomdata.com/practice/medium-leftjoin-096
-- Solved: 2026-08-22

SELECT
  u.full_name,
  u.username,
  u.account_type,
  ROW_NUMBER() OVER(ORDER BY u.created_at asc, u.username) as signup_order,
  NTILE(4) OVER(ORDER BY u.created_at asc, u.username) as tenure_quartile
FROM users u
LEFT JOIN posts p
on u.id = p.user_id
where p.id IS NULL

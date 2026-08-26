-- Xom Data · Display names on profile pages
-- Problem: https://xomdata.com/practice/easy-coalesce-001
-- Solved: 2026-08-26

-- Viết SQL của bạn ở đây
SELECT real_name, nickname, CASE when nickname IS NULL then real_name
else nickname
end as display_name
from profiles

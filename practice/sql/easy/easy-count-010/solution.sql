-- Xom Data · Tickets still valid
-- Problem: https://xomdata.com/practice/easy-count-010
-- Solved: 2026-08-27

-- Viết SQL của bạn ở đây
SELECT count(id) as valid_tickets
from tickets
WHERE status = 'Valid'

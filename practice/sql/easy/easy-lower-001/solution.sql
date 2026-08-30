-- Xom Data · Normalizing emails before matching
-- Problem: https://xomdata.com/practice/easy-lower-001
-- Solved: 2026-08-30

-- Viết SQL của bạn ở se
SELECT email, lower(email) as normalized_email
FROM subscribers

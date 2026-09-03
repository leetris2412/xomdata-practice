-- Xom Data · Average score per class
-- Problem: https://xomdata.com/practice/easy-groupby-003
-- Solved: 2026-09-03

-- Viết SQL của bạn ở đây
SELECT class_name, ROUND(AVG(score),2) as avg_score
from scores
GROUP BY class_name
ORDER BY class_name

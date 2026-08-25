-- Xom Data · Highest and lowest score in the cohort
-- Problem: https://xomdata.com/practice/easy-minmax-001
-- Solved: 2026-08-25

SELECT MAX(avg_score) as max_score, MIN(avg_score) as min_score
FROM students

-- Xom Data · Classify student academic performance
-- Problem: https://xomdata.com/practice/medium-case-124
-- Solved: 2026-08-19

WITH
  CTE_avg AS (
    SELECT
      st.full_name,
      st.student_code,
      round(avg(sc.final_score), 2) AS avg_score
    FROM
      students st
      JOIN scores sc ON st.id = sc.student_id
    GROUP BY
      st.id,
      st.full_name,
      st.student_code
  )
SELECT
  full_name,
  student_code,
  avg_score,
  CASE
    WHEN avg_score >= 9 THEN 'Excellent'
    WHEN avg_score >= 8 THEN 'Good'
    WHEN avg_score >= 7 THEN 'Fair'
    WHEN avg_score >= 5 THEN 'Average'
    ELSE 'Poor'
  END AS grade,
  DENSE_RANK() OVER (
    ORDER BY
      avg_score DESC
  ) AS class_rank
FROM
  CTE_avg
ORDER BY
  avg_score DESC,
  student_code ASC
LIMIT
  20

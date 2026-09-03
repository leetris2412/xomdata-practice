-- Xom Data · Average score per subject
-- Problem: https://xomdata.com/practice/medium-groupby-027
-- Solved: 2026-09-03

WITH
  detail_score AS (
    SELECT
      subject_id,
      count(id) AS student_count,
      ROUND(AVG(final_score),2) AS avg_score,
      ROUND(
        100.0 * sum(
          CASE
            WHEN final_score >= 5 THEN 1
            ELSE 0
          END
        )/COUNT(id),
        2
      ) AS pass_rate
    FROM
      grades
    GROUP BY
      subject_id
  )
SELECT
  subject_name,
  credits,
  student_count,
  avg_score,
  pass_rate,
  RANK() OVER (
    ORDER BY
      avg_score DESC
  ) AS rank_by_avg,
  NTILE(4) OVER (
    ORDER BY
      avg_score DESC,
      subject_name
  ) AS difficulty_quartile
FROM
  detail_score AS a
  INNER JOIN subjects AS b ON a.subject_id = b.id
ORDER BY
  rank_by_avg ASC,
  subject_name

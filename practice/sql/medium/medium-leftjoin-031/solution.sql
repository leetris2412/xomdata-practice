-- Xom Data · Candidates not yet interviewed
-- Problem: https://xomdata.com/practice/medium-leftjoin-031
-- Solved: 2026-08-22

SELECT
  c.full_name,
  c.email,
  c.application_date,
  ROW_NUMBER() OVER (
    ORDER BY
      c.application_date,
      c.full_name
  ) AS queue_position,
  round((percent_rank() OVER(ORDER BY c.application_date))*100, 2) older_than_pct
from candidates c
LEFT JOIN interviews i
on c.id = i.candidate_id
WHERE i.id is null
ORDER BY i.id

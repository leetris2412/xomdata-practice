-- Xom Data · Peak-hour electricity record
-- Problem: https://xomdata.com/practice/easy-max-002
-- Solved: 2026-08-30

-- Viết SQL của bạn ở đây
SELECT max(kwh) as peak_load
FROM power_readings
where period = 'Peak'

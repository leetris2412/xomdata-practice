-- Xom Data · Records with a contact number
-- Problem: https://xomdata.com/practice/easy-isnull-003
-- Solved: 2026-09-05

-- Viết SQL của bạn ở đâys
SELECT patient_name, phone
FROM patients
where phone  is NOT  NULL

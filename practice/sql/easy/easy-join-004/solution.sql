-- Xom Data · Today's showtimes in time order
-- Problem: https://xomdata.com/practice/easy-join-004
-- Solved: 2026-09-05

-- Viết SQL của bạn ở đây
SELECT start_time, title, screen
from movies m
join showtimes s
on m.id = s.movie_id
ORDER BY start_time, title

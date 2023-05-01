-- Finds all non-unique names, great for fixing broken 1:N relations
SELECT 
Name,
COUNT(*) as Cnt
FROM demo
GROUp BY Name
HAVING COUNT(*) > 1
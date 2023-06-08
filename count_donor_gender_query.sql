/* How many donors are female/male? */

SELECT 
  gender,
  COUNT (1)
FROM donor
GROUP BY gender;

/* Which blood bank has the most donors? */

SELECT 
  blood_bank.blood_bank_id,
  blood_bank.name AS blood_bank_name,
  COUNT (1)
FROM blood_bank
  JOIN blood_bank_visit
    ON blood_bank.blood_bank_id  = blood_bank_visit.blood_bank_id
GROUP BY blood_bank.blood_bank_id
ORDER BY COUNT (1) desc;

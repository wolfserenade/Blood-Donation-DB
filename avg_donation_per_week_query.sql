/* Calculate the average ml of blood each blood bank gets per blood type, per week. */

With blood_bank_visit_with_wk_num AS (
  SELECT 
    *, 
    DATE_PART('week', visit_date) AS week_num
  FROM blood_bank_visit
) 

SELECT 
  blood_bank.blood_bank_id,
  blood_bank.name,
  blood_bank_visit_with_wk_num.blood_type,
  blood_bank_visit_with_wk_num.week_num,
  AVG (blood_bank_visit_with_wk_num.ml_blood_donated)
FROM blood_bank
JOIN blood_bank_visit_with_wk_num 
  ON blood_bank.blood_bank_id = blood_bank_visit_with_wk_num.blood_bank_id
GROUP BY blood_bank.blood_bank_id, blood_bank_visit_with_wk_num.blood_type, blood_bank_visit_with_wk_num.week_num
ORDER BY blood_bank.blood_bank_id ASC;

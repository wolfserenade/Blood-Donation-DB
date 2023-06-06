CREATE TABLE blood_bank_visit(
  blood_bank_visit_id SERIAL PRIMARY KEY,
  blood_bank_id INT,
  donor_id INT,
  visit_date DATE,
  blood_type blood_type,
  ml_blood_donated DECIMAL,
  CONSTRAINT fk_blood_bank
    FOREIGN KEY (blood_bank_id)
      REFERENCES blood_bank(blood_bank_id),
  CONSTRAINT fk_donor
    FOREIGN KEY (donor_id)
      REFERENCES donor(donor_id)
  );
CREATE TABLE donor(
  donor_id SERIAL PRIMARY KEY,
  last_name VARCHAR,
  first_name VARCHAR,
  date_of_birth DATE,
  gender VARCHAR,
  blood_type blood_type,
  email VARCHAR UNIQUE
  );

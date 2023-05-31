CREATE TYPE blood_type as ENUM ('A-', 'A', 'AB+', 'AB-', 'B', 'B-', 'O', 'O-');

CREATE TABLE donor(
  donor_id SERIAL PRIMARY KEY,
  last_name VARCHAR,
  first_name VARCHAR,
  date_of_birth DATE,
  gender VARCHAR,
  blood_type blood_type,
  email VARCHAR UNIQUE
  );

Insert INTO blood_donor(id, last_name, first_name, date_of_birth, age, gender, blood_type, email) VALUES
  (1, 'Tribbiani', 'Joey', 01/25/1983, 'M', 'A-', 'tribbiani.joey@gmail.com'),
  (2, 'Geller', 'Ross', 03/19/1986, 'M', 'A-', 'geller.ross@gmail.com'),
  (3, 'Green', 'Rachel', 06/04/199, 'F', 'A', 'green.rachel@gmail.com'),
  (4, 'Geller', 'Monica', 10/11/1996, 'F', 'O', 'geller.monica@gmail.com'),
  (5, 'Bing', 'Chandler', 12/12/2000, 'M','B-', 'bing.chandler@gmail.com'),
  (6, 'Buffay', 'Phoebe', 04/13/1991, 'F', 'B', 'buffay.phoebe@gmail.com'),
  (7, 'Hannigan', 'Mike', 09/10/1989, 'M', 'AB+', 'hannigan.mike@gmail.com'),
  (8, 'Josenstein', 'Janice' 01/01/2001, 'F', 'AB+', 'josenstein.janice@gmail.com'),
  (9, 'Burke', 'Richard', 03/30/1999, 'M', 'AB-', 'burke.richard@gmail.com'),
  (10, 'Becker', 'Pete', 07/13/1992, 'M', 'A', 'becker.pete@gmail.com');


CREATE TABLE blood_bank(
  blood_bank_id SERIAL PRIMARY KEY,
  name VARCHAR,
  address VARCHAR,
  city VARCHAR,
  state VARCHAR,
  zip_code INT,
  country VARCHAR
  );

INSERT INTO blood_bank('blood_bank_id', 'name', 'address', 'city', 'state', 'zip_code', 'country') VALUES
  ('New York Blood', '1234 Fun Street', 'New York', 'NY' 10001, 'USA'),
  ('New Jersey Gives Blood','987 Bored Street', 'Weehawken', 'NJ', 09234, 'USA'),
  ('Connecticut Hospital', '345 Main Street', 'Hartfort', 'CT', 34562, 'USA'),
  ('Salem''s Hospital', '789 Broom Street', 'Salem', 'MA', 346457, 'USA');

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

INSERT INTO blood_bank_visit ('bank_id', 'donor_id', visit_date, blood_type, ml_blood_donated) VALUES
  ()


/*
calculate the average liters of blood each blood bank gets per blood type, per week

which blood bank has the most donors

how many donors are female/male




*/



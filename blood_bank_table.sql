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
  (01,'New York Blood', '1234 Fun Street', 'New York', 'NY' 10001, 'USA'),
  (02,'New Jersey Gives Blood','987 Bored Street', 'Weehawken', 'NJ', 09234, 'USA'),
  (03,'Connecticut Hospital', '345 Main Street', 'Hartfort', 'CT', 34562, 'USA'),
  (04,'Salem''s Hospital', '789 Broom Street', 'Salem', 'MA', 346457, 'USA');

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

INSERT INTO blood_bank_visit (blood_bank_id, donor_id, visit_date, blood_type, ml_blood_donated) VALUES
  (01, 1, 2020/01/12, 'A-', 470)
  (01, 10, 2020/01/12, 'A', 470)
  (03, 8, 2020/01/12'AB+', 460)
  (04, 2, 2020/01/12, 'A-', 480)
  (02, 4, 2020/01/13, 'O', 490)
  (03, 9, 2020/01/15,'AB-', 470)
  (04, 3, 2020/01/18, 'A',470)
  (03, 6, 2020/01/19,'B', 490)
  (03, 5, 2020/01/25,'B-', 470)
  (01, 7, 2020/01/25, 'AB+', 480);
  



/* How many donors are female/male? */

SELECT 
  gender,
  COUNT (1)
FROM donor
GROUP BY gender;


/* Which blood bank has the most donors? */

SELECT 
  blood_bank.id,
  blood_bank.name AS blood_bank_name,
  COUNT (1)
FROM blood_bank,
  JOIN blood_bank_visit
    ON blood_bank.id = blood_bank_visit.blood_bank_id
GROUP BY blood_bank.id;


/*  */
/*       */
/*       */
/* Calculate the average ml of blood each blood bank gets per blood type, per week. */

SELECT 
  blood_bank.id, 
  blood_bank.name,
  blood_bank_visit.blood_type,
  AVG (blood_bank_visit.ml_blood_donated) 
    AS avg_ml
FROM blood_bank_visit
  JOIN blood_bank 
    ON blood_bank_visit.blood_bank_id = blood_bank.id
GROUP BY blood_bank_visit.blood_bank_id, blood_bank_visit.blood_type


SELECT DATE_PART('week', visit_date)
FROM blood_bank_visit

CREATE TABLE blood_donor(
  id int NOT NULL,
  last_name varchar,
  first_name varchar,
  date_of_birth date,
  gender varchar,
  blood_type varchar,
  
  PRIMARY KEY (id)
  );

Insert Into blood_donor(id, last_name, first_name, date_of_birth, age, gender, blood_type, ml) VALUES
  (1, 'Tribbiani', 'Joey', 01/25/1983, 'M', 'A-')
  (2, 'Geller', 'Ross', 03/19/1986, 'M', 'A-')
  (3, 'Green', 'Rachel', 06/04/199, 'F', 'A')
  (4, 'Geller', 'Monica', 10/11/1996, 'F', 'O')
  (5, 'Bing', 'Chandler', 12/12/2000, 'M','B-')
  (6, 'Buffay', 'Phoebe', 04/13/1991, 'F', 'B')
  (7, 'Hannigan', 'Mike', 09/10/1989, 'M', 'AB+')
  (8, 'Josenstein', 'Janice' 01/01/2001, 'F', 'AB+')
  (9, 'Burke', 'Richard', 03/30/1999, 'M', 'AB-')
  (10, 'Becker', 'Pete', 07/13/1992, 'M', 'A' 
    );

CREATE TABLE blood_bank(
  unique key (phone_number) int,
  blood_bank_name varchar
  );

CREATE TABLE 


/*
calculate the average liters of blood each blood bank gets per blood type, per week
*/

DROP TABLE IF EXISTS offers;
DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS dealers;


CREATE TABLE dealers
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  address VARCHAR(255)
);


CREATE TABLE cars
(
  id SERIAL8 primary key,
  make VARCHAR(255), 
  model VARCHAR(255),
  category VARCHAR(255),
  price INT8,
  dealer_id INT8 REFERENCES dealers(id)
);

CREATE TABLE offers 
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  day VARCHAR(255), 
  value INT2,
  car_id INT8 REFERENCES cars(id)
);








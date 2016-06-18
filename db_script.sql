DROP DATABASE IF EXISTS veterinary;

CREATE DATABASE veterinary;

USE veterinary;

CREATE TABLE business(
	business_id INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(25) NOT NULL,
    address VARCHAR(255) NOT NULL,
    neighborhood VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    
    PRIMARY KEY(business_id)
);

CREATE TABLE specialist (
     specialist_id INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
     business_id INTEGER(10) UNSIGNED,
	 name VARCHAR(50) NOT NULL,
     phone_number VARCHAR(25) NOT NULL,
     speciality_type_id INTEGER(10) UNSIGNED,
     
     PRIMARY KEY(specialist_id),
     FOREIGN KEY(business_id) REFERENCES business(business_id)
);

CREATE TABLE work_hours (
     work_hours_id INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
     day ENUM('MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN') NOT NULL,
     open_time TIME,
     close_time TIME,
     
     PRIMARY KEY(work_hours_id)
);

CREATE TABLE specialist_TO_work_hours (
     work_hours_id INTEGER(10) UNSIGNED NOT NULL,
     specialist_id INTEGER(10) UNSIGNED NOT NULL,
     
     PRIMARY KEY(work_hours_id, specialist_id),
     FOREIGN KEY(work_hours_id) REFERENCES work_hours(work_hours_id),
     FOREIGN KEY(specialist_id) REFERENCES specialist(specialist_id)
);

CREATE TABLE business_TO_work_hours (
     work_hours_id INTEGER(10) UNSIGNED NOT NULL,
     business_id INTEGER(10) UNSIGNED NOT NULL,
     
     PRIMARY KEY(work_hours_id, business_id),
     FOREIGN KEY(work_hours_id) REFERENCES work_hours(work_hours_id),
     FOREIGN KEY(business_id) REFERENCES business(business_id)
);

CREATE TABLE product (
     product_id INTEGER(10) UNSIGNED NOT NULL,
     name VARCHAR(50) NOT NULL,
     price DECIMAL(10,2) NOT NULL,
     product_type VARCHAR(30),
     description VARCHAR(255),
     priority INTEGER(10),
     
     PRIMARY KEY(product_id)
);

CREATE TABLE pet (
     pet_id INTEGER(10) UNSIGNED NOT NULL,
     business_id INTEGER(10) UNSIGNED NOT NULL,
     pet_type VARCHAR(20) NOT NULL,
     variety VARCHAR(32),
     color VARCHAR(20),
     priority INTEGER(10),
     
     PRIMARY KEY(pet_id),
     FOREIGN KEY(business_id) REFERENCES business(business_id)
);
 USE hospital_db;

 CREATE TABLE patients (
     patient_id INT PRIMARY KEY AUTO_INCREMENT,
     first_name VARCHAR(50) NOT NULL,
     last_name VARCHAR(50) NOT NULL,
     date_of_birth DATE NOT NULL,
     gender VARCHAR(10),
     language VARCHAR(20) NOT NULL
 );

 CREATE TABLE providers (
     provider_id INT PRIMARY KEY AUTO_INCREMENT,
     first_name VARCHAR(50) NOT NULL,
     last_name VARCHAR(50) NOT NULL,
     provider_specialty VARCHAR(50) NOT NULL,
     email_address VARCHAR(50), 
     phone_number VARCHAR(50),
     date_joined DATE NOT NULL
 );

 CREATE TABLE visits (
     visit_id INT PRIMARY KEY AUTO_INCREMENT,
     patient_id INT,
     provider_id INT,
     date_of_visit DATE NOT NULL,
     date_scheduled DATE NOT NULL,
     visit_department_id INT, 
     visit_type VARCHAR(50) NOT NULL,  
     blood_pressure_systolic INT, 
     blood_pressure_diastolic DECIMAL(5, 2), 
     pulse DECIMAL(5, 2), 
     visit_status VARCHAR(50) NOT NULL,
     FOREIGN KEY (patient_id) REFERENCES patients(patient_id),  
     FOREIGN KEY (provider_id) REFERENCES providers(provider_id)
 );

 CREATE TABLE ed_visits (
     ed_visit_id INT PRIMARY KEY AUTO_INCREMENT,
     visit_id INT,
     patient_id INT,
     acuity INT NOT NULL,
     reason_for_visit VARCHAR(255) NOT NULL,
     disposition VARCHAR(255) NOT NULL,
     FOREIGN KEY (visit_id) REFERENCES visits(visit_id),
     FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
 );

 CREATE TABLE admissions (
     admission_id INT PRIMARY KEY AUTO_INCREMENT,
     patient_id INT,
     admission_date DATE NOT NULL,
     discharge_date DATE NOT NULL,
     discharge_disposition VARCHAR(255) NOT NULL,
     service VARCHAR(255) NOT NULL,
     primary_diagnosis VARCHAR(255) NOT NULL,
     FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
 );

 CREATE TABLE discharges (
     discharge_id INT AUTO_INCREMENT PRIMARY KEY,
     admission_id INT,
     patient_id INT,
     discharge_date DATE NOT NULL,
     discharge_disposition VARCHAR(255) NOT NULL,
     FOREIGN KEY (admission_id) REFERENCES admissions(admission_id),
     FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
 );
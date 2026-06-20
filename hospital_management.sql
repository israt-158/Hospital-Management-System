-- Hospital Management System Database Modules

-- 1. Login System
CREATE TABLE Users (
user_id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(50) UNIQUE,
password VARCHAR(100),
role VARCHAR(20)
);

-- 2. Patient Management
CREATE TABLE Patients (
patient_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
age INT,
gender VARCHAR(10),
phone VARCHAR(20),
address VARCHAR(200)
);

-- 3. Doctor Management
CREATE TABLE Doctors (
doctor_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
specialization VARCHAR(100),
phone VARCHAR(20),
salary DECIMAL(10,2)
);

-- 4. Nurse Management
CREATE TABLE Nurses (
nurse_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
phone VARCHAR(20),
shift_time VARCHAR(50)
);

-- 5. Staff Management
CREATE TABLE Staff (
staff_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
position VARCHAR(50),
phone VARCHAR(20)
);

-- 6. Room Management
CREATE TABLE Rooms (
room_id INT AUTO_INCREMENT PRIMARY KEY,
room_number VARCHAR(20),
room_type VARCHAR(50),
status VARCHAR(20)
);

-- 7. Ward Management
CREATE TABLE Wards (
ward_id INT AUTO_INCREMENT PRIMARY KEY,
ward_name VARCHAR(50),
total_beds INT,
available_beds INT
);

-- 8. Appointment Management
CREATE TABLE Appointments (
appointment_id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT,
doctor_id INT,
appointment_date DATE,
appointment_time TIME,
FOREIGN KEY(patient_id) REFERENCES Patients(patient_id),
FOREIGN KEY(doctor_id) REFERENCES Doctors(doctor_id)
);

-- 9. Emergency Patients
CREATE TABLE EmergencyPatients (
emergency_id INT AUTO_INCREMENT PRIMARY KEY,
patient_name VARCHAR(100),
emergency_type VARCHAR(100),
admission_time DATETIME
);

-- 10. Medicine Inventory
CREATE TABLE Medicines (
medicine_id INT AUTO_INCREMENT PRIMARY KEY,
medicine_name VARCHAR(100),
quantity INT,
price DECIMAL(10,2)
);

-- 11. Pharmacy Module
CREATE TABLE PharmacySales (
sale_id INT AUTO_INCREMENT PRIMARY KEY,
medicine_id INT,
quantity INT,
total_price DECIMAL(10,2),
FOREIGN KEY(medicine_id) REFERENCES Medicines(medicine_id)
);

-- 12. Laboratory Module
CREATE TABLE LabTests (
test_id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT,
test_name VARCHAR(100),
result VARCHAR(200),
FOREIGN KEY(patient_id) REFERENCES Patients(patient_id)
);

-- 13. Billing & Payment
CREATE TABLE Bills (
bill_id INT AUTO_INCREMENT PRIMARY KEY,
patient_id INT,
amount DECIMAL(10,2),
payment_status VARCHAR(20),
FOREIGN KEY(patient_id) REFERENCES Patients(patient_id)
);

-- 14. Reports & Statistics
CREATE TABLE Reports (
report_id INT AUTO_INCREMENT PRIMARY KEY,
report_name VARCHAR(100),
generated_date DATE
);

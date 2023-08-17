
-- Doctors Table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100)
);

-- Patients Table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    date_of_birth DATE,
    gender VARCHAR(10),
    contact_info VARCHAR(100)
);

-- Visits Table
CREATE TABLE Visits (
    visit_id INT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    visit_date DATE,
    diagnosis VARCHAR(200),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Diseases Table
CREATE TABLE Diseases (
    disease_id INT PRIMARY KEY,
    disease_name VARCHAR(100)
);

-- PatientDiseases Table
CREATE TABLE PatientDiseases (
    patient_id INT,
    disease_id INT,
    PRIMARY KEY (patient_id, disease_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (disease_id) REFERENCES Diseases(disease_id)
);



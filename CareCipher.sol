// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HospitalRecords {
    
    // Define a struct for a Doctor
    struct Doctor {
        uint id;
        string name;
        string specialization;
        address doctorAddress;
    }

    // Define a struct for a Patient
    struct Patient {
        uint id;
        string name;
        uint age;
        string medicalHistory;
        address patientAddress;
    }
    
    // Mapping to store doctors and patients by their ID
    mapping(uint => Doctor) public doctors;
    mapping(uint => Patient) public patients;

    // Counters for the IDs
    uint public doctorCount;
    uint public patientCount;

    // Events for adding doctors and patients
    event DoctorAdded(uint id, string name, string specialization, address doctorAddress);
    event PatientAdded(uint id, string name, uint age, string medicalHistory, address patientAddress);
    
    // Function to add a new doctor
    function addDoctor(string memory _name, string memory _specialization, address _doctorAddress) public {
        doctorCount++;
        doctors[doctorCount] = Doctor(doctorCount, _name, _specialization, _doctorAddress);
        emit DoctorAdded(doctorCount, _name, _specialization, _doctorAddress);
    }

    // Function to add a new patient
    function addPatient(string memory _name, uint _age, string memory _medicalHistory, address _patientAddress) public {
        patientCount++;
        patients[patientCount] = Patient(patientCount, _name, _age, _medicalHistory, _patientAddress);
        emit PatientAdded(patientCount, _name, _age, _medicalHistory, _patientAddress);
    }

    // Function to get doctor details by ID
    function getDoctor(uint _id) public view returns (uint, string memory, string memory, address) {
        Doctor memory doc = doctors[_id];
        return (doc.id, doc.name, doc.specialization, doc.doctorAddress);
    }

    // Function to get patient details by ID
    function getPatient(uint _id) public view returns (uint, string memory, uint, string memory, address) {
        Patient memory pat = patients[_id];
        return (pat.id, pat.name, pat.age, pat.medicalHistory, pat.patientAddress);
    }

    // Function to update patient's medical history
    function updateMedicalHistory(uint _id, string memory _medicalHistory) public {
        patients[_id].medicalHistory = _medicalHistory;
    }
}

package com.ming.hospital.dao;

import com.ming.hospital.pojo.Prescription;

import java.util.List;

public interface PrescriptionMapper {

     int createPrescriptionAutomated(Prescription prescription);

     List<Prescription> queryAllPrescription();

     Prescription queryPrescriptionByAid(Long aid);

    void updatePrescription(Prescription prescription);
}

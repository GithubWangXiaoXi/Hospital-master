package com.ming.hospital.service;

import com.ming.hospital.dao.MedicineMapper;
import com.ming.hospital.dao.PrescriptionMapper;
import com.ming.hospital.pojo.Appointment;
import com.ming.hospital.pojo.Medicine;
import com.ming.hospital.pojo.Prescription;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Service(value = "prescriptionService")
@Transactional
public class PrescriptionService {

    @Autowired
    PrescriptionMapper prescriptionMapper;

    @Autowired
    MedicineMapper medicineMapper;

    public int  createPrescriptionAutomated(Prescription prescription){
          // TODO Auto-generated method stub
          int result = prescriptionMapper.createPrescriptionAutomated(prescription);
          return result;
    }

    //不用再次访问数据库了，直接匹配list即可
    public String queryPrescription(Long pid, List<Prescription> prescriptions, HttpSession session){

        for(Prescription prescription1 : prescriptions){
            if(pid.equals(prescription1.getPid())){
                session.setAttribute("prescription",prescription1);
                return "success";
            }
        }

        return "failed";
    }

    public List<Prescription> queryAllPrescription() {
        return prescriptionMapper.queryAllPrescription();
    }

    public List<Prescription> queryAllPrescription(List<Appointment> appointmentList) {

        List<Prescription> prescriptionList = new ArrayList<>();

        for(Appointment appointment : appointmentList){
            prescriptionList.add(prescriptionMapper.queryPrescriptionByAid(Long.valueOf(appointment.getAid().toString())));
        }

        return prescriptionList;
    }

    public void updatePrescription(Prescription prescription){
        prescriptionMapper.updatePrescription(prescription);
    }

    public String getmedicineMnoBymedicineMname(Prescription prescription) {

        String medicineMno = "";
        String medicineMname = prescription.getMedicineMname();
        String token[] = medicineMname.split(",");

        for(int i = 0; i < token.length; i++){
            String mno = medicineMapper.queryMedicineByMname(token[i]).getMno();
            if(i != token.length - 1){
                medicineMno += mno + ",";
            }else{
                medicineMno += mno;
            }
        }

        return medicineMno;
    }
}

package com.ming.hospital.dao;

import com.ming.hospital.pojo.Medicine;

import java.util.List;

public interface MedicineMapper {
	public Medicine queryMedicineByMno(String mno);

	public List<Medicine> queryAllMedicine();

	public void saveMedicine(Medicine medicine);

	public void deleteMedicineByMno(String mno);

	public void modifyMedicine(Medicine medicine);

	public List<Medicine> queryMultiMedicine(Medicine medicine);

    Medicine queryMedicineByMname(String mname);
}

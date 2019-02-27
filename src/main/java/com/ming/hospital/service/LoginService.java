package com.ming.hospital.service;

import com.ming.hospital.dao.DoctorMapper;
import com.ming.hospital.pojo.Doctor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class LoginService {
	// 注入userMapper
	@Autowired
	private DoctorMapper doctorMapper;

	public String login(String username, String password, HttpSession session) {
		// TODO Auto-generated method stub

		//查询医生的真实姓名
		Doctor doctor = doctorMapper.queryDoctorByName(username);
		if (doctor == null) {
			return "没有此用户";
		} else if (doctor.getDpassword().equals(password) == false) {
			return "密码错误";
		} else {
			// 用户存在，保存session
			session.setAttribute("doctor", doctor);
			return "success";
		}
	}

}

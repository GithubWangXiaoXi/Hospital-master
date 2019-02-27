package com.ming.hospital.web;

import com.ming.hospital.pojo.*;
import com.ming.hospital.service.AppointmentService;
import com.ming.hospital.service.MedicineService;
import com.ming.hospital.service.PrescriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RequestMapping("Prescription")
@Controller
public class PrescriptionController {
	// 药品controller
	@Autowired
	private PrescriptionService prescriptionService;

	@Autowired
	private AppointmentService appointmentService;

	@Autowired
	private MedicineService medicineService;


	//单例模式，避免医生在查询自己的处方信息时出现多次查询
	private Doctor doctor;
	private List<Appointment> appointmentList;
	private List<Prescription> allPrescription;
	private HashMap<String,Medicine> medicineHashMap = new HashMap<>();
	private List<Medicine> medicineList;


	//判断目前医生是否登录
	@RequestMapping("isDoctorLogin")
	@ResponseBody
	public ModelAndView isDoctorLogin(HttpSession session,HttpServletRequest request) {

		String sentence;
		if(session.getAttribute("doctor") == null){
			sentence = "/mms/Error.jsp";
		}else{
			sentence = "/mms/tabs/prescription/Search1.jsp";
		}

		ModelAndView modelAndView=new ModelAndView();

		RedirectView redirectView=new RedirectView(request.getContextPath() + sentence);
		modelAndView.setView(redirectView);

		return modelAndView;
	}


	// 医生通过pid进行查询处方信息，但是不能查询其他医生的处方信息
	@RequestMapping("QueryPrescriptionByPid")
	@ResponseBody
	public ModelAndView queryPrescriptionByPid(HttpSession session,HttpServletRequest request) {

		//加载doctor,appointment,allPrescription对象，并将处方中的药物编号对应的药物名字加载到处方的药物名字对象中。
		loadObjects(session);

		String temp = request.getParameter("pid");
		Long pid = Long.valueOf(temp);
		String reply = prescriptionService.queryPrescription(pid,allPrescription,session);

		String sentence;
		if(reply.equals("success")){
			 sentence = "/mms/tabs/prescription/Search2.jsp";
		}else{
			sentence = "/mms/tabs/prescription/Error.jsp";
		}

		ModelAndView modelAndView=new ModelAndView();

		RedirectView redirectView=new RedirectView(request.getContextPath() + sentence);
		modelAndView.setView(redirectView);

		return modelAndView;
	}

	// 查询该医生所有处方信息
	@RequestMapping("QueryAllPrescription")
	@ResponseBody
	public ModelAndView queryAllPrescription(HttpSession session,HttpServletRequest request) {

		//先判断医生是否登录
		String sentence = "";
	    sentence = "/mms/Error.jsp";

	    if(session.getAttribute("doctor") != null) {

	    	//加载doctor,appointment,allPrescription对象，并将处方中的药物编号对应的药物名字加载到处方的药物名字对象中。
			loadObjects(session);
			sentence = "/mms/tabs/prescription/Browse.jsp";
		}

		ModelAndView modelAndView=new ModelAndView();

		session.setAttribute("allPrescription",allPrescription);

		RedirectView redirectView=new RedirectView(request.getContextPath() + sentence);
		modelAndView.setView(redirectView);

		return modelAndView;
	}

	// 查询该医生所有处方信息,发送到修改的页面中
	@RequestMapping("QueryAllPrescription1")
	@ResponseBody
	public ModelAndView queryAllPrescription1(HttpSession session,HttpServletRequest request) {

		//先判断医生是否登录
		String sentence = "";
		sentence = "/mms/Error.jsp";

		if(session.getAttribute("doctor") != null) {
			//加载doctor,appointment,allPrescription对象，并将处方中的药物编号对应的药物名字加载到处方的药物名字对象中。
			loadObjects(session);
			sentence = "/mms/tabs/prescription/Update.jsp";
			medicineList = medicineService.getAllMedicine();
		}

		ModelAndView modelAndView=new ModelAndView();

		session.setAttribute("allPrescription",allPrescription);
		session.setAttribute("medicineList",medicineList);

		RedirectView redirectView=new RedirectView(request.getContextPath() + sentence);
		modelAndView.setView(redirectView);

		return modelAndView;
	}

	//修改处方信息
	@RequestMapping("UpdatePrescription")
	@ResponseBody
	public ModelAndView updatePrescription(@RequestBody Prescription prescription, HttpSession session, HttpServletRequest request) {


		System.out.println(prescription.getPid() + "," + prescription.getDescription() + "," + prescription.getMedicineMname());

		//用prescription的处方药名称查询处方药的编号，并保存在prescriptionMno中
		String medicineMno = prescriptionService.getmedicineMnoBymedicineMname(prescription);

		prescription.setMedicineMno(medicineMno);
		prescriptionService.updatePrescription(prescription);

		String sentence = "/mms/success.jsp";

		ModelAndView modelAndView=new ModelAndView();

		RedirectView redirectView=new RedirectView(sentence);
		modelAndView.setView(redirectView);

		return modelAndView;
	}

	//判断doctor,appointment,allPrescription对象是否已创建
	public boolean isObjectsCreated(){

		if(doctor == null || appointmentList == null || allPrescription == null){
			return false;
		}

		return true;
	}

	//如果对象没有创建，则加载这些对象
	public void loadObjects(HttpSession session){
		if(!isObjectsCreated()){

			//得到现在登录的医生
			doctor = (Doctor) session.getAttribute("doctor");

			//查询得到医生对应的预约单列表
			appointmentList = appointmentService.getAppointmentByDoctor(doctor);

			//根据预约单aid列表，得到处方单
			allPrescription = prescriptionService.queryAllPrescription(appointmentList);

			//处理处方单中处方药编号列表字符串，并封装在allPrescription的medicineList中
			for(int i = 0; i < allPrescription.size(); i++){

				String medicineMnoStr = allPrescription.get(i).getMedicineMno();

				String token[] = medicineMnoStr.split(",");

				String medicineNameStr = "";
				int count = 0;
				for(String str : token){

					//先到hashmap中查询之前是否查询过
					if(medicineHashMap.get(str) != null){
						count++;
						if(count != token.length){
							medicineNameStr += medicineHashMap.get(str).getMname() + ",";
						}else{
							medicineNameStr += medicineHashMap.get(str).getMname();
						}
					}else{
						Medicine medicine = medicineService.queryMedicineByMno(str);

						count++;
						if(count != token.length){
							medicineNameStr += medicine.getMname() + ",";
						}else{
							medicineNameStr += medicine.getMname();
						}
						medicineHashMap.put(str,medicine);
					}
				}
				allPrescription.get(i).setMedicineMname(medicineNameStr);
			}
		}
	}
}

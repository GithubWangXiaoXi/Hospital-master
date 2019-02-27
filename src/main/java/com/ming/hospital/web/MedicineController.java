package com.ming.hospital.web;

import com.ming.hospital.pojo.EasyUIResult;
import com.ming.hospital.pojo.Medicine;
import com.ming.hospital.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("Medicine")
@Controller
public class MedicineController {
	// 药品controller
	@Autowired
	private MedicineService medicineService;

	//判断目前医生是否登录
	@RequestMapping("isDoctorLogin")
	@ResponseBody
	public ModelAndView isDoctorLogin(HttpSession session,HttpServletRequest request) {

		String sentence;
		if(session.getAttribute("doctor") == null){
			sentence = "/mms/Error.jsp";
		}else{
			sentence = "/mms/tabs/medicine/Search1.jsp";
	    }

		ModelAndView modelAndView=new ModelAndView();

		RedirectView redirectView=new RedirectView(request.getContextPath() + sentence);
		modelAndView.setView(redirectView);

		return modelAndView;
	}

	// 通过mno查询药品信息
	@RequestMapping("QueryMedicineByMno")
	@ResponseBody
	public ModelAndView queryMedicineByMno(HttpSession session,HttpServletRequest request) {

		String mno = request.getParameter("mno");
		Medicine medicine = medicineService.queryMedicineByMno(mno);

		String sentence = "/mms/tabs/medicine/Search2.jsp";

		ModelAndView modelAndView=new ModelAndView();

		session.setAttribute("medicine",medicine);

		RedirectView redirectView=new RedirectView(request.getContextPath() + sentence);
		modelAndView.setView(redirectView);

		return modelAndView;
	}

	/*
	 * // 多条件药品信息保存session
	 * 
	 * @RequestMapping("QueryMultiMedicine")
	 * 
	 * @ResponseBody public String queryMultiMedicine(Medicine
	 * medicine,HttpSession session) { return
	 * medicineService.queryMultiMedicine(medicine,session);
	 * 
	 * } // 多条件药品查询url
	 * 
	 * @RequestMapping("GetMultiMedicine")
	 * 
	 * @ResponseBody public EasyUIResult getMultiMedicine(@RequestParam(value =
	 * "page", defaultValue = "1") Integer page,
	 * 
	 * @RequestParam(value = "rows", defaultValue = "5") Integer rows,
	 * HttpSession session) { return medicineService.getMultiMedicine(page,
	 * rows,session);
	 * 
	 * }
	 */
	/*
	 * // 通过mno删除药品信息
	 * 
	 * @RequestMapping(value = "DeleteMedicine", produces =
	 * "text/html;charset=UTF-8")
	 * 
	 * @ResponseBody public String deleteMedicineByMno(String mno) { return
	 * medicineService.deleteMedicineByMno(mno); }
	 */
	// 批量删除
	@RequestMapping(value = "DeleteRows", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String deleteMedicineByRows(@RequestParam(value = "array[]") String[] array) {
		try {

			return medicineService.deleteMedicineByRows(array);

		} catch (Exception e) {
			// TODO: handle exception
			return "操作异常，可能某些药品被顾客购买过，" + "无法删该药品，请重新选择";
		}
	}

	// 保存药品信息
	@RequestMapping(value = "SaveMedicine", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String saveMedicine(Medicine medicine) {
		return medicineService.saveMedicine(medicine);
	}

	// 修改药品信息
	@RequestMapping(value = "ModifyMedicine", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String modifyMedicine(Medicine medicine) {
		return medicineService.modifyMedicine(medicine);
	}

	// easyui返回json
	@RequestMapping("GetMessage")
	@ResponseBody
	public EasyUIResult queryAllMedicine(@RequestParam(value = "page", defaultValue = "1") Integer page,
										 @RequestParam(value = "rows", defaultValue = "5") Integer rows) {
		return medicineService.queryAllMedicine(page, rows);

	}

	// 获得药品信息
	@RequestMapping("GetAllMedicine")
	@ResponseBody
	public ModelAndView getAllMedicine(HttpServletRequest request, HttpSession session) {
		List<Medicine> allMedicine = medicineService.getAllMedicine();

		String sentence = "";
		if(session.getAttribute("doctor") == null){
			sentence = "/mms/Error.jsp";
		}else{
			sentence = "/mms/tabs/medicine/Browse.jsp";
		}

		ModelAndView modelAndView=new ModelAndView();

		session.setAttribute("allMedicine",allMedicine);

		RedirectView redirectView=new RedirectView(request.getContextPath() + sentence);
		modelAndView.setView(redirectView);

		return modelAndView;

	}


}

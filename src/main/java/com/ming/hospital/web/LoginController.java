package com.ming.hospital.web;


import com.ming.hospital.service.DoctorService;
import com.ming.hospital.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;
//处理登陆逻辑

@RequestMapping("Login")
@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	private DoctorService doctorService;

	/*
	 * 用户登陆 判断是否存在用户 存在保存session
	 */
	@RequestMapping(value = "loginUser")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String reply = loginService.login(username, password, session);

		String sentence = "";
		if(reply.equals("success")){
			sentence = "/mms/index.htm";
			session.removeAttribute("msg");
		}else if(reply.equals("没有此用户")){
			sentence = "/mms/Msg.jsp";
			session.setAttribute("msg","没有此用户");
		}else if(reply.equals("密码错误")){
			sentence = "/mms/Msg.jsp";
			session.setAttribute("msg","密码错误");
		}

		ModelAndView modelAndView=new ModelAndView();
		RedirectView redirectView=new RedirectView(sentence);
		modelAndView.setView(redirectView);

		return modelAndView;
	}

	// 取出seeion的用户名
	@RequestMapping("GetLoginName")
	@ResponseBody
	public Object GetLoginName(HttpSession session) {
		Object username = session.getAttribute("user");
		return username;
	}

	// 清除session
	@RequestMapping("LogOff")
	@ResponseBody
	public void logOff(HttpSession session) {
		Enumeration em = session.getAttributeNames();
		while (em.hasMoreElements()) {
			session.removeAttribute(em.nextElement().toString());
		}
	}

	//跳转到医生登录页面
	@RequestMapping("/loginDoctor")
	public String doctorLogin(HttpServletRequest request){

//		String sentence = "/mms/login.jsp";
//
//		ModelAndView modelAndView = new ModelAndView();
//		RedirectView redirectView = new RedirectView(sentence);
//		modelAndView.setView(redirectView);
		return "forward:/mms/login.jsp";
	}

	//如果未登录，则不能进行menu菜单的操作
	@RequestMapping("/notOperate")
	public String notOperate(HttpServletRequest request){

		String sentence = "mms/tabs/prescription/Error.jsp";

		ModelAndView modelAndView = new ModelAndView();
		RedirectView redirectView = new RedirectView(request.getContextPath() + sentence);
		modelAndView.setView(redirectView);
		return sentence;
	}
}

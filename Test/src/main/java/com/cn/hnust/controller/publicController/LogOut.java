package com.cn.hnust.controller.publicController;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogOut {
	
	@RequestMapping("/logout")
	public String toLogOut(HttpSession session) {
		if ((String)session.getAttribute("userName")!= null) {
			session.removeAttribute("userName");
		}
		if ((String)session.getAttribute("manager")!= null) {
			session.removeAttribute("manager");
		}
		if ((String)session.getAttribute("type")!= null) {
			session.removeAttribute("type");
		}
		
		return "login";
	}

}

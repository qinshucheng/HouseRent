package com.cn.hnust.controller.userController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IUserService;

@Controller
public class UserRegister {
	
	@Resource
	private IUserService userService;
	
	/**
	 * 访问注册页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/register_toRegister")
	public ModelAndView toRegister()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("register");//设置登录页
		return mv;
	}
	
	/**
	 * 用户注册
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/userRegister",method=RequestMethod.POST)
	public String userRegister(User user) {
		int insert = userService.userRegister(user);
		if (insert > 0) {
			return "login";
		}
		return "register";
		
	}
	
	@RequestMapping("/updateMydata")
	public String updataMyData(HttpSession session,User user,RedirectAttributes attributes) {
		if ((String)session.getAttribute("userName") == null) {
			return "login";
		}
		String userName = (String)session.getAttribute("userName");
		user.setUserName(userName);
		int update_result = this.userService.updateMydata(user);
		if (update_result>0) {
			attributes.addAttribute("update_data_result", "更新资料成功");
			return "redirect:showMyRoomList";
		}else {
			attributes.addAttribute("update_data_result", "更新资料失败");
			return "redirect:showMyRoomList";
		}
		
	}

}

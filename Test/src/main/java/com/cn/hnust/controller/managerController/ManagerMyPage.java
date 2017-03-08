package com.cn.hnust.controller.managerController;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cn.hnust.pojo.Roominfo;
import com.cn.hnust.pojo.Sysinfo;
import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IUserService;
import com.cn.hnust.service.RoomService;
import com.cn.hnust.service.SysinfoService;

@Controller
public class ManagerMyPage {
	
	@Resource
	private RoomService roomService;
	@Resource
	private IUserService userService;
	@Resource
	private SysinfoService sysinfoService;
	
	@RequestMapping("/managerPage")
	public String toManagerPage(Model model,HttpSession session) {
		if ((String)session.getAttribute("manager")==null) {
			return "login";
		}
		
		List<Sysinfo> sysinfos = this.sysinfoService.getAllSysInfo();
		model.addAttribute("sysinfos",sysinfos);
		
		List<Roominfo> roomList = this.roomService.getAllRoomInfo();
		List<User> userList = this.userService.getAllUser();
		model.addAttribute("roomList",roomList);
		model.addAttribute("userList",userList);
		return "main_manager";
		
	}
	
	@RequestMapping("/deleteRoominfo")
	public String todeleteRoominfo(HttpServletRequest request,RedirectAttributes attributes) {
		
		int room_id = Integer.parseInt(request.getParameter("room_id"));
		int deleteRoom_result = this.roomService.deleteRoomById(room_id);
		if (deleteRoom_result>0) {
			attributes.addAttribute("deleteRoom_result", "删帖成功!");
			return "redirect:managerPage";
		}else {
			attributes.addAttribute("deleteRoom_result", "删帖失败!");
			return "redirect:managerPage";
		}
		
	}
	
	@RequestMapping("/deleteUser")
	public String todeleteUser(HttpServletRequest request,RedirectAttributes attributes) {
		
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int deleteUser_result = this.userService.deleteUserById(user_id);
		if (deleteUser_result>0) {
			attributes.addAttribute("deleteUser_result", "删除用户成功!");
			return "redirect:managerPage";
		}else {
			attributes.addAttribute("deleteUser_result", "删除用户失败!");
			return "redirect:managerPage";
		}
		
	}
	@RequestMapping("/publish_sysinfo")
	public String topublish_sysinfo(Sysinfo sysinfo,RedirectAttributes attributes) {
		
		int add_result = this.sysinfoService.addSysinfo(sysinfo);
		if (add_result>0) {
			attributes.addAttribute("add_result", "发布消息成功!");
			return "redirect:managerPage";
		}else {
			attributes.addAttribute("add_result", "发布消息失败!");
			return "redirect:managerPage";
		}
		
	}
	@RequestMapping("/deleteSysinfo")
	public String todeleteSysinfo(HttpServletRequest request,RedirectAttributes attributes) {
		
		int sysinfo_id = Integer.parseInt(request.getParameter("sysinfo_id"));
		int deleteSysinfo_result = this.sysinfoService.deleteSysinfo(sysinfo_id);
		if (deleteSysinfo_result>0) {
			attributes.addAttribute("deleteSysinfo_result", "删除消息成功!");
			return "redirect:managerPage";
		}else {
			attributes.addAttribute("deleteSysinfo_result", "删除消息失败!");
			return "redirect:managerPage";
		}
		
	}

}

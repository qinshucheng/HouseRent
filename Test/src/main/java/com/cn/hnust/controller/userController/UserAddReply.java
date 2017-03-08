package com.cn.hnust.controller.userController;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cn.hnust.pojo.Room_reply;
import com.cn.hnust.service.Room_replyService;

@Controller
public class UserAddReply {
	
	@Resource
	private Room_replyService room_replyService;
	
	@RequestMapping("/addReply")
	private String toAddReply(HttpServletRequest request,HttpSession session,Room_reply room_reply,
			RedirectAttributes attributes) {
		
		int room_id = Integer.parseInt(request.getParameter("room_id"));
		room_reply.setRoomId(room_id);
		
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd H:m:s");
		String time = format.format(date);
		room_reply.setTime(time);
		
		String userName = (String)session.getAttribute("userName");
		room_reply.setReplyer(userName);
		int addReply = this.room_replyService.addReply(room_reply);
		
		if (addReply>0) {
			attributes.addAttribute("room_id", room_id);//设置重定向传递的参数
			return "redirect:/showUserRoomDetail";//重定向
		}else {
			return "login";
		}
		
		

	}

}

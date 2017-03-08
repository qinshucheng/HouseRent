package com.cn.hnust.controller.userController;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cn.hnust.pojo.Roominfo;
import com.cn.hnust.service.RoomService;

@Controller
public class UserMyPage {
	
	@Resource
	private RoomService roomService;
	
	@RequestMapping("/updateMyRoom")
	public String toUpdateMyRoom(HttpSession session,HttpServletRequest request,
			Roominfo roominfo,@RequestParam("file")MultipartFile[] files,
			RedirectAttributes attributes) {
		if ((String)session.getAttribute("userName") == null) {
			return "login";
		}
		int roomid = Integer.parseInt(request.getParameter("roomid"));
		Roominfo original_Roominfo = this.roomService.getRoomById(roomid);
		//存储图片,设置图片存储路径为原始路径
		String filepath = original_Roominfo.getImage();
		roominfo.setImage(filepath);
		for(int i = 0; i < files.length; i++){
			MultipartFile file = files[i];
		    if(!file.isEmpty()){
		      try {
		    	String filename = System.currentTimeMillis()+ file.getOriginalFilename();
		        FileUtils.copyInputStreamToFile(file.getInputStream(), new File(filepath, filename));
		        
		      } catch (IOException e) {
		       
		        e.printStackTrace();
		      }
		    }
		}
		roominfo.setId(roomid);
		roominfo.setImage(filepath);//添加存储图片路径
		String user = (String)session.getAttribute("userName");
        roominfo.setUser(user);
        Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd H:m:s");
		String time = format.format(date);
		roominfo.setTime(time);
		
		int update_result = this.roomService.updateRoomById(roominfo);
		if (update_result>0) {
			attributes.addAttribute("updateResult", "更新房屋信息成功!");//设置重定向传递的参数
			return "redirect:showMyRoomList";
		}else {
			attributes.addAttribute("updateResult", "更新房屋信息失败!");//设置重定向传递的参数
			return "redirect:showMyRoomList";
		}
		
	}

}

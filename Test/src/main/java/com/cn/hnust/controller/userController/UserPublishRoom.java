package com.cn.hnust.controller.userController;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cn.hnust.pojo.Roominfo;
import com.cn.hnust.service.RoomService;

@Controller
public class UserPublishRoom {
	
	@Resource
	private RoomService roomService;
	
	@RequestMapping("/publishRoom")
	public String toPublishRoom(HttpSession session,Roominfo roominfo,@RequestParam("file")MultipartFile[] files) {
		
		long current = System.currentTimeMillis();//获取当前时刻
		
		//获取filepath图片路径
		//String filepath = "c:\\Users\\Administrator\\eclipse_mars_project\\HNUST\\org.zsl.hnust Maven Webapp\\src\\main\\webapp\\image\\"+current;
		//String filepath = "D:\\image\\"+current;
		//String filepath = "C:\\web_enwironment\\test_file\\image\\"+current;
		String filepath = Thread.currentThread().getContextClassLoader().getResource("").toString(); //服务器部署图片
		filepath=filepath.replace('/', '\\'); // 将/换成\  
        filepath=filepath.replace("file:", ""); //去掉file:  
        filepath=filepath.replace("WEB-INF\\classes\\", ""); //去掉WEB-INF\classes\  
        filepath=filepath.substring(1); //去掉第一个\,如 \D:\JavaWeb...  
        filepath=filepath+"image\\"+current;  
        System.out.println("图片保存路径："+filepath);
		
		for(int i = 0; i < files.length; i++){//对上传的多张图片依次存储
			MultipartFile file = files[i];//其中一张图片
		    if(!file.isEmpty()){//判断图片是否非空
		      System.out.println("Process file: "+file.getOriginalFilename() );
		      try {
		    	String filename = current+ file.getOriginalFilename();//为每张图片设置新的文件名（具有唯一性）：当前时刻加原始文件名
		        FileUtils.copyInputStreamToFile(file.getInputStream(), new File(filepath, filename));//开始上传并存储图片到本地路径
		        //System.out.println(new File("/").getAbsolutePath());
		      } catch (IOException e) {
		       
		        e.printStackTrace();
		      }
		    }
		}
		
		if (files.length>0) {//仅当用户上传有图片才能发布房屋信息
			roominfo.setImage(filepath);//添加存储图片路径
			String user = (String)session.getAttribute("userName");
	        roominfo.setUser(user);
	        Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd H:m:s");
			String time = format.format(date);
			roominfo.setTime(time);
			int publish = this.roomService.publish(roominfo);
			if (publish > 0) {
				return "redirect:showUserRoomList";//重定向
			}
		}
		
		
		return "login";
		
	}
	
}

package com.cn.hnust.controller.touristController;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cn.hnust.pojo.Roominfo;
import com.cn.hnust.pojo.Sysinfo;
import com.cn.hnust.service.RoomService;
import com.cn.hnust.service.SysinfoService;

@Controller
public class TourRoomInfoBrow {
	
	@Resource
	private RoomService roomService;
	@Resource
	private SysinfoService sysinfoService;
	
	@RequestMapping("/showTourRoom")
	public String toShowTourRoom(HttpSession session,HttpServletRequest request,Model model){
		
		session.setAttribute("type", "tour");
		
		List<Sysinfo> sysinfos = this.sysinfoService.getAllSysInfo();
		model.addAttribute("sysinfos",sysinfos);
		
		List<Roominfo> listRoominfo = this.roomService.getAllRoomInfo();
		int roomSize = listRoominfo.size();
		for(int i=0;i<roomSize;i++){
			String[] imageName = getFile(listRoominfo.get(i).getImage());
			model.addAttribute("imageName"+i,imageName);
		}
		model.addAttribute("listRoominfo",listRoominfo);
		List<Roominfo> roomlist = reverse(listRoominfo);
		for(int i=0;i<roomlist.size();i++){
			String[] imageNameRe = getFile(roomlist.get(i).getImage());
			model.addAttribute("imageNameReverse"+i,imageNameRe);
		}
		model.addAttribute("listRoominfoReverse",roomlist);
		return "main_tour";
	}
	
	private List<Roominfo> reverse(List<Roominfo> listRoominfo){
		
		List<Roominfo> roomList= new ArrayList<>();
		for(int i=0;i<listRoominfo.size();i++){
			roomList.add(listRoominfo.get(listRoominfo.size()-i-1));
		}
		
		return roomList;
	}
	
	//获取所有图片名及父文件夹
		private String[]  getFile(String path){  
			//获取父文件夹名
			String parent="";
	        for(int i=0;i<path.length();i++){
	        	if (path.charAt(path.length()-i-1)!='\\') {
					parent += path.charAt(path.length()-i-1);
				}else {
					break;
				}
	        }
	        StringBuffer ss = new StringBuffer(parent);
	        parent = ss.reverse().toString();
	        
	        File file = new File(path);   
	        File[] array = file.listFiles();   
	        String[] filename = new String[array.length];
	        
	        for(int i=0;i<array.length;i++){   
	            if(array[i].isFile()){   
	                filename[i] = parent+"\\"+array[i].getName();
	            }else if(array[i].isDirectory()){   
	                getFile(array[i].getPath());   
	            }   
	        }   
	        return filename;
	    }

}

package com.cn.hnust.controller.userController;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cn.hnust.pojo.Room_reply;
import com.cn.hnust.pojo.Roominfo;
import com.cn.hnust.pojo.Searchkey;
import com.cn.hnust.pojo.Sysinfo;
import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IUserService;
import com.cn.hnust.service.RoomService;
import com.cn.hnust.service.Room_replyService;
import com.cn.hnust.service.SysinfoService;

@Controller
public class UserRoomInfoBrow {
	
	@Resource
	private IUserService userService;
	@Resource
	private RoomService roomService;
	@Resource
	private Room_replyService room_replyService;
	@Resource
	private SysinfoService sysinfoService;
	
	
	@RequestMapping("/showUserRoomList")
	public String toShowUserRoomList(HttpSession session,Model model) {
		
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
		if ((String)session.getAttribute("userName") != null || (String)session.getAttribute("manager") != null) {
			return "main_user";
		}else if((String)session.getAttribute("type") == "tour"){
			return "main_tour";
		}
		return "login";
	}
	@RequestMapping("/showUserRoomDetail")
	public String toShowUserRoomDetail(HttpServletRequest request,HttpSession session,Model model) {
		
		if ((String)session.getAttribute("type") == null) {
			return "login";
		}
		
		int room_id = Integer.parseInt(request.getParameter("room_id"));
		Roominfo roominfo = this.roomService.getRoomById(room_id);
		List<Room_reply> listRoom_reply = this.room_replyService.getAllReplyByRoomid(room_id);
		String[] imageName = getFile(roominfo.getImage());
		for(String i:imageName){
			System.out.println(i);
		}
		int replyLength = listRoom_reply.size();
		model.addAttribute("replyLength", replyLength);
		model.addAttribute("imageName",imageName);
		model.addAttribute("roominfo",roominfo);
		model.addAttribute("listRoom_reply",listRoom_reply);
		if ((String)session.getAttribute("userName") != null || (String)session.getAttribute("manager") != null) {
			return "roomdetail";
		}else if((String)session.getAttribute("type") == "tour"){
			return "roomdetail_tour";
		}
		return "login";
		
	}
	//关键字搜索
	@RequestMapping("/searchRoomByKeyword")
	public String tosearchRoomByKeyword(Searchkey searchkey,HttpSession session,Model model){
		
		List<Sysinfo> sysinfos = this.sysinfoService.getAllSysInfo();
		model.addAttribute("sysinfos",sysinfos);
		//开始
		List<Roominfo> listRoominfo = this.roomService.getRoomInfoByKeyword(searchkey);
		//结束
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
		if ((String)session.getAttribute("userName") != null || (String)session.getAttribute("manager") != null) {
			return "main_user";
		}else if((String)session.getAttribute("type") == "tour"){
			return "main_tour";
		}
		return "login";
	}
	//多条件选择
	@RequestMapping("/searchRoomByMuti")
	public String tosearchRoomByMuti(Roominfo roominfo,HttpSession session,Model model) {
		
		List<Sysinfo> sysinfos = this.sysinfoService.getAllSysInfo();
		model.addAttribute("sysinfos",sysinfos);
		//开始
		List<Roominfo> listRoominfo = roomSearchMuti(roominfo);
//		List<Roominfo> listRoominfo = this.roomService.getRoomInfoByMulti(roominfo);
		//结束
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
		if ((String)session.getAttribute("userName") != null || (String)session.getAttribute("manager") != null) {
			return "main_user";
		}else if((String)session.getAttribute("type") == "tour"){
			return "main_tour";
		}
		return "login";
		
	}
	private List<Roominfo> roomSearchMuti(Roominfo roominfo){
		List<Roominfo> rr = new ArrayList<>();
		String A = roominfo.getRoomtype();
		String B = roominfo.getRenttype();
		String C = roominfo.getFit();
		String D = roominfo.getRoomstyle();
		System.out.println(A+","+B+","+C+","+D);
		if (A!=null&&B!=null&&C==null&&D==null) {
			rr = this.roomService.selectByAB(roominfo);
		}else if (A!=null&&B==null&&C!=null&&D==null) {
			rr = this.roomService.selectByAC(roominfo);
		}else if (A!=null&&B==null&&C==null&&D!=null) {
			rr = this.roomService.selectByAD(roominfo);
		}else if (A==null&&B!=null&&C!=null&&D==null) {
			rr = this.roomService.selectByBC(roominfo);
		}else if (A==null&&B!=null&&C==null&&D!=null) {
			rr = this.roomService.selectByBD(roominfo);
		}else if (A==null&&B==null&&C!=null&&D!=null) {
			rr = this.roomService.selectByCD(roominfo);
		}
		else if (A!=null&&B!=null&&C!=null&&D==null) {
			rr = this.roomService.selectByABC(roominfo);
		}else if (A!=null&&B!=null&&C==null&&D!=null) {
			rr = this.roomService.selectByABD(roominfo);
		}else if (A!=null&&B==null&&C!=null&&D!=null) {
			rr = this.roomService.selectByACD(roominfo);
		}else if (A==null&&B!=null&&C!=null&&D!=null) {
			rr = this.roomService.selectByBCD(roominfo);
		}else if (A!=null&&B!=null&&C!=null&&D!=null) {
			rr = this.roomService.selectByABCD(roominfo);
		}
		
		else if (A!=null&&B==null&&C==null&&D==null) {
			rr = this.roomService.getRoomInfoByRoomtype(A);
		}else if (A==null&&B!=null&&C==null&&D==null) {
			rr = this.roomService.getRoomInfoByRenttype(B);
		}else if (A==null&&B==null&&C!=null&&D==null) {
			rr = this.roomService.getRoomInfoByFit(C);
		}else if (A==null&&B==null&&C==null&&D!=null) {
			rr = this.roomService.getRoomInfoByRoomstyle(D);
		}else if (A==null&&B==null&&C==null&&D==null) {
			rr = this.roomService.getAllRoomInfo();
		}
		return rr;
	}
	
	
	
	@RequestMapping("/showSearchRoomList")
	public String toShowSearchRoomList(HttpServletRequest request,HttpSession session,Model model) {

		List<Roominfo> listRoominfo = new ArrayList<>();
		Enumeration<String> enum_searchid = request.getParameterNames();
		if (enum_searchid.hasMoreElements()) {
			String searchid = enum_searchid.nextElement();
			System.out.println(searchid);
			if (searchid.equals("roomtype")) {
				listRoominfo = this.roomService.getRoomInfoByRoomtype(request.getParameter(searchid));
			}else if (searchid.equals("renttype")) {
				listRoominfo = this.roomService.getRoomInfoByRenttype(request.getParameter(searchid));
			}else if (searchid.equals("fit")) {
				listRoominfo = this.roomService.getRoomInfoByFit(request.getParameter(searchid));
			}else if (searchid.equals("roomstyle")) {
				listRoominfo = this.roomService.getRoomInfoByRoomstyle(request.getParameter(searchid));
			}
		}
		
		int roomSize = listRoominfo.size();
		for(int i=0;i<roomSize;i++){
			String[] imageName = getFile(listRoominfo.get(i).getImage());
			System.out.println("imageName长度"+imageName.length);
			model.addAttribute("imageName"+i,imageName);
		}
		
		List<Roominfo> roomlist = reverse(listRoominfo);
		for(int i=0;i<roomlist.size();i++){
			String[] imageNameRe = getFile(roomlist.get(i).getImage());
			model.addAttribute("imageNameReverse"+i,imageNameRe);
		}
		model.addAttribute("listRoominfoReverse",roomlist);
		model.addAttribute("listRoominfo",listRoominfo);
		if ((String)session.getAttribute("userName") != null || (String)session.getAttribute("manager") != null) {
			return "main_user";
		}else if((String)session.getAttribute("type") == "tour"){
			return "main_tour";
		}
		return "login";
		
	}
	@RequestMapping("/showMyRoomList")
	public String toShowRoomListByUser(HttpServletRequest request,HttpSession session,Model model) {
		if ((String)session.getAttribute("userName") == null && (String)session.getAttribute("manager") == null) {
			return "login";
		}else if ((String)session.getAttribute("manager") != null) {
			return "redirect:managerPage";
		}
		//获取当前用户的资料
		String user = (String)session.getAttribute("userName");
		User mydata = this.userService.getUserByName(user);
		model.addAttribute("mydata",mydata);
		
		List<Roominfo> myListRoominfo = this.roomService.getRoomInfoByUser(user);
		List<Roominfo> roomlist = reverse(myListRoominfo);
		for(int i=0;i<roomlist.size();i++){
			String[] imageNameRe = getFile(roomlist.get(i).getImage());
			model.addAttribute("myImageName"+i,imageNameRe);
		}
		int myroomnum = myListRoominfo.size();
		model.addAttribute("myListRoominfo",roomlist);
		model.addAttribute("myroomnum",myroomnum);
		//传送更新结果信息
		String updateResult = request.getParameter("updateResult");
		model.addAttribute("updateResult", updateResult);
		
		return "myroom";
		
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

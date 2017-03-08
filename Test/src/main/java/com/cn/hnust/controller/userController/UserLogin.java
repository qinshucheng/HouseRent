package com.cn.hnust.controller.userController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IUserService;

@Controller
public class UserLogin {
	
	@Resource
	private IUserService userService;
	
	/**访问登录页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login_toLogin")
	public ModelAndView toLogin()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");//设置登录页
		return mv;
	}
	
	/**
	 * 用户登录
	 * @param user
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/ulogin",method=RequestMethod.POST)
    public String userLogin(HttpSession session,User user) throws Exception {
        User user1=userService.checkUserLogin(user.getUserName(), user.getPassword());
        System.out.println(Thread.currentThread().getContextClassLoader().getResource("")); 
        
        if(user1!=null ){
            System.out.println("成功登陆");
            System.out.println(user1.getUserName()+",,,"+user1.getPassword());
            session.setAttribute("userName", user.getUserName());
            session.setAttribute("type", "user");
            return "redirect:showUserRoomList";
        }
        System.out.println("登陆失败");
        return "login";
    }
	
}

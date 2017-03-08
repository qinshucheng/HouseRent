package com.cn.hnust.controller.managerController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cn.hnust.pojo.Manager;
import com.cn.hnust.service.IManagerService;

@Controller
public class ManagerLogin {
	
	@Resource
	private IManagerService managerService;
	
	@RequestMapping(value="/managerlogin",method=RequestMethod.POST)
    public String login(HttpSession session,Manager manager,Model model) throws Exception {
        Manager manager1=managerService.checkManagerLogin(manager.getManager(), manager.getPassword());
        if(manager1!=null ){
            model.addAttribute(manager1);
            session.setAttribute("manager", manager1.getManager());
            session.setAttribute("type", "manager");
            return "redirect:managerPage";
        }
        return "login";
    }

}

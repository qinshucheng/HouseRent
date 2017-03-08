package com.cn.hnust.service;

import java.util.List;

import com.cn.hnust.pojo.Manager;

public interface IManagerService {
	
	public Manager getManagerById(int managerId);
	//获取所有管理员信息
	public List<Manager> getAllManager();
	
	/**
	 * 管理员登录验证
	 * @param manager
	 * @param password
	 * @return
	 */
	public Manager checkManagerLogin(String manager,String password);

}

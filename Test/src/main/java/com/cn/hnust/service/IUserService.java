package com.cn.hnust.service;

import java.util.List;

import com.cn.hnust.pojo.User;

public interface IUserService {
	public User getUserById(int userId);
	
	/**
	 * 获取所有用户信息
	 * @return
	 */
	public List<User> getAllUser();
	
	/**
	 * 用户登录验证
	 * @param username
	 * @param password
	 * @return
	 */
	public User checkUserLogin(String userName,String password);
	
	/**
	 * 注册验证用户是否存在
	 * @param userName
	 * @return
	 */
	public int userRegister(User user);
	
	/**
	 * 更新资料
	 * @param user
	 * @return
	 */
	public int updateMydata(User user);
	
	/**
	 * 删除用户
	 * @param userId
	 * @return
	 */
	public int deleteUserById(int userId);
	
	/**
	 * @param userName
	 * @return
	 */
	public User getUserByName(String userName);
	
}

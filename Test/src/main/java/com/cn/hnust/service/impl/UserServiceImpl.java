package com.cn.hnust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hnust.dao.IUserDao;
import com.cn.hnust.pojo.User;
import com.cn.hnust.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {
	
	@Resource
	private IUserDao userDao;
	@Override
	public User getUserById(int userId) {
		return this.userDao.selectByPrimaryKey(userId);
	}
	@Override
	public User getUserByName(String userName) {
		return this.userDao.findUserByName(userName);
	}
	@Override
	public List<User> getAllUser() {
		return this.userDao.getAllUser();
	}
	@Override
	public User checkUserLogin(String userName, String password) {
		User user = this.userDao.findUserByName(userName);
		if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
	}
	@Override
	public int userRegister(User user) {
		User user1 = this.userDao.findUserByName(user.getUserName());
		int insert = 0;
		if (user1 == null) {
			insert = this.userDao.insertSelective(user);
			System.out.println("insert::"+insert);
		}
		return insert;
	}
	@Override
	public int updateMydata(User user) {
		int userid = this.userDao.findUserByName(user.getUserName()).getId();
		user.setId(userid);
		return this.userDao.updateByPrimaryKeySelective(user);
	}
	@Override
	public int deleteUserById(int userId) {
		return this.userDao.deleteByPrimaryKey(userId);
	}
}

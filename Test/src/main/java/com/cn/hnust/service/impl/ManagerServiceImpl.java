package com.cn.hnust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hnust.dao.IManagerDao;
import com.cn.hnust.pojo.Manager;
import com.cn.hnust.service.IManagerService;

@Service("managerService")
public class ManagerServiceImpl implements IManagerService{
	
	@Resource
	private IManagerDao managerDao;

	@Override
	public List<Manager> getAllManager() {
		return this.managerDao.getAllManager();
	}

	@Override
	public Manager getManagerById(int managerId) {
		return this.managerDao.selectByPrimaryKey(managerId);
	}

	@Override
	public Manager checkManagerLogin(String manager, String password) {
		Manager man = this.managerDao.findManagerByName(manager);
		if (man!=null && man.getPassword().equals(password)) {
			return man;
		}
		return null;
	}

}

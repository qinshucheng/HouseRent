package com.cn.hnust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hnust.dao.SysinfoDao;
import com.cn.hnust.pojo.Sysinfo;
import com.cn.hnust.service.SysinfoService;

@Service("sysinfoService")
public class SysinfoServiceImpl implements SysinfoService{
	
	@Resource
	private SysinfoDao sysinfoDao;
	@Override
	public List<Sysinfo> getAllSysInfo() {
		return this.sysinfoDao.getAllSysinfo();
	}
	@Override
	public int addSysinfo(Sysinfo sysinfo) {
		return this.sysinfoDao.insertSelective(sysinfo);
	}
	@Override
	public int deleteSysinfo(int sysinfo_id) {
		return this.sysinfoDao.deleteByPrimaryKey(sysinfo_id);
	}

}

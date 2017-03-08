package com.cn.hnust.service;

import java.util.List;

import com.cn.hnust.pojo.Sysinfo;

public interface SysinfoService {
	
	public List<Sysinfo> getAllSysInfo();
	
	public int addSysinfo(Sysinfo sysinfo);
	
	public int deleteSysinfo(int sysinfo_id);
}

package com.cn.hnust.dao;

import java.util.List;

import com.cn.hnust.pojo.Sysinfo;

public interface SysinfoDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Sysinfo record);

    int insertSelective(Sysinfo record);

    Sysinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Sysinfo record);

    int updateByPrimaryKey(Sysinfo record);
    
    List<Sysinfo> getAllSysinfo();
}
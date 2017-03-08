package com.cn.hnust.dao;

import java.util.List;

import com.cn.hnust.pojo.Manager;

public interface IManagerDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Manager record);

    int insertSelective(Manager record);

    Manager selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);
    
    //获取所有管理员
    List<Manager> getAllManager();
    
    Manager findManagerByName(String manager);
}
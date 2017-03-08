package com.cn.hnust.dao;

import java.util.List;

import com.cn.hnust.pojo.User;

public interface IUserDao {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    //获取所有用户
    List<User> getAllUser();
    
    User findUserByName(String userName);
}
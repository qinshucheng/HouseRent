package com.cn.hnust.dao;

import java.util.List;

import com.cn.hnust.pojo.Roominfo;

public interface RoominfoDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Roominfo record);

    int insertSelective(Roominfo record);

    Roominfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Roominfo record);

    int updateByPrimaryKey(Roominfo record);
    
    //获取所有帖子
    List<Roominfo> getAllRoomInfo();
    //根据房型获取房屋
    List<Roominfo> selectByRoomtype(String roomtype);
    //根据租赁方式获取房屋
    List<Roominfo> selectByRenttype(String renttype);
    //根据装修获取房屋
    List<Roominfo> selectByFit(String fit);
    //根据类型获取房屋
    List<Roominfo> selectByRoomstyle(String roomstyle);
    //根据发布用户获取房屋
    List<Roominfo> selectByUser(String user);
    
    //根据根据关键字搜索房屋
    List<Roominfo> selectByKeyword(String keyword);
    //多条件搜索
    List<Roominfo> selectByMulti(Roominfo roominfo);
    
    //二
    List<Roominfo> selectByAB(String A,String B);
    List<Roominfo> selectByAC(String A,String C);
    List<Roominfo> selectByAD(String A,String D);
    List<Roominfo> selectByBC(String B,String C);
    List<Roominfo> selectByBD(String B,String D);
    List<Roominfo> selectByCD(String C,String D);
    //三
    List<Roominfo> selectByABC(String A,String B,String C);
    List<Roominfo> selectByABD(String A,String B,String D);
    List<Roominfo> selectByACD(String A,String B,String D);
    List<Roominfo> selectByBCD(String B,String C,String D);
    //四
    List<Roominfo> selectByABCD(String A,String B,String C,String D);
    
}
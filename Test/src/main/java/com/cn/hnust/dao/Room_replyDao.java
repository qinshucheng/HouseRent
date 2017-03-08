package com.cn.hnust.dao;

import java.util.List;

import com.cn.hnust.pojo.Room_reply;

public interface Room_replyDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Room_reply record);

    int insertSelective(Room_reply record);

    Room_reply selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Room_reply record);

    int updateByPrimaryKey(Room_reply record);
    
    //根据帖子id获取对应的回复
    List<Room_reply> selectAllByRoom_id(Integer room_id);
}
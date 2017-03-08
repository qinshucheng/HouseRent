package com.cn.hnust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hnust.dao.Room_replyDao;
import com.cn.hnust.pojo.Room_reply;
import com.cn.hnust.service.Room_replyService;

@Service("room_replyService")
public class Room_replyServiceImpl implements Room_replyService{
	
	@Resource
	private Room_replyDao room_replyDao;
	@Override
	public int addReply(Room_reply room_reply) {
		return this.room_replyDao.insert(room_reply);
	}
	@Override
	public List<Room_reply> getAllReplyByRoomid(int room_id) {
		return this.room_replyDao.selectAllByRoom_id(room_id);
	}

}

package com.cn.hnust.service;

import java.util.List;

import com.cn.hnust.pojo.Room_reply;

public interface Room_replyService {
	
	
	/**
	 * 添加评论
	 * @param room_reply
	 * @return
	 */
	public int addReply(Room_reply room_reply);
	
	/**
	 * 根据帖子id获取对应的回复
	 * @param room_id
	 * @return
	 */
	public List<Room_reply> getAllReplyByRoomid(int room_id);
}

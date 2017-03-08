package com.cn.hnust.service;

import java.util.List;

import com.cn.hnust.pojo.Roominfo;
import com.cn.hnust.pojo.Searchkey;

public interface RoomService {
	
	/**
	 * 获取房屋信息
	 * @param roomId
	 * @return
	 */
	public Roominfo getRoomById(int roomId);
	
	/**
	 * 更新我的房屋信息
	 * @param roominfo
	 * @return
	 */
	public int updateRoomById(Roominfo roominfo);
	
	/**
	 * 删除房屋信息
	 * @param roomId
	 * @return
	 */
	public int deleteRoomById(int roomId);
	
	/**
	 * 发布房屋租赁信息帖子
	 * @param roominfo
	 * @return
	 */
	public int publish(Roominfo roominfo);
	
	/**
	 * 获取所有房屋
	 * @return
	 */
	public List<Roominfo> getAllRoomInfo();
	
	/**
	 * 根据关键字搜索房屋信息
	 * @param keyword
	 * @return
	 */
	public List<Roominfo> getRoomInfoByKeyword(Searchkey searchkey);
	
	/**
	 * 多条件搜索
	 * @param roominfo
	 * @return
	 */
	public List<Roominfo> getRoomInfoByMulti(Roominfo roominfo);
	
	/**
	 * 根据房型获取房屋
	 * @return
	 */
	public List<Roominfo> getRoomInfoByRoomtype(String roomtype);
	
	public List<Roominfo> getRoomInfoByRenttype(String renttype);
	
	public List<Roominfo> getRoomInfoByFit(String fit);
	
	public List<Roominfo> getRoomInfoByRoomstyle(String roomstyle);
	
	public List<Roominfo> getRoomInfoByUser(String user);
	
	//e二
	public List<Roominfo> selectByAB(Roominfo roominfo);
	public List<Roominfo> selectByAC(Roominfo roominfo);
	public List<Roominfo> selectByAD(Roominfo roominfo);
	public List<Roominfo> selectByBC(Roominfo roominfo);
	public List<Roominfo> selectByBD(Roominfo roominfo);
	public List<Roominfo> selectByCD(Roominfo roominfo);
	
	public List<Roominfo> selectByABC(Roominfo roominfo);
	public List<Roominfo> selectByABD(Roominfo roominfo);
	public List<Roominfo> selectByACD(Roominfo roominfo);
	public List<Roominfo> selectByBCD(Roominfo roominfo);
	
	public List<Roominfo> selectByABCD(Roominfo roominfo);
}

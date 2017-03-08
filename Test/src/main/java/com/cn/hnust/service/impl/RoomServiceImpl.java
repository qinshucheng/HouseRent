package com.cn.hnust.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.hnust.dao.RoominfoDao;
import com.cn.hnust.pojo.Roominfo;
import com.cn.hnust.pojo.Searchkey;
import com.cn.hnust.service.RoomService;

@Service("roomService")
public class RoomServiceImpl implements RoomService{
	
	@Resource
	private RoominfoDao roomDao;
	
	@Override
	public Roominfo getRoomById(int roomId) {
		return this.roomDao.selectByPrimaryKey(roomId);
	}

	@Override
	public int publish(Roominfo roominfo) {
		int publish = this.roomDao.insertSelective(roominfo);
		return publish;
	}

	@Override
	public List<Roominfo> getAllRoomInfo() {
		return this.roomDao.getAllRoomInfo();
	}

	@Override
	public List<Roominfo> getRoomInfoByRoomtype(String roomtype) {
		return this.roomDao.selectByRoomtype(roomtype);
	}

	@Override
	public List<Roominfo> getRoomInfoByRenttype(String renttype) {
		return this.roomDao.selectByRenttype(renttype);
	}

	@Override
	public List<Roominfo> getRoomInfoByFit(String fit) {
		return this.roomDao.selectByFit(fit);
	}

	@Override
	public List<Roominfo> getRoomInfoByRoomstyle(String roomstyle) {
		return this.roomDao.selectByRoomstyle(roomstyle);
	}

	@Override
	public List<Roominfo> getRoomInfoByUser(String user) {
		return this.roomDao.selectByUser(user);
	}

	@Override
	public int updateRoomById(Roominfo roominfo) {
		return this.roomDao.updateByPrimaryKeySelective(roominfo);
	}

	@Override
	public int deleteRoomById(int roomId) {
		return this.roomDao.deleteByPrimaryKey(roomId);
	}
	
	@Override
	public List<Roominfo> getRoomInfoByKeyword(Searchkey searchkey) {
		return this.roomDao.selectByKeyword(searchkey.getKeyword());
	}

	@Override
	public List<Roominfo> selectByAB(Roominfo roominfo) {
		return this.roomDao.selectByAB(roominfo.getRoomtype(),roominfo.getRenttype());
	}

	@Override
	public List<Roominfo> selectByAC(Roominfo roominfo) {
		return this.roomDao.selectByAC(roominfo.getRoomtype(), roominfo.getFit());
	}

	@Override
	public List<Roominfo> selectByAD(Roominfo roominfo) {
		return this.roomDao.selectByAD(roominfo.getRoomtype(), roominfo.getRoomstyle());
	}

	@Override
	public List<Roominfo> selectByBC(Roominfo roominfo) {
		return this.roomDao.selectByBC(roominfo.getRenttype(), roominfo.getFit());
	}

	@Override
	public List<Roominfo> selectByBD(Roominfo roominfo) {
		return this.roomDao.selectByBD(roominfo.getRenttype(), roominfo.getRoomstyle());
	}

	@Override
	public List<Roominfo> selectByCD(Roominfo roominfo) {
		return this.roomDao.selectByCD(roominfo.getFit(), roominfo.getRoomstyle());
	}

	@Override
	public List<Roominfo> selectByABC(Roominfo roominfo) {
		return roomDao.selectByABC(roominfo.getRoomtype(), roominfo.getRenttype(), roominfo.getFit());
	}

	@Override
	public List<Roominfo> selectByABD(Roominfo roominfo) {
		return this.roomDao.selectByABD(roominfo.getRoomtype(), roominfo.getRenttype(), roominfo.getRoomstyle());
	}

	@Override
	public List<Roominfo> selectByACD(Roominfo roominfo) {
		return this.roomDao.selectByACD(roominfo.getRoomtype(), roominfo.getRenttype(), roominfo.getFit());
	}

	@Override
	public List<Roominfo> selectByBCD(Roominfo roominfo) {
		return this.roomDao.selectByBCD(roominfo.getRenttype(), roominfo.getFit(), roominfo.getRoomstyle());
	}

	@Override
	public List<Roominfo> selectByABCD(Roominfo roominfo) {
		return this.roomDao.selectByABCD(roominfo.getRoomtype(), roominfo.getRenttype(), roominfo.getFit(), roominfo.getRoomstyle());
	}

	@Override
	public List<Roominfo> getRoomInfoByMulti(Roominfo roominfo) {
		return this.roomDao.selectByMulti(roominfo);
	}

}

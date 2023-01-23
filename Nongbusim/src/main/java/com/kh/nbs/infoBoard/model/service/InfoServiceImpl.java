package com.kh.nbs.infoBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.infoBoard.model.dao.InfoDao;
import com.kh.nbs.infoBoard.model.vo.Info;

@Service
public class InfoServiceImpl implements InfoService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private InfoDao infoDao;

	@Override
	public int selectListCount(HashMap<String, String> map) {
		return infoDao.selectListCount(map, sqlSession);
	}

	@Override
	public ArrayList<Info> selectList(PageInfo pi, HashMap<String, String> map) {
		return infoDao.selectList(pi, map, sqlSession);
	}
	
	@Override
	public int increaseCount(int infoNo) {
		return infoDao.increaseCount(infoNo, sqlSession);
	}
	
	@Override
	public Info selecetInfo(int infoNo) {
		return infoDao.selecetInfo(infoNo, sqlSession);
	}
	
	@Override
	public ArrayList<Attachment> selectAttachment(int infoNo){
		return infoDao.selectAttachment(infoNo, sqlSession);
	}
	
	@Override
	public ArrayList<Attachment> selectImg(int infoNo){
		return infoDao.selectImg(infoNo, sqlSession);
	}

	@Override
	public int insertInfo(Info info) {
		return infoDao.insertInfo(info, sqlSession);
	}
	
	@Override
	public int insertAttachment(ArrayList<Attachment> upfileList) {
		return infoDao.insertAttachment(upfileList, sqlSession);
	}

	@Override
	public int deleteInfo(int infoNo) {
		return infoDao.deleteInfo(infoNo, sqlSession);
	}

	@Override
	public int updateInfo(Info info) {
		return infoDao.updateInfo(info, sqlSession);
	}
	
	@Override
	public ArrayList<Info> selectMainList() {
		return infoDao.selectMainList(sqlSession);
	}
	
	@Override
	public int selectSearchListCount(HashMap map) {
		return infoDao.selectSearchListCount(map, sqlSession);
	}
	
	@Override
	public ArrayList<Info> selectSearchList(PageInfo pi, HashMap map) {
		return infoDao.selectSearchList(pi, map, sqlSession);
	}
	
	


}

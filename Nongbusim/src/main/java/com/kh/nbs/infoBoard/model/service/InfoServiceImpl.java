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
	public int selectListCount() {
		return infoDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Info> selectList(PageInfo pi) {
		return infoDao.selectList(pi, sqlSession);
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
	public int insertInfo(Info i) {
		return infoDao.insertInfo(i, sqlSession);
	}
	
	@Override
	public int insertAttachment(Attachment a) {
		return infoDao.insertAttachment(a, sqlSession);
	}

	@Override
	public int deleteInfo(int infoNo) {
		return 0;
	}

	@Override
	public int updateInfo(Info i) {
		return 0;
	}
	
	@Override
	public ArrayList<Info> selectSearchList(HashMap map) {
		return infoDao.selectSearchList(map, sqlSession);
	}
	


}

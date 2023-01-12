package com.kh.nbs.infoBoard.model.service;

import java.util.ArrayList;

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
		return 0;
	}

	@Override
	public ArrayList<Info> selectList(PageInfo pi) {
		return null;
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
	public int increaseCount(int infoNo) {
		return 0;
	}

	@Override
	public Info selecetInfo(int infoNo) {
		return null;
	}

	@Override
	public int deleteInfo(int infoNo) {
		return 0;
	}

	@Override
	public int updateInfo(Info i) {
		return 0;
	}
	


}

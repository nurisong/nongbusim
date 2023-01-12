package com.kh.nbs.infoBoard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.infoBoard.model.vo.Info;

@Repository
public class InfoDao {

	public int insertInfo(Info i, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("infoMapper.insertInfo", i);
	}

	public int insertAttachment(Attachment a, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("infoMapper.insertAttachment", a);
	}

}

package com.kh.nbs.farm.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.farm.model.vo.Farm;

@Repository
public class FarmDao {

	public int insertAttachment(Attachment a, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("attachmentMapper.insertAttachment", a);
	}

	public int insertFarm(Farm f, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("farmMapper.insertFarm", f);
	}

}

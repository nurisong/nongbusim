package com.kh.nbs.farm.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.farm.model.vo.Farm;

@Repository
public class FarmDao {

	public int insertAttachment(Attachment a, SqlSessionTemplate sqlSession) {
		System.out.println(a.getOriginName());
		System.out.println(a.getChangeName());
		System.out.println(a.getBoardType().equals("F"));
		return sqlSession.insert("attachmentMapper.insertAttachmentFarm", a);
	}

	public int insertFarm(Farm f, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("farmMapper.insertFarm", f);
	}

	public ArrayList<Farm> selectMyFarmList(int memNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("farmMapper.selectMyFarmList", memNo);
	}

}

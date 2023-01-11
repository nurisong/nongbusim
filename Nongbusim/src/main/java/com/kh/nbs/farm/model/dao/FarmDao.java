package com.kh.nbs.farm.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.farm.model.vo.Farm;

@Repository
public class FarmDao {

	public int selectFarmCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("farmMapper.selectFarmCount");
	}
	
	public ArrayList<Farm> selectFarmList(PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("farmMapper.selectFarmList", null, rowBounds);
	}
	
	public ArrayList<Attachment> selectAttachmentList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("farmMapper.selectAttachmentList");
	}
	
	public int insertAttachment(Attachment a, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("attachmentMapper.insertAttachmentFarm", a);
	}

	public int insertFarm(Farm f, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("farmMapper.insertFarm", f);
	}

	public ArrayList<Farm> selectMyFarmList(int memNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("farmMapper.selectMyFarmList", memNo);
	}

	public Farm selectFarm(int farmNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("farmMapper.selectFarm", farmNo);
	}
	
	public ArrayList<Attachment> selectAttachment(int farmNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("farmMapper.selectAttachment", farmNo);
	}




}

package com.kh.nbs.infoBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.infoBoard.model.vo.Info;

@Repository
public class InfoDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("infoMapper.selectListCount");
	}
	
	public ArrayList<Info> selectList(PageInfo pi, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("infoMapper.selectList", null, rowBounds);
	}
	
	public int increaseCount(int infoNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("infoMapper.increaseCount", infoNo);
	}
	
	public Info selecetInfo(int infoNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("infoMapper.selecetInfo", infoNo);
	}

	public ArrayList<Attachment> selectAttachment(int infoNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("infoMapper.selectAttachment", infoNo);
	}

	public ArrayList<Attachment> selectImg(int infoNo, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("infoMapper.selectImg", infoNo);
	}

	public int insertInfo(Info i, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("infoMapper.insertInfo", i);
	}

	public int insertAttachment(Attachment a, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("attachmentMapper.insertAttachmentInfo", a);
	}

	public ArrayList<Info> selectSearchList(HashMap map, SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("infoMapper.selectSearchList", map);
	}

}

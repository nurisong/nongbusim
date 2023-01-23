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
	
	public int selectListCount(HashMap<String, String> map, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("infoMapper.selectListCount", map);
	}
	
	public ArrayList<Info> selectList(PageInfo pi, HashMap<String, String> map, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("infoMapper.selectList", map, rowBounds);
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

	public int insertInfo(Info info, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("infoMapper.insertInfo", info);
	}

	public int insertAttachment(ArrayList<Attachment> upfileList, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("infoMapper.insertAttachment", upfileList);
	}
	
	public int updateInfo(Info info, SqlSessionTemplate sqlSession) {
		return sqlSession.update("infoMapper.updateInfo", info);
	}
	
	public int deleteInfo(int infoNo, SqlSessionTemplate sqlSession) {
		return sqlSession.update("infoMapper.deleteInfo", infoNo);
	}

	public int selectSearchListCount(HashMap map, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("infoMapper.selectSearchListCount", map);
	}
	
	public ArrayList<Info> selectSearchList(PageInfo pi, HashMap map, SqlSessionTemplate sqlSession) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("infoMapper.selectSearchList", map, rowBounds);
	}

	public ArrayList<Info> selectMainList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("infoMapper.selectMainList");
	}






}

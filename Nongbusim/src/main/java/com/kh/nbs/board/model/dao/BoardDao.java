package com.kh.nbs.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.board.model.vo.Board;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	public int selectListCount(SqlSessionTemplate sqlSession, String boardType) {
		return sqlSession.selectOne("boardMapper.selectListCount",boardType);
	}
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, String boardType, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", boardType, rowBounds);
	}
	
	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return (Board)sqlSession.selectOne("boardMapper.selectBoard",boardNo);
	}
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseCount",boardNo);
	}
	public ArrayList<Attachment> selectAttachmentDetailBoard(SqlSessionTemplate sqlSession, Board b) {
		return (ArrayList)sqlSession.selectList("attachmentMapper.selectAttachmentDetailBoard",b);
	}
	
	public int insertBoard(Board b, SqlSessionTemplate sqlSession) {		  
		return sqlSession.insert("boardMapper.insertBoard", b);		  
	}  
	public int insertAttachmentBoard(Attachment a, SqlSessionTemplate sqlSession) {		  
		return sqlSession.insert("attachmentMapper.insertAttachmentBoard", a);				  				  
	}
	
}

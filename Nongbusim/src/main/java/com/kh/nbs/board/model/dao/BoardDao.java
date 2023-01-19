package com.kh.nbs.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.board.model.vo.Board;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.Comment;
import com.kh.nbs.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	public int selectListCount(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("boardMapper.selectListCount",map);
	}
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, HashMap map, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", map, rowBounds);
	}
	
	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return (Board)sqlSession.selectOne("boardMapper.selectBoard",boardNo);
	}
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseCount",boardNo);
	}
	public ArrayList<Attachment> selectAttachmentDetailBoard(SqlSessionTemplate sqlSession, Board b) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectAttachmentDetailBoard",b);
	}
	
	
	public int insertBoard(Board b, SqlSessionTemplate sqlSession) {		  
		return sqlSession.insert("boardMapper.insertBoard", b);		  
	}  
	public int insertAttachmentBoard(Attachment a, SqlSessionTemplate sqlSession) {		  
		return sqlSession.insert("attachmentMapper.insertAttachmentBoard", a);				  				  
	}
	
	public ArrayList<Attachment> attachmentSelectList(SqlSessionTemplate sqlSession){	
		return (ArrayList)sqlSession.selectList("boardMapper.attachmentSelectList");
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard",b);
	}
	public int updateAttachment(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.update("boardMapper.updateAttachment",a);
	}
	
	

	public int deleteBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.deleteBoard",b);
	}
	
	
	public int insertLike(SqlSessionTemplate sqlSession,Board b) {
		return sqlSession.insert("boardMapper.insertLike",b);
	}
	public int deleteLike(SqlSessionTemplate sqlSession,Board b) {
		return sqlSession.update("boardMapper.deleteLike",b);
	}
	public int selectLikeCount(SqlSessionTemplate sqlSession,Board b) {
		return sqlSession.selectOne("boardMapper.selectLikeCount",b);
	}
	public int selectLike(SqlSessionTemplate sqlSession,HashMap map) {
		return sqlSession.selectOne("boardMapper.selectLike",map);
	}
	public int increaseLike(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.increaseLike",b);
	}
	public int decreaseLike(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.decreaseLike",b);
	}
	
	public ArrayList<Comment> selectReplyList(SqlSessionTemplate sqlSession, int boardNo){
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", boardNo);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Comment c) {
		return sqlSession.insert("boardMapper.insertReply", c);
	}
	

}

package com.kh.nbs.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.board.model.dao.BoardDao;
import com.kh.nbs.board.model.vo.Board;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.Comment;
import com.kh.nbs.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount(String boardType) {
		return boardDao.selectListCount(sqlSession, boardType);
	}
	@Override
	public ArrayList<Board> selectList(String boardType, PageInfo pi){
		return boardDao.selectList(sqlSession, boardType, pi);
	}
	
	@Override
	public Board selectBoard(int boardNo) {
		return boardDao.selectBoard(sqlSession, boardNo);
	}
	@Override
	public int increaseCount(int boardNo) {
		return boardDao.increaseCount(sqlSession,boardNo);
	}
	@Override
	public ArrayList<Attachment> selectAttachmentDetailBoard(Board b) {
		return boardDao.selectAttachmentDetailBoard(sqlSession, b);
	}
	
	
	@Override
	public int insertBoard(Board b) {
		return boardDao.insertBoard(b, sqlSession);
	}
	@Override
	public int insertAttachment(Attachment a) {
		return boardDao.insertAttachmentBoard(a, sqlSession);
	}
	
	@Override
	public ArrayList<Attachment> attachmentSelectList() {
		return boardDao.attachmentSelectList(sqlSession);
	}
	

	@Override
	public int deleteAttachment(Board b) {
		return boardDao.deleteAttachment(sqlSession,b);
	}
	@Override
	public int deleteBoard(Board b) {
		return boardDao.deleteBoard(sqlSession,b);
	}
	
	@Override
	public int insertLike(Board b) {
		return boardDao.insertLike(sqlSession,b);
	}
	@Override
	public int deleteLike(Board b) {
		return boardDao.deleteLike(sqlSession,b);
	}
	@Override
	public int selectLikeCount(Board b) {
		return boardDao.selectLikeCount(sqlSession,b);
	}
	@Override
	public int selectLike(Board b) {
		return boardDao.selectLike(sqlSession, b);
	}
	
	@Override
	public ArrayList<Board> selectListOrder(Board b,PageInfo pi){
		return boardDao.selectListOrder(sqlSession,b,pi);
	}
	
	@Override
	public int selectSearchListCount(HashMap map) {
		return boardDao.selectSearchListCount(map, sqlSession);
	}
	
	@Override
	public ArrayList<Board> selectSearchList(PageInfo pi, HashMap map) {
		return boardDao.selectSearchList(pi, map, sqlSession);
	}
	
	@Override
	public ArrayList<Comment> selectReplyList(int boardNo) {
		return boardDao.selectReplyList(sqlSession, boardNo);
	}

	@Override
	public int insertReply(Comment c) {
		return boardDao.insertReply(sqlSession, c);
	}
	

}

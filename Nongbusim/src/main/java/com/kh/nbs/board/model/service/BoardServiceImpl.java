package com.kh.nbs.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.board.model.dao.BoardDao;
import com.kh.nbs.board.model.vo.Board;
import com.kh.nbs.common.model.vo.Attachment;
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

}

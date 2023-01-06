package com.kh.nbs.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.board.model.dao.BoardDao;
import com.kh.nbs.board.model.vo.Board;
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

}

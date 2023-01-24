package com.kh.nbs.market.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.Comment;
import com.kh.nbs.common.model.vo.Mark;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.market.model.vo.Market;

@Repository
public class MarketDao {
	
	

	
 //게시물 인서트
  public int insertMarket(Market market, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.insert("marketMapper.insertMarket", market);
	  
  }


  //게시물 첨부파일 인서트
  public int insertAttachmentMarket(Attachment a, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.insert("attachmentMapper.insertAttachmentMarket", a);
			  
			  
  }
  
  
  
  
  
  
  //페이징처리를 위한 게시물 갯수 검색
  public int selectListCount(SqlSessionTemplate sqlSession) {
	
	  return sqlSession.selectOne("marketMapper.selectListCount");
  }
  
  
  //전부 셀렉해오는 게시판 게시물 메소드
  public ArrayList<Market> marketSelectList(PageInfo pi, SqlSessionTemplate sqlSession){
	  
	  int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	  RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	  
	  return (ArrayList)sqlSession.selectList("marketMapper.marketSelectList", null, rowBounds);
  }
  
  
  //전부 셀렉해오는 게시판 첨부파일 메소드
  public ArrayList<Attachment> attachmentSelectList(SqlSessionTemplate sqlSession){
	  
	  return (ArrayList)sqlSession.selectList("marketMapper.attachmentSelectList");
  }
  
  
  
  
  
  //페이징 처리를 위한 카테고리가 있을 때의 게시물 카운트 하는 메소드
  public int selectListCount(SqlSessionTemplate sqlSession, String marketCategory) {
	  return sqlSession.selectOne("marketMapper.selectListCount", marketCategory);
  }
  
  
  //선택한 카테고리가 있을 때의 게시판 게시물 셀렉 메소드
  public ArrayList<Market> marketSelectListCategory(PageInfo pi, SqlSessionTemplate sqlSession, String marketCategory){
	  
	  int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	  RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	  
	  return (ArrayList)sqlSession.selectList("marketMapper.marketSelectList", marketCategory, rowBounds);
  }
  
  
  //선택한 카테고리가 있을 때의 게시판 첨부파일 셀렉 메소드
  public ArrayList<Attachment> attachmentSelectListCategory(SqlSessionTemplate sqlSession, String marketCategory){
	  
	  return (ArrayList)sqlSession.selectList("marketMapper.attachmentSelectList", marketCategory);
  }
  
  
  
  
  
 
  // 게시물 조회전 조회수 증가시켜주는 메소드
  
  public int increaseCount(Market market, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.update("marketMapper.increaseCount", market);
  }
  
  
  // 게시물 상세조회 메소드
  public Market marketDetailView(Market market, SqlSessionTemplate sqlSession) {
	 
	  return sqlSession.selectOne("marketMapper.marketDetailView", market);
  }
  
  
  //게시물 첨부파일 상세조회 메소드
  public ArrayList<Attachment> marketDetailAttachment(Market market, SqlSessionTemplate sqlSession){
	  
	  return (ArrayList)sqlSession.selectList("marketMapper.marketDetailAttachment", market);
  }
  
  


  //게시물 수정하기 수정 메소드
 public int marketUpdate(Market market, SqlSessionTemplate sqlSession){
	  
	  return sqlSession.update("marketMapper.marketUpdate", market);
 }
  
  
  
  
  

  
  //게시물 삭제 메소드
  public int marketDelete(int marketNo, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.update("marketMapper.marketDelete", marketNo);
  }
  
  // 게시물 첨부파일 삭제 메소드
  public int marketDeleteAttachment(int marketNo, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.delete("marketMapper.marketDeleteAttachment", marketNo);
  }
  
  
  
  
  
  // 댓글 인서트 메소드
  public int ajaxInsertMarketComment(Comment comment, SqlSessionTemplate sqlSession) {
	  return sqlSession.insert("marketMapper.ajaxInsertMarketComment", comment);
  }
  
  
  // 댓글 리스트 조회해오는 메소드
  public ArrayList<Comment> ajaxSelectListMarketComment(Comment comment, SqlSessionTemplate sqlSession){
	  
	  return (ArrayList)sqlSession.selectList("marketMapper.ajaxSelectListMarketComment", comment);
	  
  }
  
  // 댓글 지우는 메소드
  public int ajaxDeleteMarketComment(Comment comment, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.update("marketMapper.ajaxDeleteMarketComment", comment);
  }
  
  //댓글 수정하는 메소드
  public int ajaxUpdateMarketComment(Comment comment, SqlSessionTemplate sqlSession) {
	  return sqlSession.update("marketMapper.ajaxUpdateMarketComment", comment);
  }
  
  
  
  
  
  
  // 찜한 리스트 조회하는 메소드
  public ArrayList<Mark> ajaxMarkMarket(int memNo, SqlSessionTemplate sqlSession) {
	  
	  return (ArrayList)sqlSession.selectList("marketMapper.ajaxMarkMarket", memNo);
  
  }
  
  
  // 찜하기 메소드
  public int ajaxClickMarkMarket(Mark mark, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.insert("marketMapper.ajaxClickMarkMarket", mark);
  }
  
  
  // 찜하기 취소 메소드
  public int ajaxClickUnmarkMarket(Mark mark, SqlSessionTemplate sqlSession) {

  	return sqlSession.delete("marketMapper.ajaxClickUnmarkMarket", mark);
  
	}
 
  
  
  
  
  //게시물 상세조회 안 찜하기 메소드
  public Mark markMarket(Market market, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.selectOne("marketMapper.markMarket", market);
	  
  }

  
  //메인페이지에 뿌려줄 마켓 리스트
  public ArrayList<Market> ajaxMainMarketList(SqlSessionTemplate sqlSession){
	  
	  return (ArrayList)sqlSession.selectList("marketMapper.ajaxMainMarketList");
	  
  }
  
  
  
  
  
}
  
  
 

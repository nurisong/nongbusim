package com.kh.nbs.market.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.Comment;
import com.kh.nbs.common.model.vo.Mark;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.market.model.vo.Market;

@Repository
public class MarketDao {
	
	
	
  public int insertMarket(Market market, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.insert("marketMapper.insertMarket", market);
	  
  }

  
  public int insertAttachmentMarket(Attachment a, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.insert("attachmentMapper.insertAttachmentMarket", a);
			  
			  
  }
  
  
  
  public int selectListCount(SqlSessionTemplate sqlSession) {
	
	  return sqlSession.selectOne("marketMapper.selectListCount");
  }
  
  
  
  public ArrayList<Market> marketSelectList(PageInfo pi, SqlSessionTemplate sqlSession){
	  
	  int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	  RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	  
	  return (ArrayList)sqlSession.selectList("marketMapper.marketSelectList", null, rowBounds);
  }
  
  
  public ArrayList<Attachment> attachmentSelectList(SqlSessionTemplate sqlSession){
	  
	  return (ArrayList)sqlSession.selectList("marketMapper.attachmentSelectList");
  }
  
  
  public int increaseCount(Market market, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.update("marketMapper.increaseCount", market);
  }
  
  
  
  public Market marketDetailView(Market market, SqlSessionTemplate sqlSession) {
	 
	  return sqlSession.selectOne("marketMapper.marketDetailView", market);
  }
 
  public ArrayList<Attachment> marketDetailAttachment(Market market, SqlSessionTemplate sqlSession){
	  
	  return (ArrayList)sqlSession.selectList("marketMapper.marketDetailAttachment", market);
  }
  
  
  public int marketDeleteAttachment(int marketNo, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.delete("marketMapper.marketDeleteAttachment", marketNo);
  }
  
  
  public int marketDelete(int marketNo, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.update("marketMapper.marketDelete", marketNo);
  }
  
  
  public int ajaxInsertMarketComment(Comment comment, SqlSessionTemplate sqlSession) {
	  return sqlSession.insert("marketMapper.ajaxInsertMarketComment", comment);
  }
  
  
  
  public ArrayList<Comment> ajaxSelectListMarketComment(Comment comment, SqlSessionTemplate sqlSession){
	  
	  return (ArrayList)sqlSession.selectList("marketMapper.ajaxSelectListMarketComment", comment);
	  
  }
  
  
  public int ajaxDeleteMarketComment(Comment comment, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.update("marketMapper.ajaxDeleteMarketComment", comment);
  }
  
  
  
  public ArrayList<Mark> ajaxMarkMarket(int memNo, SqlSessionTemplate sqlSession) {
	  
	  return (ArrayList)sqlSession.selectList("marketMapper.ajaxMarkMarket", memNo);
  
  }
  
  public int ajaxClickMarkMarket(Mark mark, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.insert("marketMapper.ajaxClickMarkMarket", mark);
  }
  
  
  
  public int ajaxClickUnmarkMarket(Mark mark, SqlSessionTemplate sqlSession) {

  
  	return sqlSession.delete("marketMapper.ajaxClickUnmarkMarket", mark);
  
	}
 
  public Mark markMarket(Market market, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.selectOne("marketMapper.markMarket", market);
	  
  }
  
  
  public int ajaxUpdateMarketComment(Comment comment, SqlSessionTemplate sqlSession) {
	  return sqlSession.update("marketMapper.ajaxUpdateMarketComment", comment);
  }
  
  
  
}

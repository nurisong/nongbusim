package com.kh.nbs.market.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.common.model.vo.Attachment;
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
  
  
}

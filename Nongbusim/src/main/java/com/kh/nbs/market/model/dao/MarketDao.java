package com.kh.nbs.market.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.market.model.vo.Market;

@Repository
public class MarketDao {
	
  public int insertMarket(Market market, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.insert("marketMapper.insertMarket", market);
	  
  }

  
  public int insertAttachmentMarket(Attachment a, SqlSessionTemplate sqlSession) {
	  
	  return sqlSession.insert("attachmentMapper.insertAttachmentMarket", a);
			  
			  
  }
  
}

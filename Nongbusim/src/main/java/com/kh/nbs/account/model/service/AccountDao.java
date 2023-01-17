package com.kh.nbs.account.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.account.model.vo.Account;
import com.kh.nbs.common.model.vo.Attachment;


@Repository
public class AccountDao {
		
	public ArrayList<HashMap> selectCatAndGoods(SqlSessionTemplate sqlSession, int memNo) {
		System.out.println( (ArrayList)sqlSession.selectList("accountMapper.selectCatAndGoods", memNo));
		return (ArrayList)sqlSession.selectList("accountMapper.selectCatAndGoods", memNo);
	}

	public ArrayList<Account> selectAccountList(SqlSessionTemplate sqlSession, Account account) {
		return (ArrayList)sqlSession.selectList("accountMapper.selectAccountList", account);
	}

	
	public Account selectAccount(SqlSessionTemplate sqlSession, int accountNo) {
		return sqlSession.selectOne("accountMapper.selectAccount", accountNo);
	}
	public ArrayList<Attachment> selectAttachmentList(SqlSessionTemplate sqlSession, int accountNo) {
		return (ArrayList)sqlSession.selectList("accountMapper.selectAttachmentList", accountNo);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("accountMapper.insertAttachment", a);
	}


	public int insertAccount(SqlSessionTemplate sqlSession, Account account) {
		return sqlSession.insert("accountMapper.insertAccount", account);
	}


	public int updateaccount(SqlSessionTemplate sqlSession, Account account) {
		return sqlSession.update("accountMapper.updateAccount", account);
	}


	public int updateAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.update("accountMapper.updateAttachment", at);
	}


	public int deleteAccount(SqlSessionTemplate sqlSession, int accountNo) {
		return sqlSession.update("accountMapper.deleteAccount", accountNo);
	}


	public int deleteAttachment(SqlSessionTemplate sqlSession, int accountNo) {
		return sqlSession.update("accountMapper.deleteAttachment", accountNo);
	}

	public int updateAccount(SqlSessionTemplate sqlSession, Account account) {
		return sqlSession.update("accountMapper.updateAccount", account);
	}


	
}

package com.kh.nbs.account.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.account.model.vo.Account;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.diary.model.vo.Diary;

@Service
public class AccountServiceImpl implements AccountService{

	@Autowired
	private AccountDao accountDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList selectCatAndGoods(int memNo) {
		return accountDao.selectCatAndGoods(sqlSession, memNo);
	}

	@Override
	public ArrayList<Account> selectAccountList(Account account) {
		return accountDao.selectAccountList(sqlSession, account);
	}

	@Override
	public Account selectAccount(int accountNo) {
		return accountDao.selectAccount(sqlSession, accountNo);
	}
	@Override
	public ArrayList<Attachment> selectAttachmentList(int accountNo) {
		return accountDao.selectAttachmentList(sqlSession, accountNo);
	}

	@Override
	public int insertAttachment(Attachment a) {
		return accountDao.insertAttachment(sqlSession, a);
	}

	@Override
	public int insertAccount(Account account) {
		return accountDao.insertAccount(sqlSession, account);
	}

	@Override
	public int updateAccount(Account account) {
		return accountDao.updateAccount(sqlSession, account);
	}

	@Override
	public int updateAttachment(Attachment at) {
		return accountDao.updateAttachment(sqlSession, at);
	}

	@Override
	public int deleteAccount(int accountNo) {
		return accountDao.deleteAccount(sqlSession, accountNo);
	}

	@Override
	public int deleteAttachment(int accountNo) {
		return accountDao.deleteAttachment(sqlSession, accountNo);
	}

}

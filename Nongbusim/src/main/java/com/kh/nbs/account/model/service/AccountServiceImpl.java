package com.kh.nbs.account.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.account.model.dao.AccountDao;
import com.kh.nbs.account.model.vo.Account;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;

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
	public ArrayList<Account> selectAccountList(Account account, PageInfo pi) {
		return accountDao.selectAccountList(sqlSession, account, pi);
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

	@Override
	public ArrayList seletCalEvent(int memNo) {
		return accountDao.seletCalEvent(sqlSession, memNo);
	}

	@Override
	public ArrayList monthlySummary(Account account) {
		return accountDao.monthlySummary(sqlSession, account);
	}

	@Override
	public int selectListCount(Account account) {
		return  accountDao.selectListCount(sqlSession, account);
	}

	@Override
	public int deleteCheckedAccountNo(List<String> checkboxArr) {
		return accountDao.deleteCheckedAccountNo(sqlSession,checkboxArr);
	}

	@Override
	public int deleteCheckedAttachment(List<String> checkboxArr) {
		return accountDao.deleteCheckedAttachment(sqlSession,checkboxArr);
	}

}

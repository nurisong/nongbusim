package com.kh.nbs.account.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.account.model.vo.Account;

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

}

package com.kh.nbs.account.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.account.model.vo.Account;

@Repository
public class AccountDao {

	public ArrayList<HashMap> selectCatAndGoods(SqlSessionTemplate sqlSession, int memNo) {
		System.out.println( (ArrayList)sqlSession.selectList("accountMapper.selectCatAndGoods", memNo));
		return (ArrayList)sqlSession.selectList("accountMapper.selectCatAndGoods", memNo);
	}

	public ArrayList<Account> selectAccountList(SqlSessionTemplate sqlSession, Account account) {
		return (ArrayList)sqlSession.selectList("accountMapper.selectAccountList", account);
	}

}

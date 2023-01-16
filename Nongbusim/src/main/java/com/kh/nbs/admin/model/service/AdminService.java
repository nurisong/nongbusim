package com.kh.nbs.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.admin.model.dao.AdminDao;
import com.kh.nbs.member.model.vo.Member;

@Service
public class AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDao adminDao;
	
	public ArrayList<Member> selectMemberList(){
		return adminDao.selectMemberList(sqlSession);
	}

}

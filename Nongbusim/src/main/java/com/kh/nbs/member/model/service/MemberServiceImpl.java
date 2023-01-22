package com.kh.nbs.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.board.model.vo.Board;
import com.kh.nbs.market.model.vo.Market;
import com.kh.nbs.member.model.dao.MemberDao;
import com.kh.nbs.member.model.vo.Cert;
import com.kh.nbs.member.model.vo.Member;
import com.kh.nbs.program.model.vo.Program;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	public int userInsertMember(Member m) {
		return memberDao.userInsertMember(sqlSession, m);
	}
	
	@Override
	public int farmerInsertMember(Member m) {
		return memberDao.farmerInsertMember(sqlSession, m);
	}

	@Override
	public int updateUser(Member m) {
		return memberDao.updateUser(sqlSession, m);
	}

	@Override
	public int updateFarmer(Member m) {
		return memberDao.updateFarmer(sqlSession, m);
	}
	
	@Override
	public int deleteUser(String memId) {
		return memberDao.deleteUser(sqlSession, memId);
	}
	
	@Override
	public int deleteFarmer(String memId) {
		return memberDao.deleteFarmer(sqlSession, memId);
	}
	
	@Override
	public int idCheck(String memId) {
		return memberDao.idCheck(sqlSession, memId);
	}

	@Override
	public ArrayList<Board> userMyBoardList(int memNo) {
		return memberDao.userMyBoardList(sqlSession, memNo);
	}
	
	@Override
	public ArrayList<Market> userMyMarketList(int memNo) {
		return memberDao.userMyMarketList(sqlSession, memNo);
	}

	@Override
	public ArrayList<Board> farmerMyBoardList(int memNo) {
		return memberDao.farmerMyBoardList(sqlSession, memNo);
	}

	@Override
	public ArrayList<Program> farmerMyProgramList(int memNo) {
		return memberDao.farmerMyProgramList(sqlSession, memNo);
	}
	
	@Override
	public ArrayList<Market> farmerMyMarketList(int memNo) {
		return memberDao.farmerMyMarketList(sqlSession, memNo);
	}
	
	@Override
	public ArrayList<Program> markProgram(int memNo) {
		return memberDao.markProgram(sqlSession, memNo);
	}

	@Override
	public ArrayList<Market> markMarket(int memNo) {
		return memberDao.markMarket(sqlSession, memNo);
	}

	@Override
	public Member findId(Member m) {
		return memberDao.findId(sqlSession, m);
	}

	@Override
	public int updatePwd(Member m) {
		return memberDao.updatePwd(sqlSession,m);
	}

	@Override
	public int sendCertNum(Cert cert) {
		return memberDao.sendCertNum(sqlSession, cert);
	}

	@Override
	public Cert chkCertNum(Cert cert) {
		return memberDao.chkCertNum(sqlSession, cert);
	}

}

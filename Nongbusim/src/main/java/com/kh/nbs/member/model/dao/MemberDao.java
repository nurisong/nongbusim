package com.kh.nbs.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.board.model.vo.Board;
import com.kh.nbs.market.model.vo.Market;
import com.kh.nbs.member.model.vo.Cert;
import com.kh.nbs.member.model.vo.Member;
import com.kh.nbs.program.model.vo.Program;

@Repository
public class MemberDao {
	
	
	// 로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	// 일반 사용자 회원가입
	public int userInsertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.userInsertMember", m);
	}
	
	// 농부 회원가입
	public int farmerInsertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.farmerInsertMember", m);
	}
	
	// 일반 사용자 정보 수정
	public int updateUser(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateUser", m);
	}
	
	// 농부 정보 수정
	public int updateFarmer(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateFarmer", m);
	}
	
	// 일반 사용자 탈퇴
	public int deleteUser(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.update("memberMapper.deleteUser", memId);
	}

	// 농부 탈퇴
	public int deleteFarmer(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.update("memberMapper.deleteFarmer", memId);
	}
	
	// 아이디 중복체크
	public int idCheck(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.selectOne("memberMapper.idCheck", memId);
	}
	
	// 일반 사용자가 작성한 게시글 조회
	public ArrayList<Board> userMyBoardList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("memberMapper.userMyBoardList", memNo);
	}
	
	// 일반 사용자가 작성한 마켓글 조회
	public ArrayList<Market> userMyMarketList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("memberMapper.userMyMarketList", memNo);
	}
	
	// 농부가 작성한 게시글 조회
	public ArrayList<Board> farmerMyBoardList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("memberMapper.farmerMyBoardList", memNo);
	}
	
	// 농부가 작성한 프로그램 조회
	public ArrayList<Program> farmerMyProgramList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("memberMapper.farmerMyProgramList", memNo);
	}
	
	// 농부가 작성한 마켓 조회
	public ArrayList<Market> farmerMyMarketList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("memberMapper.farmerMyMarketList", memNo);
	}
	
	// 찜한 프로그램
	public ArrayList<Program> markProgram(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("memberMapper.markProgram", memNo);
	}
	
	// 찜한 마켓
	public ArrayList<Market> markMarket(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("memberMapper.markMarket", memNo);
	}
	
	// 아이디 찾기
	public Member findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}
	
	// 비밀번호 변경
	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePwd", m);
	}

	// 이메일 인증번호 전송
	public int sendCertNum(SqlSessionTemplate sqlSession, Cert cert) {
		return sqlSession.insert("memberMapper.sendCertNum", cert);
	}

	// 이메일 인증번호 확인
	public Cert chkCertNum(SqlSessionTemplate sqlSession, Cert cert) {
		
		Cert result = sqlSession.selectOne("memberMapper.chkCertNum", cert);
		
		if(result !=null) {
			sqlSession.delete("memberMapper.deleteCertNum", cert);
		}
		return result;
	}
	
}

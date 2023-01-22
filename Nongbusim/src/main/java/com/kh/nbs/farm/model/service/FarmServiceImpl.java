package com.kh.nbs.farm.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.farm.model.dao.FarmDao;
import com.kh.nbs.farm.model.vo.Farm;
import com.kh.nbs.market.model.vo.Market;
import com.kh.nbs.program.model.vo.Program;

@Service
public class FarmServiceImpl implements FarmService {
	
	@Autowired
	private FarmDao farmDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectFarmCount(HashMap<String, String> map) {
		return farmDao.selectFarmCount(map, sqlSession);
	}

	@Override
	public ArrayList<Farm> selectFarmList(PageInfo pi, HashMap<String, String> map) {
		return farmDao.selectFarmList(pi, map, sqlSession);
	}
	
	@Override
	public ArrayList<Attachment> selectAttachmentList() {
		return farmDao.selectAttachmentList(sqlSession);
	}
	
	@Override
	public ArrayList<Program> selectProgramList() {
		return farmDao.selectProgramList(sqlSession);
	}
	
	
	@Override
	public ArrayList<Farm> selectMyFarmList(int memNo) {
		return farmDao.selectMyFarmList(memNo, sqlSession);
	}
	
	@Override
	public Farm selectFarm(int farmNo) {
		return farmDao.selectFarm(farmNo, sqlSession);
	}
	
	@Override
	public ArrayList<Attachment> selectAttachment(int farmNo) {
		return farmDao.selectAttachment(farmNo, sqlSession);
	}

	@Override
	public ArrayList<Program> selectProgram(int farmNo){
		return farmDao.selectProgram(farmNo, sqlSession);
	}
	
	@Override
	public ArrayList<Market> selectMarket(int memNo){
		return farmDao.selectMarket(memNo, sqlSession);
	}
	
	@Override
	public ArrayList<Attachment> selectMarketAt(ArrayList<Market> mkList){
		return farmDao.selectMarketAt(mkList, sqlSession);
	}

	@Override
	public int insertFarm(Farm f) {
		return farmDao.insertFarm(f, sqlSession);
	}
	
	@Override
	public int insertAttachment(ArrayList<Attachment> upfileList) {
		return farmDao.insertAttachment(upfileList, sqlSession);
	}

	@Override
	public int deleteFarm(int farmNo) {
		return farmDao.deleteFarm(farmNo, sqlSession);
	}
	
	@Override
	public int updateFarm(Farm f) {
		return farmDao.updateFarm(f, sqlSession);
	}
	
	@Override
	public List selectFileNo(int farmNo) {
		return farmDao.selectFileNo(farmNo, sqlSession);
	}

	@Override
	public int deleteAttachment(ArrayList<Integer> delList) {
		return farmDao.deleteAttachment(delList, sqlSession);
	}
	
	@Override
	public int updateInsertAttachment(List upfileList) {
		return farmDao.updateInsertAttachment(upfileList, sqlSession);
	}
	

	@Override
	public int selectSearchListCount(HashMap map) {
		return farmDao.selectSearchListCount(map, sqlSession);
	}

	@Override
	public ArrayList<Farm> selectSearchList(PageInfo pi, HashMap map) {
		return farmDao.selectSearchList(pi, map, sqlSession);
	}





}

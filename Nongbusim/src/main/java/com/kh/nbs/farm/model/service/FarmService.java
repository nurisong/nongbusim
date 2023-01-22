package com.kh.nbs.farm.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.farm.model.vo.Farm;
import com.kh.nbs.market.model.vo.Market;
import com.kh.nbs.program.model.vo.Program;

public interface FarmService {
	
	// 1. 농장 리스트 조회 서비스 + 페이징 처리(select)
	// 1-1) 농장 총 개수 조회
	int selectFarmCount(HashMap<String, String> map);
	// 1-2) 농장 리스트 조회
	// **프로그램, 판매품목 연결
	ArrayList<Farm> selectFarmList(PageInfo pi, HashMap<String, String> map);
	ArrayList<Attachment> selectAttachmentList(); // 첨부파일
	// 1-3) 농장 프로그램 조회
	ArrayList<Program> selectProgramList();
	
	// 2. 농장 등록 서비스(insert)
	// 첨부파일 등록
	int insertAttachment(ArrayList<Attachment> upfileList);
	int insertFarm(Farm f);
	
	// 3. 나의 농장 리스트 조회 서비스
	ArrayList<Farm> selectMyFarmList(int memNo);
	
	// 4. 농장 상세조회 서비스(select)
	// **지도 API 연결?
	Farm selectFarm(int farmNo);
	ArrayList<Attachment> selectAttachment(int farmNo);
	ArrayList<Program> selectProgram(int farmNo);
	ArrayList<Market> selectMarket(int memNo); // 추후 farmNo조회로 수정
	ArrayList<Attachment> selectMarketAt(ArrayList<Market> mkList); // 추후 farmNo조회로 수정
	
	// 5. 농장 삭제 서비스(update)
	int deleteFarm(int farmNo);
	
	// 6. 농장 정보 수정 서비스(update)
	int updateFarm(Farm f);
	List selectFileNo(int farmNo);
	int deleteAttachment(ArrayList<Integer> delList);
	int updateInsertAttachment(List upfileList);
	
	// 7. 검색 서비스(select)
	int selectSearchListCount(HashMap map);
	ArrayList<Farm> selectSearchList(PageInfo pi, HashMap map);
}

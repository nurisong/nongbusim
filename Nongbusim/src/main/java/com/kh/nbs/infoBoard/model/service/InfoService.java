package com.kh.nbs.infoBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.infoBoard.model.vo.Info;

public interface InfoService {
	
	// 1. 게시글 리스트 조회 서비스 + 페이징 처리(select)
	// 1-1) 게시글 총 개수 조회
	int selectListCount(HashMap<String, String> map);
	// 1-2) 게시글 리스트 조회
	ArrayList<Info> selectList(PageInfo pi, HashMap<String, String> map);
	
	// 2. 게시글 작성 서비스(insert)
	int insertInfo(Info i);
	int insertAttachment(ArrayList<Attachment> upfileList);
	
	// 3. 상세조회 서비스
	// 3-1) 게시글 조회수 증가(update)
	int increaseCount(int infoNo);
	// 3-2) 게시글 상세 조회(select)
	Info selecetInfo(int infoNo);
	ArrayList<Attachment> selectAttachment(int infoNo); // 첨부파일
	ArrayList<Attachment> selectImg(int infoNo); // 이미지
	
	// 4. 게시글 삭제 서비스(update)
	int deleteInfo(int infoNo);
	
	// 5. 게시글 수정(update)
	int updateInfo(Info i);
	
	// 6. 메인 게시글 조회(select)
	ArrayList<Info> selectMainList();
	
	// 6. 검색 서비스(select)
	// 6-1) 검색 게시글 총 개수
	int selectSearchListCount(HashMap map);
	// 6-2) 검색 게시글 리스트 조회
	ArrayList<Info> selectSearchList(PageInfo pi, HashMap map);
	
}

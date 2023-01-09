package com.kh.nbs.diary.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.nbs.diary.model.vo.Diary;

public interface DiaryService {
	
	
	// diaryListView
	// 페이지 진입시 DB에 등록된 categoryList를 받아와서 select태그로 선택가능하도록
	ArrayList selectCategoryList(int MemNo);
	// Ajax: 사용자가 선택한 조회기준값으로 list를 조회하는 기능
	ArrayList<Diary> selectDiaryList(String selectDuration, String selectCategory);	
	Diary selectCalEventList(int memNo);

}

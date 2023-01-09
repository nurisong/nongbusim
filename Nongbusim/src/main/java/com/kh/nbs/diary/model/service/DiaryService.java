package com.kh.nbs.diary.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.nbs.diary.model.vo.Diary;

public interface DiaryService {
	
	
	// diaryListView
	//
	ArrayList selectCategoryList(int MemNo);
	// Ajax: 
	ArrayList<Diary> selectDiaryList(String selectDuration, String selectCategory);	
	Diary selectCalEventList(int memNo);

}

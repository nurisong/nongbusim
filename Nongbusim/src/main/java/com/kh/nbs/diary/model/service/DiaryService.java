package com.kh.nbs.diary.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.nbs.diary.model.vo.Diary;

public interface DiaryService {
	
	
	// diaryListView
	//
	ArrayList<Diary> selectCategoryList(int MemNo);
	// Ajax: 
	ArrayList<Diary> selectDiaryList(Diary diary);	
	Diary selectCalEventList(int memNo);

}

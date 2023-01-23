package com.kh.nbs.diary.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonElement;
import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.diary.model.vo.Diary;

public interface DiaryService {
	
	
	// diaryListView
	//
	ArrayList<Diary> selectCategoryList(int MemNo);
	// Ajax: 
	ArrayList<Diary> selectDiaryList(Diary diary, PageInfo pi);	
	Diary selectDiary(int diaryNo);
	int insertAttachment(Attachment a);
	int insertDiary(Diary diary);
	ArrayList<Attachment> selectAttachmentList(int diaryNo);
	int updateDiary(Diary diary);
	int updateAttachment(Attachment at);
	int deleteDiary(int diaryNo);
	int deleteAttachment(int diaryNo);
	ArrayList seletCalEvent(int memNo);
	int selectListCount(Diary diary);
	int deleteCheckedDiaryNo(List<String> checkboxArr);
	int deleteCheckedAttachment(List<String> checkboxArr);

}

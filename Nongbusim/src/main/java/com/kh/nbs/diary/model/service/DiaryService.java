package com.kh.nbs.diary.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.nbs.diary.model.vo.Diary;

public interface DiaryService {
	
	
	// diaryListView
	// ������ ���Խ� DB�� ��ϵ� categoryList�� �޾ƿͼ� select�±׷� ���ð����ϵ���
	ArrayList selectCategoryList(int MemNo);
	// Ajax: ����ڰ� ������ ��ȸ���ذ����� list�� ��ȸ�ϴ� ���
	ArrayList<Diary> selectDiaryList(String selectDuration, String selectCategory);	
	Diary selectCalEventList(int memNo);

}

package com.kh.nbs.diary.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.diary.model.dao.DiaryDao;
import com.kh.nbs.diary.model.vo.Diary;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired
	private DiaryDao diaryDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public ArrayList selectCategoryList(int memNo) {
		return diaryDao.selectCategoryList(sqlSession, memNo);
	}
	
	@Override
	public Diary selectCalEventList(int memNo) {
		return diaryDao.selectCalEventList(memNo);
	}

	

	@Override
	public ArrayList<Diary> selectDiaryList(String selectDuration, String selectCategory) {
		return null;
	}

}

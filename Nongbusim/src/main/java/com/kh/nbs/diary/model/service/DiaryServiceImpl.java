package com.kh.nbs.diary.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.diary.model.dao.DiaryDao;
import com.kh.nbs.diary.model.vo.Diary;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	@Autowired
	private DiaryDao diaryDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public ArrayList<Diary> selectCategoryList(int memNo) {
		return diaryDao.selectCategoryList(sqlSession, memNo);
	}
	
	@Override
	public Diary selectCalEventList(int memNo) {
		return diaryDao.selectCalEventList(memNo);
	}

	

	@Override
	public ArrayList<Diary> selectDiaryList(Diary diary) {
		return diaryDao.selectDiaryList(sqlSession, diary);
	}

	@Override
	public Diary selectDiary(int diaryNo) {
		return diaryDao.selectDiary(sqlSession, diaryNo);
	}
	@Override
	public ArrayList<Attachment> selectAttachmentList(int diaryNo) {
		return diaryDao.selectAttachmentList(sqlSession, diaryNo);
	}

	@Override
	public int insertAttachment(Attachment a) {
		return diaryDao.insertAttachment(sqlSession, a);
	}

	@Override
	public int insertDiary(Diary diary) {
		return diaryDao.insertDiary(sqlSession, diary);
	}


}

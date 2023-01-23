package com.kh.nbs.diary.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;
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
	public ArrayList<Diary> selectDiaryList(Diary diary, PageInfo pi) {
		return diaryDao.selectDiaryList(sqlSession, diary, pi);
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

	@Override
	public int updateDiary(Diary diary) {
		return diaryDao.updateDiary(sqlSession, diary);
	}

	@Override
	public int updateAttachment(Attachment at) {
		return diaryDao.updateAttachment(sqlSession, at);
	}

	@Override
	public int deleteDiary(int diaryNo) {
		return diaryDao.deleteDiary(sqlSession, diaryNo);
	}

	@Override
	public int deleteAttachment(int diaryNo) {
		return diaryDao.deleteAttachment(sqlSession, diaryNo);
	}

	@Override
	public ArrayList seletCalEvent(int memNo) {
		return diaryDao.selectCalEvent(sqlSession, memNo);
	}



	@Override
	public int selectListCount(Diary diary) {
		return diaryDao.selectListCount(sqlSession, diary);
	}

	@Override
	public int deleteCheckedDiaryNo(List<String> checkboxArr) {
		return diaryDao.deleteCheckedDiaryNo(sqlSession,checkboxArr);
	}

	@Override
	public int deleteCheckedAttachment(List<String> checkboxArr) {
		return diaryDao.deleteCheckedAttachment(sqlSession,checkboxArr);
		
	}

	/*
	 * @Override public int insertNewAttachment(Attachment at) { return
	 * diaryDao.insertNewAttachment(sqlSession, at); }
	 */


}

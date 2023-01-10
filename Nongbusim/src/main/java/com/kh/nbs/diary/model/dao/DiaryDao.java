package com.kh.nbs.diary.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.diary.model.vo.Diary;

@Repository
public class DiaryDao {


	
	public ArrayList selectCategoryList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("diaryMapper.selectCategoryList", memNo);
	}

	
	public Diary selectCalEventList(int memNo) {
		return selectCalEventList(memNo);
	}


	public ArrayList<Diary> selectDiaryList(SqlSessionTemplate sqlSession, Diary diary) {
				
		return (ArrayList)sqlSession.selectList("diaryMapper.selectDiaryList", diary);
	}


	public Diary selectDiary(SqlSessionTemplate sqlSession, int diaryNo) {
		return sqlSession.selectOne("diaryMapper.selectDiary", diaryNo);
	}
	public ArrayList<Attachment> selectAttachmentList(SqlSessionTemplate sqlSession, int diaryNo) {
		return (ArrayList)sqlSession.selectList("diaryMapper.selectAttachmentList", diaryNo);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("diaryMapper.insertAttachment", a);
	}


	public int insertDiary(SqlSessionTemplate sqlSession, Diary diary) {
		return sqlSession.insert("diaryMapper.insertDiary", diary);
	}


}


	


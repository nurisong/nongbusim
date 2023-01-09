package com.kh.nbs.diary.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.diary.model.vo.Diary;

@Repository
public class DiaryDao {

	public ArrayList selectCategoryList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("diaryMapper.selectCategroyList", memNo);
	}

	
	public Diary selectCalEventList(int memNo) {
		return selectCalEventList(memNo);
	}


	
}

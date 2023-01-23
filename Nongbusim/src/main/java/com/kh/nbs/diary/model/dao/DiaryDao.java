package com.kh.nbs.diary.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.diary.model.vo.Diary;

@Repository
public class DiaryDao {


	
	public ArrayList selectCategoryList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("diaryMapper.selectCategoryList", memNo);
	}

	


	public ArrayList<Diary> selectDiaryList(SqlSessionTemplate sqlSession, Diary diary, PageInfo pi) {

		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
	
		return (ArrayList)sqlSession.selectList("diaryMapper.selectDiaryList", diary, rowBounds);
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


	public int updateDiary(SqlSessionTemplate sqlSession, Diary diary) {
		return sqlSession.update("diaryMapper.updateDiary", diary);
	}


	public int updateAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.update("diaryMapper.updateAttachment", at);
	}


	public int deleteDiary(SqlSessionTemplate sqlSession, int diaryNo) {
		return sqlSession.update("diaryMapper.deleteDiary", diaryNo);
	}


	public int deleteAttachment(SqlSessionTemplate sqlSession, int diaryNo) {
		return sqlSession.update("diaryMapper.deleteAttachment", diaryNo);
	}


	public ArrayList selectCalEvent(SqlSessionTemplate sqlSession, int memNo) {
		return  (ArrayList)sqlSession.selectList("diaryMapper.selectCalEvent", memNo);
	}


	public int selectListCount(SqlSessionTemplate sqlSession, Diary diary) {
		return sqlSession.selectOne("diaryMapper.selectListCount", diary);
	}


	public int deleteCheckedDiaryNo(SqlSessionTemplate sqlSession, List<String> checkboxArr) {
		return sqlSession.update("diaryMapper.deleteCheckedAccountNo",checkboxArr);
	}




	public int deleteCheckedAttachment(SqlSessionTemplate sqlSession, List<String> checkboxArr) {
		return sqlSession.update("diaryMapper.deleteCheckedAttachment",checkboxArr);
	}


	/*
	 * public int insertNewAttachment(SqlSessionTemplate sqlSession, Attachment at)
	 * { return sqlSession.insert("diaryMapper.insertNeAttachment", at); }
	 */

}



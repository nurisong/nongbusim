package com.kh.nbs.diary.model.service;

import java.util.List;
import java.util.Map;

import com.kh.nbs.diary.model.vo.Diary;

public interface DiaryService {

	List<Map<String, Object>> selectCalList();

	Diary selectCalEventList(int memNo);

}

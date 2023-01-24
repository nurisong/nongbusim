package com.kh.nbs.search.model.service;

import java.util.ArrayList;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.search.model.vo.Search;

public interface SearchService {

	ArrayList recommendKeyword(Search search);

	ArrayList<Search> selectBoardList(String keyword);

	ArrayList<Search> selectFarmList(String keyword);

	ArrayList<Search> selectInfoBoardList(String keyword);

	ArrayList<Search>selectMarketList(String keyword);

	ArrayList<Search>selectProgramList(String keyword);

	ArrayList<Attachment> searchAttachmentList();


	
}

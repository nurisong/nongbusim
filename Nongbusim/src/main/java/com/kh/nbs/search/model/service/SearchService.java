package com.kh.nbs.search.model.service;

import java.util.ArrayList;

import com.kh.nbs.board.model.vo.Board;
import com.kh.nbs.search.model.vo.Search;

public interface SearchService {

	ArrayList recommendKeyword(Search search);

	ArrayList<Search> selectBoardList();

	ArrayList<Search> selectFarmList();

	ArrayList<Search> selectInfoBoardList();

	ArrayList<Search>selectMarketList();

	ArrayList<Search>selectProgramList();

	
}

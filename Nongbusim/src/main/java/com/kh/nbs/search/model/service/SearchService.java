package com.kh.nbs.search.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.review.model.vo.Review;
import com.kh.nbs.search.model.vo.Search;

public interface SearchService {

	ArrayList recommendKeyword(Search search);

	
}

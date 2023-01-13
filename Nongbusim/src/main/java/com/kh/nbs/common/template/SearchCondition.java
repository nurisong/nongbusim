package com.kh.nbs.common.template;

import lombok.Data;

@Data
public class SearchCondition extends Pagination {

	private String category;
	private String condition;
	private String keyword;
	
	public SearchCondition(String category, String condition, String keyword) {
		super();
		this.category = category;
		this.condition = condition;
		this.keyword = keyword;
	}
	
	
}

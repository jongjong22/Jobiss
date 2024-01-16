package com.example.demo.model;

import org.apache.ibatis.type.Alias;

@Alias("search")
public class Search {

	private String searchtype = "";
	private String keyword = "";
	
	public String getSearchtype() {
		return searchtype;
	}
	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}

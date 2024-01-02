package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Community;
import com.example.demo.model.FeedBack;

@Mapper
public interface MasterCommunityDao {
	
	// 전체 갯수 구하기
	int getCount();
	
	// 목록 구해오기
	List<Community> clist(int start);
	
	// 상세 정보 구해오기
	Community community(String cid);
	
	// 글 삭제하기
	int masterCommunityDelete(String cid);
	
	// 검색 목록 갯수 구해오기
	int sgetCount(Map<String, Object> map);
	
	// 검색 목록 리스트 구해오기
	List<Community> scList(Map<String, Object> map);

}

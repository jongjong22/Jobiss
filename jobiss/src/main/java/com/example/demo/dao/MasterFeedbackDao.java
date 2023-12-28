package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.FeedBack;
import com.example.demo.model.QnA;

@Mapper
public interface MasterFeedbackDao {
	
	// 글 전체 갯수 구해오기
	int getCount();
	
	// 글 목록 구해오기
	List<FeedBack> flist(int start);
	
	// 피드백 상세 구해오기
	FeedBack feedback(String fid);
	
	// 피드백 삭제하기
	int masterFeedbackDelete(String fid);
	
	// 검색 목록 갯수 구하기
	int sgetCount(Map<String, Object> map);
	
	// 검색 목록 구하기
	List<QnA> sfList(Map<String, Object> map);

}

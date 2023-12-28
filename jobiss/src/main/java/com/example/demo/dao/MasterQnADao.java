package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Member;
import com.example.demo.model.QnA;

@Mapper
public interface MasterQnADao {
	
	// QnA 전체 갯수 구해오기
	int getCount();
	
	// QnA 목록 구해오기
	List<Member> qnaList(int start);
	
	// QnA 상세 정보 구해오기
	QnA qna(String qid);
	
	// QnA 글 삭제하기
	int masterQnADelete(String qid);
	
	// QnA 검색 목록 갯수 구해오기
	int sgetCount(Map<String, Object> map);
	
	// QnA 검색 목록 구해오기
	List<QnA> sqnaList(Map<String, Object> map);

}

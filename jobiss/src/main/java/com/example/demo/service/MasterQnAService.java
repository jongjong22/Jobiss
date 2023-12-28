package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MasterQnADao;
import com.example.demo.model.Member;
import com.example.demo.model.QnA;

@Service
public class MasterQnAService {
	
	@Autowired
	private MasterQnADao dao;
	
	// QnA 목록 갯수 구해오기
	public int getCount() {
		return dao.getCount();
	}
	
	// QnA 목록 구해오기
	public List<Member> qnaList(int start) {
		return dao.qnaList(start);
	}
	
	// QnA 상세 정보 구하기
	public QnA qna(String qid) {
		return dao.qna(qid);
	}
	
	// QnA 글 삭제 하기
	public int masterQnADelete(String qid) {
		return dao.masterQnADelete(qid);
	}
	
	// QnA 검색 목록 갯수 구해오기
	public int sgetCount(Map<String, Object> map) {
		return dao.sgetCount(map);
	}
	
	// QnA 검색 목록 구해오기
	public List<QnA> sqnaList(Map<String, Object> map) {
		return dao.sqnaList(map);
	}
}

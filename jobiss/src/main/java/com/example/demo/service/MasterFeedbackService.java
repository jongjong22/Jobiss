package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MasterFeedbackDao;
import com.example.demo.model.FeedBack;
import com.example.demo.model.QnA;

@Service
public class MasterFeedbackService {
	
	@Autowired
	private MasterFeedbackDao dao;
	
	// 글 전체 갯수 구하기
	public int getCount() {
		return dao.getCount();
	}
	
	// 글 목록 구해오기
	public List<FeedBack> flist(int start) {
		return dao.flist(start);
	}
	
	// 피드백 상세 구해오기
	public FeedBack feedback(String fid) {
		return dao.feedback(fid);
	}
	
	// 피드백 삭제 하기
	public int masterFeedbackDelete(String fid) {
		return dao.masterFeedbackDelete(fid);
	}
	
	// 검색 목록 갯수 구하기
	public int sgetCount(Map<String, Object> map) {
		return dao.sgetCount(map);
	}
	
	// 검색 목록 구하기
	public List<QnA> sfList(Map<String, Object> map) {
		return dao.sfList(map);
	}
}

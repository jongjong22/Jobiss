package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MasterReviewDao;
import com.example.demo.model.Review;

@Service
public class MasterReviewService {
	
	@Autowired
	private MasterReviewDao dao;
	
	// 리뷰 리스트 가져오기
	public List<Review> masterReviewList(int start) {
		return dao.masterReviewList(start);
	}
	
	// 전체 갯수 구하기
	public int getCount() {
		return dao.getCount();
	}
	
	// 	리뷰 상세 페이지
	public Review masterReview(int rid) {
		return dao.masterReview(rid);
	}
	
	// 후기 삭제
	public int masterReviewDelete(int rid) {
		return dao.masterReviewDelete(rid);
	}
	
	// 후기 검색 갯수 구하기
	public int sgetCount(Map<String, Object> map) {
		return dao.sgetCount(map);
	}
	
	// 후기 검색목록 구해오기
	public List<Review> masterSearchReviewList(Map<String, Object> map) {
		return dao.masterSearchReviewList(map);
	}
	
	// 후기 글 작성 수락하기
	public int masterReviewConfirm(int rid) {
		return dao.masterReviewConfirm(rid);
	}
}

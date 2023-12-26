package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Review;

@Mapper
public interface MasterReviewDao {
	
	// 리뷰 리스트 가져오기
	List<Review> masterReviewList(int start);
	
	// 전체 갯수 구하기
	int getCount();
	
	// 리뷰 상세 페이지
	Review masterReview(int rid);
	
	// 후기 삭제
	int masterReviewDelete(int rid);
	
	// 후기 목록 갯수 구하기
	int sgetCount(Map<String, Object> map);
	
	// 후기 검색 목록 구해오기
	List<Review> masterSearchReviewList(Map<String, Object> map);
	
	// 후기 글 작성 요청 수락하기
	int masterReviewConfirm(int rid);
	
}

package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Member;
import com.example.demo.model.QnA;
import com.example.demo.model.Review;

@Mapper
public interface MemberDao {
	
	// 회원가입
	int logininsert(Member member);
	
	// 1명의 회원정보
	Member dbselectone(String memail);
	
	// 회원수정
	int updatemember(Member member);
	
	// 회원탈퇴
	int deletemember(Member member);
	
	// 리뷰 가져오기
	List<Review> selectreview(Map map);
	
	// 리뷰 페이징
	int reviewcount();
	
	// qna 가져오기
	List<QnA> qnaselect(Map map);
	
	// qna 페이징
	int qnacount();
	
	

}

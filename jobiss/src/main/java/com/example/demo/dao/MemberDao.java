package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Community;
import com.example.demo.model.FeedBack;
import com.example.demo.model.GptCharacter;
import com.example.demo.model.GptGrow;
import com.example.demo.model.GptMotive;
import com.example.demo.model.GptPlan;
import com.example.demo.model.Member;
import com.example.demo.model.PersonalStatement;
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
	
	// fb 페이징
	int fbcount();
	
	// fb 가져오기 
	List<FeedBack> fbselect(Map map);
	
	// 커뮤니티 페이징
	int ccount();
	
	// 커뮤니티 가져오기 
	List<Community> cselect(Map map);
	
	//  이력서 select
	PersonalStatement psselect(String memail);
	
	//  성장과정 최근 글 select
	List<GptGrow> ggselect(String memail);
	
	//  성격장단점 최근 글 select 
	List<GptCharacter> gcselect(String memail);
	
	// 지원동기 최근 글 select
	List<GptMotive> gmselect(String memail);
	
	// 입사후포부 최근 글 select
	List<GptPlan> gpselect(String memail);
	
	

}

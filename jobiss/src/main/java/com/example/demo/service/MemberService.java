package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDao;
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

@Service
public class MemberService {

	@Autowired
	private MemberDao dao;
	
	// 회원가입
	public int logininsert(Member member) {
		return dao.logininsert(member);
	}
	
	// 이메일 불러오기
	public Member dbselectone(String memail) {
		return dao.dbselectone(memail);
	}
	
	// 회원수정
	public int updatemember(Member member) {
		return dao.updatemember(member);
	}
	
	// 회원 탈퇴
	public int deletemember(Member member) {
		return dao.deletemember(member);
	}
	
	// 리뷰 가져오기
	public List<Review> selectreview(Map map) {
		return dao.selectreview(map);
	}

	public int reviewcount() {
		return dao.reviewcount();
	}
	
	// qna 가져오기 
	public List<QnA> qnaselect(Map map) {
		return dao.qnaselect(map);
	}
	
	// qna 페이징
	public int qnacount() {
		return dao.qnacount();
	}
	
	// fb 페이징
	public int fbcount() {
		return dao.fbcount();
	}
	
	// fb 가져오기
	public List<FeedBack> fbselect(Map map) {
		return dao.fbselect(map);
	}
	
	// 커뮤니티 페이징
	public int ccount() {
		return dao.ccount();
	}

	public List<Community> cselect(Map map) {
		return dao.cselect(map);
	}
	
	
	
	
	
	// 이력서 select
	public PersonalStatement psselect(String memail) {
		return dao.psselect(memail);
	}
	
	// 성정과정 최근 글 불러오기 
	public List<GptGrow> ggselect(String memail) {
		return dao.ggselect(memail);
	}
	
	// 성격장단점 최근 글 불러오기 
	public List<GptCharacter> gcselect(String memail) {
		return dao.gcselect(memail);
	}
	
	// 지원동기 최근 글 불러오기 
	public List<GptMotive> gmselect(String memail) {
		return dao.gmselect(memail);
	}
	
	// 입사후포부 최근 글 불러오기
	public List<GptPlan> gpselect(String memail) {
		return dao.gpselect(memail);
	}


	



}

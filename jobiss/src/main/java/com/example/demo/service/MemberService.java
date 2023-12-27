package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDao;
import com.example.demo.model.Member;
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
	
	// qna 갯수
	public int qnacount() {
		return dao.qnacount();
	}


	



}

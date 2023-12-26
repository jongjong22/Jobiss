package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDao;
import com.example.demo.model.Member;

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



}

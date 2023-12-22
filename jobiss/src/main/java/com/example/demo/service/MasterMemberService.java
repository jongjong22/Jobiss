package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MasterMemberDao;
import com.example.demo.model.Member;

@Service
public class MasterMemberService {
	
	@Autowired
	private MasterMemberDao dao;
	
    // 회원 목록 구해오기	
	public List<Member> mlist() {
		return dao.mlist();
	}
	
	// 회원 삭제
	public int masterMemberDelete(String memail) {
		return dao.masterMemberDelete(memail);
	}
	
	// 회원 한 명 상세정보 구해오기
	public Member member(String memail) {
		return dao.member(memail);
	}

	
}

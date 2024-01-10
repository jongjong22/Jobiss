package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MasterMemberDao;
import com.example.demo.model.Member;
import com.example.demo.model.PersonalStatement;

@Service
public class MasterMemberService {
	
	@Autowired
	private MasterMemberDao dao;
	
    // 회원 목록 구해오기	
	public List<Member> mlist(int start) {
		return dao.mlist(start);
	}
	
	// 회원 삭제
	public int masterMemberDelete(String memail) {
		return dao.masterMemberDelete(memail);
	}
	
	// 회원 한 명 상세정보 구해오기
	public Member member(String memail) {
		return dao.member(memail);
	}
	
	// 회원 전체 갯수 구해오기
	public int getCount() {
		return dao.getCount();
	}
	
	// 검색 회원 갯수 구해오기
	public int sgetCount(Map<String, Object> map) {
		return dao.sgetCount(map);
	}
	
	// 검색 목록 구해오기
	public List<Member> searchMember(Map<String, Object> map) {
		return dao.searchMember(map);
	}
	
	
	public PersonalStatement selectps(String memail) {
		return dao.selectps(memail);
	}

	
}

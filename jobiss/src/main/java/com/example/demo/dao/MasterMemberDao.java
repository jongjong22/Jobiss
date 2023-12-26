package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.example.demo.model.Member;

@Mapper
public interface MasterMemberDao {
	
	
	// 회원 목록 구해오기
	public List<Member> mlist(int start);
	
	// 회원 삭제하기 
	public int masterMemberDelete(String memail);
	
	// 회원 한 명 상세정보 구해오기
	public Member member(String memail);
	
	// 회원 갯수 구해오기
	public int getCount();
	
	// 검색 회원목록 갯수 구해오기
	public int sgetCount(Map<String, Object> map);
	
	// 검색 회원목록 구해오기
	public List<Member> searchMember(Map<String, Object> map);

}

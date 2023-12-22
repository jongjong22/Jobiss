package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import com.example.demo.model.Member;

@Mapper
public interface MasterMemberDao {
	
	
	// 회원 목록 구해오기
	public List<Member> mlist();
	
	// 회원 삭제하기 
	public int masterMemberDelete(String memail);
	
	// 회원 한 명 상세정보 구해오기
	public Member member(String memail);

}

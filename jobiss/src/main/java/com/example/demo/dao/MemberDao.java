package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Member;

@Mapper
public interface MemberDao {
	
	// 회원가입
	int logininsert(Member member);
	
	// 1명의 회원정보
	Member dbselectone(String memail);
	
	// 회원수정
	int updatemember(Member member);


}

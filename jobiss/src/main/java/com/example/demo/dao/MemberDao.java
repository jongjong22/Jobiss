package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Member;

@Mapper
public interface MemberDao {

	public List<Member> memberList();

	public Member selectMemberOne(int id);

	public int count();

	public int updateMember(Member member);

}

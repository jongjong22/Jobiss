package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDao;
import com.example.demo.model.Member;

@Service
public class MemberService {

	@Autowired
	private MemberDao dao;

 

	public List<Member> memberList() {
		return dao.memberList();
	}



	public Member selectMemberOne(int id) {
		return dao.selectMemberOne(id);
	}



	public int count() {
		return dao.count();
	}



	public int updateMember(Member member) {
		return dao.updateMember(member);
	}


}

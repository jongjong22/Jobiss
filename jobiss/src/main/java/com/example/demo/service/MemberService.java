package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDao;
import com.example.demo.model.Member;

@Service
public class MemberService {

	@Autowired
	private MemberDao dao;

	public int logininsert(Member member) {
		return dao.logininsert(member);
	}

	public Member dbselectone(String memail) {
		return dao.dbselectone(memail);
	}



}

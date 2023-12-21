package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDao;

@Service
public class MemberService {

	@Autowired
	private MemberDao dao;

	public int count() {
		return dao.count();
	}

}

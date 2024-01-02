package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CommunityDao;
import com.example.demo.model.Community;

@Service
public class CommunityService {

	@Autowired
	private CommunityDao dao;

	// 커뮤니티 글 insert
	public int communityInsert(Community community) {
		return dao.communityInsert(community);
	}

	// 전체 커뮤니티 글 리스트 구하기
	public List<Community> selectCommunityList() {
		return dao.selectCommunityList();
	}
}

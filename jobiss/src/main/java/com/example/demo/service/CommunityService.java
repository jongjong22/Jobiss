package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.CommunityDao;
import com.example.demo.model.Community;
import com.example.demo.model.Review;
import com.example.demo.model.Search;

@Service
public class CommunityService {

	@Autowired
	private CommunityDao dao;

	// 커뮤니티 글 insert
	public int communityInsert(Community community) {
		return dao.communityInsert(community);
	}

	// 전체 커뮤니티 글 리스트 구하기
	public List<Community> selectCommunityList(int start) {
		return dao.selectCommunityList(start);
	}

	public Community selectCommunity(int cid) {
		// TODO Auto-generated method stub
		return dao.selectCommunity(cid);
	}

	public int readCountUpdate(int id) {
		// TODO Auto-generated method stub
		return dao.readCountUpdate(id);
	}

	public int deleteCommunity(int id) {
		// TODO Auto-generated method stub
		return dao.deleteCommunity(id);
	}

	public int getCount() {
		// TODO Auto-generated method stub
		return dao.getCount();
	}

	public List<Community> selectCommuniytTop3() {
		// TODO Auto-generated method stub
		return dao.selectCommuniytTop3();
	}

	public List<Community> searchCommunityList(Search search) {
		// TODO Auto-generated method stub
		return dao.searchCommunityList(search);
	}
}

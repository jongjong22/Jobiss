package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Community;
import com.example.demo.model.Review;
import com.example.demo.model.Search;

@Mapper
public interface CommunityDao {

	// 커뮤니티 글 insert
	int communityInsert(Community community);

	// 전체 커뮤니티 글 리스트 구하기
	List<Community> selectCommunityList(int start);

	Community selectCommunity(int id);

	int readCountUpdate(int id);

	int deleteCommunity(int id);

	int getCount();

	List<Community> selectCommuniytTop3();

	List<Community> searchCommunityList(Search search);

}

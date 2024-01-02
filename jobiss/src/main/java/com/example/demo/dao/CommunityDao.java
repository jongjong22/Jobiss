package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Community;

@Mapper
public interface CommunityDao {

	// 커뮤니티 글 insert
	int communityInsert(Community community);

	// 전체 커뮤니티 글 리스트 구하기
	List<Community> selectCommunityList();

}

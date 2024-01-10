package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.ReviewReply;

@Mapper
public interface ReviewReplyDao {

	int insert(ReviewReply reviewreply);

	int getCount();

	List<ReviewReply> RgetList(int rid);


	int delete(int rrid);

	ReviewReply getBoard(int rrid);


}

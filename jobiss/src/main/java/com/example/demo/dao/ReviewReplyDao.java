package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Review;
import com.example.demo.model.ReviewReply;

@Mapper
public interface ReviewReplyDao {

	Review getBoard = null;
	int update = 0;

	int insert(ReviewReply reviewreply);

	int getCount();

	List<Review> getList(int start);

	int update(ReviewReply reviewreply);

	int delete(int rid);


}

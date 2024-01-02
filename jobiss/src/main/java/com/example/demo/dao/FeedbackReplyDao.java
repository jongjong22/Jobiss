package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.FeedbackReply;

@Mapper
public interface FeedbackReplyDao {

	int insert(FeedbackReply feedbackreply);

	FeedbackReply getBoard(int frid);

	int delete(int frid);

	List<FeedbackReply> FgetList(int fid);

}

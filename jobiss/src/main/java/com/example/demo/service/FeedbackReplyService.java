package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.FeedbackReplyDao;
import com.example.demo.model.FeedbackReply;

@Service
public class FeedbackReplyService {

	@Autowired
	private FeedbackReplyDao dao;

	public int insert(FeedbackReply feedbackreply) {
		return dao.insert(feedbackreply);
	}

	public FeedbackReply getBoard(int frid) {
		return dao.getBoard(frid);
	}

	public int delete(int frid) {
		return dao.delete(frid);
	}

	public List<FeedbackReply> FgetList(int fid) {
		return dao.FgetList(fid);
	}
}

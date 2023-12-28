package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ReviewReplyDao;
import com.example.demo.model.Review;
import com.example.demo.model.ReviewReply;

@Service
public class ReviewReplyService {

	@Autowired
	public ReviewReplyDao dao;

	public int insert(ReviewReply reviewreply) {
		return dao.insert(reviewreply);
	}

	public int getCount() {
		return dao.getCount();
	}


	public int update(ReviewReply reviewreply) {
		return dao.update(reviewreply);
	}

	public int delete(int rrid) {
		
		return dao.delete(rrid);
	}

	public List<ReviewReply> RgetList(int rid) {
	
		return dao.RgetList(rid);
	}

	public ReviewReply getBoard(int rrid) {
	
		return dao.getBoard(rrid);
	}
}

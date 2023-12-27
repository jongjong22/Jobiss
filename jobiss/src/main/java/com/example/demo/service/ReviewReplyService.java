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

	public List<Review> getList(int start) {
		return dao.getList(start);
	}

	public Review getBoard(int rid) {
		
		return dao.getBoard;
	}

	public int update(ReviewReply reviewreply) {
		return dao.update(reviewreply);
	}

	public int delete(int rid) {
		
		return dao.delete(rid);
	}
}

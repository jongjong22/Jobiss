package com.example.demo.service;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ReviewDao;
import com.example.demo.model.Review;




@Service
public class ReviewService {

	@Autowired
	private ReviewDao dao;
	
	public int insert(Review review) {

		return dao.insert(review);
	}

	public List<Review> getList(int start) {
	
		return dao.getList(start);
	}

	public int getCount() {
		
		return dao.getCount();
	}

	public Review getBoard(int rid) {

		return dao.getBoard(rid);
	}

	public int update(Map map) {
		
		return dao.update(map);
	}

	public int delete(int rid) {
		
		return dao.delete(rid);
	}
	

	
	
	
	
}

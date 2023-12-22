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

	public List<Review> getList(Review review) {
	
		return dao.getList(review);
	}

	public int getCount() {
		
		return dao.getCount();
	}
	

	
	
	
	
}

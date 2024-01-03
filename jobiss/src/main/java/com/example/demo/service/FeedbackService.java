package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.FeedbackDao;
import com.example.demo.model.FeedBack;
import com.example.demo.model.Review;

@Service
public class FeedbackService {
	
	@Autowired
	private FeedbackDao dao;

	public int insert(FeedBack feedback) {

		return dao.insert(feedback);
	}

	public int getCount() {

		return dao.getCount();
	}

	public List<FeedBack> getList(int start) {
		return dao.getList(start);
	}

	public FeedBack getBoard(int fid) {
		return dao.getBoard(fid);
	}

	public int update(Map map) {
		return dao.update(map);
	}

	public int delete(int fid) {

		return dao.delete(fid);
	}

}

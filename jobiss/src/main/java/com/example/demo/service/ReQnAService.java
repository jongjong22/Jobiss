package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ReQnADao;
import com.example.demo.model.ReQnA;

@Service
public class ReQnAService {
	
	@Autowired
	public ReQnADao rqdao;

	public int insert(ReQnA reqna) {
		// TODO Auto-generated method stub
		return rqdao.insert(reqna);
	}
	
	public int getCount() {
		return rqdao.getCount();
	}

	public ReQnA getBoard(int qrid) {
		// TODO Auto-generated method stub
		return rqdao.getBoard(qrid);
	}

	public int delete(int qrid) {
		// TODO Auto-generated method stub
		return rqdao.delete(qrid);
	}
	
	public List<ReQnA> RgetList(int qid){
		return rqdao.RgetList(qid);
	}

}

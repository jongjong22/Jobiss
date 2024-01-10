package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.QnADao;
import com.example.demo.model.QnA;

@Service
public class QnAService {
	
	@Autowired
	private QnADao qdao;

	public int qnaInsert(QnA qna) {
		// TODO Auto-generated method stub
		System.out.println("insert service");
		return qdao.qnaInsert(qna);
	}
	
	public List<QnA> getqnaList(int start) {
		// TODO Auto-generated method stub
		return qdao.getqnaList(start);
	}


	public int getqnaCount() {
		// TODO Auto-generated method stub
		return qdao.getqnaCount();
	}
	
	public QnA getqna(int qid) {
		return qdao.getqna(qid);
	}

	public int qnaUpdate(QnA qna) {
		// TODO Auto-generated method stub
		return qdao.qnaUpdate(qna);
	}

	public int qnaDelete(int qid) {
		// TODO Auto-generated method stub
		return qdao.qnaDelete(qid);
	}




}

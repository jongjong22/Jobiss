package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.QnA;

@Mapper
public interface QnADao {

	public int qnaInsert(QnA qna);
	
	public List<QnA> getqnaList(int page);
	
	public int getqnaCount();
	
	public QnA getqna(int qid);
	
	public int qnaUpdate(QnA qna);
	
	public int qnaDelete(int qid);
	
	
}

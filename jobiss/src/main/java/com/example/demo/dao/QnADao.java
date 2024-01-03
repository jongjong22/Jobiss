package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.QnA;

@Mapper
public interface QnADao {

	public int qnaInsert(QnA qna);
	
	public List<QnA> getqnaList(int page);
	
	public int getqnaCount();
	
	public QnA getQnA(int qid);
	
	public int QnAUpdate(QnA qna);
	
	public int delete(int qid);
	
	
}

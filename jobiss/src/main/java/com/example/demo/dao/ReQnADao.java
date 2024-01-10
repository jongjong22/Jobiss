package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.ReQnA;




@Mapper
public interface ReQnADao {

	int insert(ReQnA reqna);

	int getCount();

	int delete(int qrid);

	List<ReQnA> RgetList(int qid);

	ReQnA getBoard(int qrid);


}

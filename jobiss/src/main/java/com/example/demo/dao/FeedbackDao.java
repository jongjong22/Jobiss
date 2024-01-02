package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.FeedBack;
import com.example.demo.model.Review;

@Mapper
public interface FeedbackDao {

	int insert(FeedBack feedback);

	int getCount();

	List<FeedBack> getList(int start);

	FeedBack getBoard(int fid);

	int update(FeedBack feedback);

	int delete(int fid);

}

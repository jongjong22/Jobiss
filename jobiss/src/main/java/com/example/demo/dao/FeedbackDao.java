package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.FeedBack;


@Mapper
public interface FeedbackDao {

	int insert(FeedBack feedback);

	int getCount();

	List<FeedBack> getList(int start);

	FeedBack getBoard(int fid);

	int update(Map map);

	int delete(int fid);

}

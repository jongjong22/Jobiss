package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import com.example.demo.model.Review;



@Mapper
public interface ReviewDao {

	public int insert(Review review);

	public List<Review> getList(Review review);

	public int getCount();
}

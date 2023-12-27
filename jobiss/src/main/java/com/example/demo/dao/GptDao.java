package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.GPT;
import com.example.demo.model.GptGrow;

@Mapper
public interface GptDao {

	int countGptGrow();

	int insertGptGrow(GptGrow grow);

	int updateGrow(GptGrow grow);

	GPT selectGptTop(String mEmail);

	int insertGpt(GPT gpt);

	GptGrow selectGptGrowTop(int gid);

	int updateGptReg(int gid);


}
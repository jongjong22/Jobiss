package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.GPT;
import com.example.demo.model.GptCharacter;
import com.example.demo.model.GptGrow;
import com.example.demo.model.ReadCount;

@Mapper
public interface GptDao {

	// 부모 insert
	int insertGpt(GPT gpt);

	// 부모 최신글
	GPT selectGptTop(String mEmail);

	// 부모 시간 최신화
	int updateGptReg(int gid);

	// 성장과정 insert
	int insertGptGrow(GptGrow grow);

	// 성장과정 최신글
	GptGrow selectGptGrowTop(int gid);

	// 성장과정 최신화
	int updateGrow(GptGrow grow);

	// 성격장단점 insert
	int insertGptCharacter(Character character);

	// 성격장단점 최신글
	GptCharacter selectGptCharacterTop(int gid);

	// 성격장단점 최신화
	int updateCharacter(Character character);

	// 조회수 insert
	int insertReadCount(ReadCount readCount);

	// 조회수 최신글
	ReadCount selectReadCountTop();

	// 조회수 최신화
	int updateReadCount(ReadCount readCount);

}

package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.GPT;
import com.example.demo.model.GptCharacter;
import com.example.demo.model.GptGrow;
import com.example.demo.model.GptMotive;
import com.example.demo.model.GptPlan;
import com.example.demo.model.ReadCount;

@Mapper
public interface GptDao {

	/*** GPT 부모글 ***/
	// 부모 insert
	int insertGpt(GPT gpt);

	// 부모 최신글
	GPT selectGptTop(String mEmail);

	// 부모 특정글
	GPT selectGptGid(int gid);

	// 부모 전체글
	List<GPT> selectGptList(String mEmail);

	// 부모 특정 전체글
	List<Integer> selectGidMemail(String memail);
	
	// 부모 시간 최신화
	int updateGptReg(int gid);

	/*** 성장과정 ***/
	// 성장과정 insert
	int insertGptGrow(GptGrow grow);

	// 성장과정 특정글
	List<GptGrow> selectGptGrowGid(int gid);

	// 성장과정 최신글
	GptGrow selectGptGrowTop(String memail);

	// 성장과정 최신화
	int updateGrow(GptGrow grow);

	/*** 성격장단점 ***/
	// 성격장단점 insert
	int insertGptCharacter(GptCharacter character);

	// 성격장단점 특정글
	List<GptCharacter> selectGptCharacterGid(int gid);

	// 성격장단점 최신글
	GptCharacter selectGptCharacterTop(String memail);

	// 성격장단점 최신화
	int updateCharacter(GptCharacter character);

	/*** 지원동기 ***/
	// 지원동기 insert
	int insertGptMotive(GptMotive motive);

	// 지원동기 특정글
	List<GptMotive> selectGptMotiveGid(int gid);

	// 지원동기 최신글
	GptMotive selectGptMotiveTop(String memail);

	// 지원동기 최신화
	int updateMotive(GptMotive motive);

	/*** 입사후포부 ***/
	// 입사후포부 insert
	int insertGptPlan(GptPlan plan);

	// 성장과정 특정글
	List<GptPlan> selectGptPlanGid(int gid);

	// 입사후포부 최신글
	GptPlan selectGptPlanTop(String memail);

	// 입사후포부 최신화
	int updatePlan(GptPlan plan);

	/*** 조회수 ***/
	// 조회수 insert
	int insertReadCount(ReadCount readCount);

	// 조회수 최신글
	ReadCount selectReadCountTop();

	// 조회수 최신화
	int updateReadCount(ReadCount readCount);


}

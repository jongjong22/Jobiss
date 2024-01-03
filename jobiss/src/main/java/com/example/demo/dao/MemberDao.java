package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Community;
import com.example.demo.model.FeedBack;
import com.example.demo.model.GptCharacter;
import com.example.demo.model.GptGrow;
import com.example.demo.model.GptMotive;
import com.example.demo.model.GptPlan;
import com.example.demo.model.Member;
import com.example.demo.model.PersonalStatement;
import com.example.demo.model.QnA;
import com.example.demo.model.Review;

@Mapper
public interface MemberDao {

	// 회원가입
	int logininsert(Member member);

	// 1명의 회원정보
	Member dbselectone(String memail);

	// 회원수정
	int updatemember(Member member);

	// 회원탈퇴
	int deletemember(Member member);

	// 리뷰 가져오기
	List<Review> selectreview(Map map);

	// 리뷰 페이징
	int reviewcount();

	// qna 가져오기
	List<QnA> qnaselect(Map map);

	// qna 페이징
	int qnacount();

	// fb 페이징
	int fbcount();

	// fb 가져오기
	List<FeedBack> fbselect(Map map);

	// 커뮤니티 페이징
	int ccount();

	// 커뮤니티 가져오기
	List<Community> cselect(Map map);

	// 이력서 select
	PersonalStatement psselect(String memail);

	// 성장과정 최근 글 select
	List<GptGrow> ggselect(String memail);

	// 성격장단점 최근 글 select
	List<GptCharacter> gcselect(String memail);

	// 지원동기 최근 글 select
	List<GptMotive> gmselect(String memail);

	// 입사후포부 최근 글 select
	List<GptPlan> gpselect(String memail);
	
	// gid로 성장과정 가져오기
	GptGrow gptgrow(String gptgid);
	
	// gid 없을 시 insert하기
	int insertGptgrow(Map map);
	
	// gid 있을 시 update하기 
	int updateGptgrow(Map map);
	
	// pid로 이력서 불러오기 
	PersonalStatement selectps(String pid);
	
	// 이력서안에 있는 성장과정 내가 직접 수정
	int psgupdate(Map map);
	
	// cid 성격장단점 가져오기 
	GptCharacter gptcharacter(String gptcid);
	
	// cid 없을 시 insert하기 
	int insertGptcharacter(Map map);
	
	// cid 있을 시 update하기 
	int updateGptcharacter(Map map);
	
	// 이력서안에 있는 성격장단점 내가 직접 수정 
	int pscupdate(Map map);
	
	// mid 지원동기 가져오기 
	GptMotive gptmotive(String gptmid);
	
	// mid 없을 시 insert하기
	int insertgptmotive(Map map);
	
	// mid 있을 시 update하기
	int updategptmotive(Map map);
	
	// 이력서안에 있는 지원동기 내가 직접 수정
	int psmupdate(Map map);
	
	// gid 입사후포부 가져오기 
	GptPlan gptplan(String gptpid);
	
	// gid 없을 시 insert하기
	int insertgptplan(Map map);
	
	// gid 있을 시 update하기
	int updategptplan(Map map);
	
	// 이력서안에 있는 입사후포부 내가 직접 수정 
	int pspupdate(Map map);


}

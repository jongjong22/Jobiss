package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDao;
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

@Service
public class MemberService {

	@Autowired
	private MemberDao dao;

	// 회원가입
	public int logininsert(Member member) {
		return dao.logininsert(member);
	}

	// 이메일 불러오기
	public Member dbselectone(String memail) {
		return dao.dbselectone(memail);
	}

	// 회원수정
	public int updatemember(Member member) {
		return dao.updatemember(member);
	}

	// 회원 탈퇴
	public int deletemember(Member member) {
		return dao.deletemember(member);
	}

	// 리뷰 가져오기
	public List<Review> selectreview(Map map) {
		return dao.selectreview(map);
	}

	public int reviewcount() {
		return dao.reviewcount();
	}

	// qna 가져오기
	public List<QnA> qnaselect(Map map) {
		return dao.qnaselect(map);
	}

	// qna 페이징
	public int qnacount() {
		return dao.qnacount();
	}

	// fb 페이징
	public int fbcount() {
		return dao.fbcount();
	}

	// fb 가져오기
	public List<FeedBack> fbselect(Map map) {
		return dao.fbselect(map);
	}

	// 커뮤니티 페이징
	public int ccount() {
		return dao.ccount();
	}

	public List<Community> cselect(Map map) {
		return dao.cselect(map);
	}

	// 이력서 select
	public PersonalStatement psselect(String memail) {
		return dao.psselect(memail);
	}

	// 성정과정 최근 글 불러오기
	public List<GptGrow> ggselect(String memail) {
		return dao.ggselect(memail);
	}

	// 성격장단점 최근 글 불러오기
	public List<GptCharacter> gcselect(String memail) {
		return dao.gcselect(memail);
	}

	// 지원동기 최근 글 불러오기
	public List<GptMotive> gmselect(String memail) {
		return dao.gmselect(memail);
	}

	// 입사후포부 최근 글 불러오기
	public List<GptPlan> gpselect(String memail) {
		return dao.gpselect(memail);
	}
	
	// gid로 성장과정 가져오기
	public GptGrow gptgrow(String gptgid) {
		return dao.gptgrow(gptgid);
	}
	
	// gid 없을 시 insert
	public int insertGptgrow(Map map) {
		return dao.insertGptgrow(map);
	}
	
	// gid 있을 시 update
	public int updateGptgrow(Map map) {
		return dao.updateGptgrow(map);
	}
	
	// pid로 이력서 불러오기 
	public PersonalStatement selectps(String pid) {
		return dao.selectps(pid);
	}
	
	// 이력서 내에 성장과정 내가 직접 수정
	public int psgupdate(Map map) {
		return dao.psgupdate(map);
	}
	
	// cid로 성격장단점 가져오기 
	public GptCharacter gptcharacter(String gptcid) {
		return dao.gptcharacter(gptcid);
	}
	
	// cid가 없을 시 insert
	public int insertGptcharacter(Map map) {
		return dao.insertGptcharacter(map);
	}
	
	// cid가 있을 시 update
	public int updateGptcharacter(Map map) {
		return dao.updateGptcharacter(map);
	}
	
	// 이력서 내에 성격장단점 내가 직접 수정
	public int pscupdate(Map map) {
		return dao.pscupdate(map);
	}
	
	// mid로 지원동기 가져오기 
	public GptMotive gptmotive(String gptmid) {
		return dao.gptmotive(gptmid);
	}
	
	// mid가 없을 시 insert (지원동기)
	public int insertgptmotive(Map map) {
		return dao.insertgptmotive(map);
	}
	
	// mid가 있을 시 update(지원동기)
	public int updategptmotive(Map map) {
		return dao.updategptmotive(map);
	}
	
	// 이력서 내에 지원동기 내가 직접 수정
	public int psmupdate(Map map) {
		return dao.psmupdate(map);
	}
	
	// pid로 입사후포부 가져오기 
	public GptPlan gptplan(String gptpid) {
		return dao.gptplan(gptpid);
	}
	
	// pid가 없을 시 insert (입사후포부)
	public int insertgptplan(Map map) {
		return dao.insertgptplan(map);
	}
	
	// pid가 있을 시 update (입사후포부)
	public int updategptplan(Map map) {
		return dao.updategptplan(map);
	}
	
	// 이력서 내에 입사후포부 내가 직접 수정
	public int pspupdate(Map map) {
		return dao.pspupdate(map);
	}

}

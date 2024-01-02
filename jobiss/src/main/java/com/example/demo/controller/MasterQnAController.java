package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Member;
import com.example.demo.model.QnA;
import com.example.demo.service.MasterQnAService;

@Controller
public class MasterQnAController {

	@Autowired
	private MasterQnAService service;

	// QnA 관리페이지 이동
	@RequestMapping("masterQnAList.do")
	public String masterQnAList(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		System.out.println("회원 관리 페이지 이동");

		int limit = 10; // 한 페이지에 출력할 데이터 개수

		int listcount = service.getCount(); // 전체 데이터 개수

		int start = (page - 1) * 10;
		List<Member> qnalist = service.qnaList(start); // 회원 목록 불러오기

		int pageCount = (int) Math.ceil((double) listcount / limit); // 전체 페이지 개수

		int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
		int endPage = startPage + 9; // 끝 페이지
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		model.addAttribute("qnalist", qnalist);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listcount", listcount);
		model.addAttribute("page", page);
		return "master/masterQnA/masterQnAList";
	}

	// QnA 상세 정보 구해오기
	@RequestMapping("masterQnA.do")
	public String masterQnA(@RequestParam("qid") String qid, Model model) {

		QnA qna = service.qna(qid);

		model.addAttribute("qna", qna);
		return "master/masterQnA/masterQnA";
	}

	// QnA 글 삭제하기
	@RequestMapping("masterQnADelete.do")
	@ResponseBody
	public String masterQnADelete(@RequestParam("qid") String qid) {
		
		int result = service.masterQnADelete(qid);
		
		if(result == 1) {
			return "Y";
		}else {
			return "N";
		}
	}
	
	// QnA 검색목록
	@RequestMapping("masterQnASearch.do")
	public String masterQnASearch(@RequestParam(value = "page", defaultValue = "1") int page, Model model,@RequestParam("searchtype")String searchtype, @RequestParam("keyword")String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("searchtype", searchtype);
		map.put("keyword", keyword);
		
		int limit = 10; // 한 페이지에 출력할 데이터 개수

		int listcount = service.sgetCount(map); // 전체 데이터 개수
		
		int start = (page - 1) * 10;
		map.putIfAbsent("start", start);
		List<QnA> qnalist = service.sqnaList(map); // 회원 목록 불러오기

		int pageCount = (int) Math.ceil((double) listcount / limit); // 전체 페이지 개수

		int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
		int endPage = startPage + 9; // 끝 페이지
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		model.addAttribute("qnalist", qnalist);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listcount", listcount);
		model.addAttribute("page", page);
		
		return "master/masterQnA/masterQnAList";
	}
	
	
}

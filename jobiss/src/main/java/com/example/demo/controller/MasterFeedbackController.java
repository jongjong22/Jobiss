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

import com.example.demo.model.FeedBack;
import com.example.demo.model.QnA;
import com.example.demo.service.MasterFeedbackService;

@Controller
public class MasterFeedbackController {

	@Autowired
	private MasterFeedbackService service;
	
	@RequestMapping("masterFeedbackList.do")
	public String masterFeedbackList(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		int limit = 10; // 한 페이지에 출력할 데이터 개수

		int listcount = service.getCount(); // 전체 데이터 개수

		int start = (page - 1) * 10;
		List<FeedBack> flist = service.flist(start); // 회원 목록 불러오기

		int pageCount = (int) Math.ceil((double) listcount / limit); // 전체 페이지 개수

		int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
		int endPage = startPage + 9; // 끝 페이지
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		model.addAttribute("flist", flist);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listcount", listcount);
		model.addAttribute("page", page);
		return "master/masterFeedback/masterFeedbackList";
	}
	
	@RequestMapping("masterFeedback.do")
	public String masterFeedback(@RequestParam("fid") String fid, Model model) {
		
		FeedBack feedback = service.feedback(fid);
		
		model.addAttribute("feedback", feedback);
		
		return "master/masterFeedback/masterFeedback";
	}
	
	@RequestMapping("masterFeedbackDelete.do")
	@ResponseBody
	public String masterFeedbackDelete(@RequestParam("fid")String fid) {
		
		int result = service.masterFeedbackDelete(fid);
		
		if(result == 1) {
			return "Y";
		}else {
			return "N";
		}
	}
	
	// Feedback 검색목록
	@RequestMapping("masterSearchFeedback.do")
	public String masterQnASearch(@RequestParam(value = "page", defaultValue = "1") int page, Model model,@RequestParam("searchtype")String searchtype, @RequestParam("keyword")String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("searchtype", searchtype);
		map.put("keyword", keyword);
		
		int limit = 10; // 한 페이지에 출력할 데이터 개수

		int listcount = service.sgetCount(map); // 전체 데이터 개수
		
		int start = (page - 1) * 10;
		map.put("start", start);
		List<QnA> flist = service.sfList(map); // 회원 목록 불러오기

		int pageCount = (int) Math.ceil((double) listcount / limit); // 전체 페이지 개수

		int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
		int endPage = startPage + 9; // 끝 페이지
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		model.addAttribute("flist", flist);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listcount", listcount);
		model.addAttribute("page", page);
		
		return "master/masterFeedback/masterFeedbackList";
	}

}

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

import com.example.demo.model.Community;
import com.example.demo.model.FeedBack;
import com.example.demo.model.QnA;
import com.example.demo.service.MasterCommunityService;

@Controller
public class MasterCommunityController {
	
	@Autowired
	private MasterCommunityService service;
	
	@RequestMapping("masterCommunityList.do")
	public String masterCommunityList(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		int limit = 10; // 한 페이지에 출력할 데이터 개수

		int listcount = service.getCount(); // 전체 데이터 개수

		int start = (page - 1) * 10;
		List<Community> clist = service.clist(start); // 회원 목록 불러오기

		int pageCount = (int) Math.ceil((double) listcount / limit); // 전체 페이지 개수

		int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
		int endPage = startPage + 9; // 끝 페이지
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		model.addAttribute("clist", clist);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listcount", listcount);
		model.addAttribute("page", page);
		return "master/masterCommunity/masterCommunityList";
	}
	
	@RequestMapping("masterCommunity.do")
	public String mastercommunity(@RequestParam("cid") String cid, Model model) {
		
		Community community = service.community(cid);
		
		model.addAttribute("community", community);
		
		return "master/masterCommunity/masterCommunity";
	}
	
	@RequestMapping("masterCommunityDelete.do")
	@ResponseBody
	public String masterCommunityDelete(@RequestParam("cid")String cid) {
		
		int result = service.masterCommunityDelete(cid);
		
		if(result == 1) {
			return "Y";
		}else {
			return "N";
		}
	}
	
	// Feedback 검색목록
	@RequestMapping("masterSearchCommunity.do")
	public String masterSearchCommunity(@RequestParam(value = "page", defaultValue = "1") int page, Model model,@RequestParam("searchtype")String searchtype, @RequestParam("keyword")String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("searchtype", searchtype);
		map.put("keyword", keyword);
		
		int limit = 10; // 한 페이지에 출력할 데이터 개수

		int listcount = service.sgetCount(map); // 전체 데이터 개수
		
		int start = (page - 1) * 10;
		map.put("start", start);
		List<Community> clist = service.scList(map); // 회원 목록 불러오기

		int pageCount = (int) Math.ceil((double) listcount / limit); // 전체 페이지 개수

		int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
		int endPage = startPage + 9; // 끝 페이지
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		model.addAttribute("clist", clist);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listcount", listcount);
		model.addAttribute("page", page);
		
		return "master/masterCommunity/masterCommunityList";
	}
	
}

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

import com.example.demo.model.Review;
import com.example.demo.service.MasterReviewService;

@Controller
public class MasterReviewController {

	@Autowired
	private MasterReviewService service;
	
	// 리뷰 리스트 가져오기
	@RequestMapping("masterReviewList.do")
	public String masterReviewList(@RequestParam(value = "page", defaultValue = "1") int page,Model model) {
		
		int limit = 10; // 한 페이지에 출력할 데이터 개수

		int listcount = service.getCount(); // 전체 데이터 개수

		int start = (page - 1) * 10;
		List<Review> rlist = service.masterReviewList(start);
		
		int pageCount = (int) Math.ceil((double) listcount / limit); // 전체 페이지 개수

		int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
		int endPage = startPage + 9; // 끝 페이지
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		model.addAttribute("rlist", rlist);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listcount", listcount);
		model.addAttribute("page", page);
		
		return "master/masterReview/masterReviewList";
	}
	
	// 리뷰 상세페이지
	@RequestMapping("masterReview.do")
	public String masterReview(int rid,Model model) {
		
		Review review = service.masterReview(rid);
		
		model.addAttribute("review", review);
		return "master/masterReview/masterReview";
	}
	
	//후기 삭제하기
	@RequestMapping("masterReviewDelete.do")
	@ResponseBody
	public String masterReviewDelete(int rid) {
		
		int result = service.masterReviewDelete(rid);
		
		if(result == 1) {
			return "Y";
		}else {
			return "N";
		}
	}
	
	// 글 컨펌 수락하기
    @RequestMapping("masterReviewConfirm.do")
    @ResponseBody
    public String masterReviewConfirm(int rid) {
    	
    	int result = service.masterReviewConfirm(rid);
    	
    	if(result == 1) {
    		return "Y";
    	}else {
    		return "N";
    	}
    }
	
	// 리뷰 검색 하기
	@RequestMapping("masterSearchReview.do")
	public String masterSearchReview(@RequestParam(value = "page", defaultValue = "1") int page,Model model, @RequestParam("searchtype")String searchtype, @RequestParam("keyword")String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("searchtype", searchtype);
		map.put("keyword", keyword);
		
		int limit = 10; // 한 페이지에 출력할 데이터 개수
		
		int listcount = service.sgetCount(map); // 전체 데이터 개수
		
		int start = (page - 1) * 10;
		map.put("start", start);
		List<Review> rlist = service.masterSearchReviewList(map);
		
		int pageCount = (int) Math.ceil((double) listcount / limit); // 전체 페이지 개수
		
		int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
		int endPage = startPage + 9; // 끝 페이지
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("rlist", rlist);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listcount", listcount);
		model.addAttribute("page", page);
		
		return "master/masterReview/masterReviewList";
	}
}

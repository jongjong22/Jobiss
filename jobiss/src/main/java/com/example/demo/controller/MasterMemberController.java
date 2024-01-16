package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Member;
import com.example.demo.model.PersonalStatement;
import com.example.demo.service.MasterMemberService;

@Controller
public class MasterMemberController {

	@Autowired
	private MasterMemberService service;

	// 회원 관리페이지 이동
	@RequestMapping("masterMemberList.do")
	public String masterMemberList(@RequestParam(value = "page", defaultValue = "1") int page, Model model,
			HttpSession session) {

		Member member = (Member) session.getAttribute("member");
		String memail = "";
		
		if (member != null) {
			memail = member.getMemail();
		}
		
		if (!(memail.equals("master")) || memail == "") {
			model.addAttribute("loginErr", "관리자만 접근할 수 있는 페이지 입니다.");
			return "master/masterMember/masterMemberList";
		}
		int limit = 10; // 한 페이지에 출력할 데이터 개수

		int listcount = service.getCount(); // 전체 데이터 개수

		int start = (page - 1) * 10;
		List<Member> mlist = service.mlist(start); // 회원 목록 불러오기

		int pageCount = (int) Math.ceil((double) listcount / limit); // 전체 페이지 개수

		int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
		int endPage = startPage + 9; // 끝 페이지
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		model.addAttribute("mlist", mlist);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listcount", listcount);
		model.addAttribute("page", page);
		return "master/masterMember/masterMemberList";
	}

	// 회원 상세정보 보기
	@RequestMapping("masterMember.do")
	public String masterMember(String memail, Model model) {

		Member member = service.member(memail);

		model.addAttribute("member", member);
		return "master/masterMember/masterMember";
	}

	// 회원 탈퇴 시키기
	@RequestMapping("masterMemberDelete.do")
	@ResponseBody
	public String masterMemberDelete(String memail) {

		int result = service.masterMemberDelete(memail);

		if (result == 1) {
			return "Y";
		} else {
			return "N";
		}
	}

	// 회원 검색 하기
	@RequestMapping("masterMemberSearch.do")
	public String masterMemberSearch(@RequestParam(value = "page", defaultValue = "1") int page, Model model,
			@RequestParam("searchtype") String searchtype, @RequestParam("keyword") String keyword) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchtype", searchtype);
		map.put("keyword", keyword);

		int limit = 10; // 한 페이지에 출력할 데이터 개수

		int listcount = service.sgetCount(map); // 검색 된 데이터 개수

		int start = (page - 1) * 10;
		map.put("start", start);

		List<Member> mlist = service.searchMember(map); // 검색 목록 불러오기

		int pageCount = (int) Math.ceil((double) listcount / limit); // 전체 페이지 개수

		int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
		int endPage = startPage + 9; // 끝 페이지
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		model.addAttribute("mlist", mlist);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listcount", listcount);
		model.addAttribute("page", page);

		return "master/masterMember/masterMemberList";
	}

	@RequestMapping("ps.do")
	public String ps(HttpSession session, Model model) {

		Member member = (Member) session.getAttribute("member");

		String memail = member.getMemail();

		PersonalStatement ps = service.selectps(memail);

		model.addAttribute("ps", ps);

		return "master/ps";
	}
}

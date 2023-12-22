package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Member;
import com.example.demo.service.MasterMemberService;

@Controller
public class MasterMemberController {

	@Autowired
	private MasterMemberService service;

	// 회원 관리페이지 이동
	@RequestMapping("masterMemberList.do")
	public String masterMemberList(Model model) {
		System.out.println("회원 관리 페이지 이동");

		List<Member> mlist = service.mlist(); // 회원 목록 불러오기

		model.addAttribute("mlist", mlist);
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

}

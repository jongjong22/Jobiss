package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Member;
import com.example.demo.service.MemberService;

@Controller
public class MainController {

	@Autowired
	private MemberService ms;

	@RequestMapping("main.do")
	public String main(Model model) {
		System.out.println("main");

		List<Member> memberList = new ArrayList<Member>();
		int count = 0;

		memberList = ms.memberList();
		count = ms.count();

		model.addAttribute("list", memberList);
		model.addAttribute("count", count);
		return "common/main";
	}

	@RequestMapping("updateForm.do")
	public String updateForm(Model model, Member member, int id) {
		System.out.println("updateForm");
		member = ms.selectMemberOne(id);

		model.addAttribute("member", member);
		return "common/updateForm";
	}

	@RequestMapping("update.do")
	public String update(Model model, Member member) {
		System.out.println("update");
		int result = 0;
		result = ms.updateMember(member);
		 
		System.out.println("수정결과 : " + result);
		model.addAttribute("result", result);
		return "common/memberMove";
	}

	@RequestMapping("delete.do")
	public String delete(Model model, Member member) {
		System.out.println("delete");
		int result = 0;

		result = ms.updateMember(member);
		System.out.println("수정결과 : " + result);
		model.addAttribute("result", result);
		return "common/memberMove";
	}
}

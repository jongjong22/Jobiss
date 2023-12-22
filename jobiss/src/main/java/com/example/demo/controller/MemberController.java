package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Member;
import com.example.demo.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	

	// 로그인 페이지로 이동
	@RequestMapping("loginform.do")
	public String loginform(Model model) {

		return "member/loginform";
	}

	// 로그인
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	@ResponseBody
	public String login(@RequestParam String memail, @RequestParam String mpw, HttpSession session) {

		System.out.println(memail);
		System.out.println("로그인 버튼을 눌렀음");
		
		Member dbmember = service.dbselectone(memail);
		
		if(dbmember != null && dbmember.getMpw().equals(mpw)) {
			session.setAttribute("member", dbmember);				// member로 세션설정
			return "Y";
		}else {
			return "N";
		}
		
	}
	// 로그아웃
	@GetMapping("logout.do")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 버튼 누름");
		
		session.invalidate();
		
		return"common/main";
	}
	
	
	// 회원가입 폼으로 이동
	@RequestMapping("logininsertform.do")
	public String mbrinsertform(Model model) {

		return "member/logininsertform";
	}

	// 회원가입
	@RequestMapping("logininsert.do")
	public String logininsert(Model model, Member member) {


		int result = service.logininsert(member);
		
		model.addAttribute("result", result);
		
		return "member/logininsert";
	}

}

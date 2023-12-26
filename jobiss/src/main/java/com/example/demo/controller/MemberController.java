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
import com.example.demo.model.QnA;
import com.example.demo.model.Review;
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

		if (dbmember != null && dbmember.getMpw().equals(mpw)) {
			session.setAttribute("member", dbmember); // member로 세션설정
			return "Y";
		} else {
			return "N";
		}

	}

	// 로그아웃
	@GetMapping("logout.do")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 버튼 누름");

		session.invalidate();

		return "common/main";
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

	// 회원정보 수정 이동(마이페이지 내에서 가능)
	@RequestMapping("memberupdateform.do")
	public String memberupdateform(Model model, Member member, HttpSession session) {

		member = (Member) session.getAttribute("member");

		model.addAttribute("member", member);

		return "member/mypage/memberupdateform";
	}

	// 회원정보 수정
	@RequestMapping("memberupdate.do")
	public String memberupdate(Model model, Member member, HttpSession session) {
		
		int result = 0;
		
		result = service.updatemember(member);
		
		model.addAttribute("result", result);
//		String gender = member.getMgender();
//		System.out.println("gender : " + gender);
		return "member/mypage/memberupdate";
	}

	// 마이페이지 이동
	@RequestMapping("mypage.do")
	public String mypage(Model model, HttpSession session) {

		Member member = (Member) session.getAttribute("member");

		String memail = member.getMemail();

		System.out.println("memail: " + memail);

		return "member/mypage/mypage";
	}

	// 마이페이지 리뷰 이동
	@RequestMapping("myreview.do")
	public String myreview(Model model, HttpSession session, Review review) {

		return "member/mypage/myreview";
	}

	// 마이페이지 Qna 이동
	@RequestMapping("myqna.do")
	public String myqna(Model model, HttpSession session, QnA qna) {

		return "member/mypage/myqna";
	}

	// 마이페이지 피드백 이동
	@RequestMapping("myfeedback.do")
	public String myfeedback(Model model, HttpSession session) {

		return "member/mypage/myfeedback";

	}

	// 마이페이지 커뮤니티 이동
	@RequestMapping("mycommunity.do")
	public String mycommunity(Model model, HttpSession session) {

		return "member/mypage/mycommunity";
	}
}

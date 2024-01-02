package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

		return "member/mypage/memberupdate";
	}

	// 마이페이지(회원 탈퇴) 이동
	@RequestMapping("memberdeleteform.do")
	public String memberdeleteform(Model model, Member member, HttpSession session) {
		member = (Member) session.getAttribute("member");

		model.addAttribute("member", member);

		System.out.println("member: " + member.getMemail());

		return "member/mypage/memberdeleteform";
	}

	// 마이페이지(회원 탈퇴)
	@RequestMapping("memberdelete.do")
	public String memberdelete(Model model, Member member, HttpSession session, String mpw) {

		member = (Member) session.getAttribute("member");

		if (member != null && member.getMpw().equals(mpw)) {

			int result = service.deletemember(member);
			session.invalidate();

			model.addAttribute("result", result);
			System.out.println("result :" + result);

			return "member/mypage/memberdelete";
		} else {
			model.addAttribute("msg", "이메일 또는 비밀번호가 유효하지 않습니다");
			return "member/mypage/memberdelete";
		}
	}

	// 마이페이지 이동( 자기소개서)
	@RequestMapping("mypage.do")
	public String mypage(Model model, HttpSession session,GptGrow gg,GptMotive gm,
							GptPlan gp,PersonalStatement ps,GptCharacter gc) {

		Member member = (Member) session.getAttribute("member");

		String memail = member.getMemail();

		System.out.println("memail: " + memail);
		
		// 이력서 select
		ps = service.psselect(memail);
		
		// 성장과정 최근 글 2개 
		List<GptGrow> gglist = service.ggselect(memail);
		
		// 성격장단점 최근 글 2개
		List<GptCharacter> gclist = service.gcselect(memail);
		
		// 지원동기 최근 글 2개
		List<GptMotive> gmlist = service.gmselect(memail);
		
		// 입사후포부 최근 글 2개
		List<GptPlan> gplist = service.gpselect(memail);
		
		System.out.println("gglist 최신글:" + gglist);
		System.out.println("gclist 최신글:" + gclist);
		System.out.println("gmlist 최신글:" + gmlist);
		System.out.println("gplist 최신글:" + gplist);
		
		
		
		
		model.addAttribute("memail", memail);
		model.addAttribute("ps", ps);		
		model.addAttribute("gglist", gglist);
		model.addAttribute("gclist", gclist);
		model.addAttribute("gmlist", gmlist);
		model.addAttribute("gplist", gplist);
		
		
		return "member/mypage/mypage";
	}

	// 마이페이지 리뷰 이동
	@RequestMapping("myreview.do")
	public String myreview(Model model, HttpSession session, Review review,
			@RequestParam(value = "page", defaultValue = "1") int page) {

		Member member = (Member) session.getAttribute("member");

		String memail = member.getMemail();

		int limit = 10;

		int listcount = service.reviewcount();

		int start = (page - 1) * 10;

		Map map = new HashMap();
		map.put("start", start);
		map.put("memail", memail);

		List<Review> reviewlist = service.selectreview(map);

		System.out.println("합격증명:" + review.getRsuccess());
		System.out.println("리스트:" + reviewlist);

		int pageCount = (int) Math.ceil((double) listcount / limit);

		int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
		int endPage = startPage + 10; // 끝 페이지
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		model.addAttribute("page", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listcount", listcount);
		model.addAttribute("memail", memail);
		model.addAttribute("reviewlist", reviewlist);

		return "member/mypage/myreview";
	}

	// 마이페이지 Qna 이동
	@RequestMapping("myqna.do")
	public String myqna(Model model, HttpSession session, QnA qna,
			@RequestParam(value = "page", defaultValue = "1") int page) {

		Member member = (Member) session.getAttribute("member");

		String memail = member.getMemail();

		int limit = 10;

		int qlistcount = service.qnacount();

		int start = (page - 1) * 10;

		Map map = new HashMap();
		map.put("start", start);
		map.put("memail", memail);
		
		List<QnA> qnalist = service.qnaselect(map);
		
		int pageCount = (int) Math.ceil((double) qlistcount / limit);

		int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
		int endPage = startPage + 10; // 끝 페이지
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		model.addAttribute("page", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listcount", qlistcount);
		model.addAttribute("memail", memail);
		model.addAttribute("qnalist", qnalist);

		return "member/mypage/myqna";
	}

	// 마이페이지 피드백 이동
	@RequestMapping("myfeedback.do")
	public String myfeedback(Model model, HttpSession session,
							@RequestParam(value = "page", defaultValue = "1") int page) {
		
		Member member = (Member) session.getAttribute("member");

		String memail = member.getMemail();

		int limit = 10;
		
		int flistcount = service.fbcount();

		int start = (page - 1) * 10;

		Map map = new HashMap();
		map.put("start", start);
		map.put("memail", memail);
		
		List<FeedBack> fblist = service.fbselect(map);
		
		
		int pageCount = (int) Math.ceil((double) flistcount / limit);

		int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
		int endPage = startPage + 10; // 끝 페이지
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("page", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("flistcount", flistcount);
		model.addAttribute("memail", memail);
		model.addAttribute("fblist", fblist);
		
		
		return "member/mypage/myfeedback";

	}

	// 마이페이지 커뮤니티 이동
	@RequestMapping("mycommunity.do")
	public String mycommunity(Model model, HttpSession session,
								@RequestParam(value = "page", defaultValue = "1") int page) {

		Member member = (Member) session.getAttribute("member");

		String memail = member.getMemail();

		int limit = 10;
		
		int clistcount = service.ccount();
		
		int start = (page - 1) * 10;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("memail", memail);
		
		List<Community> clist = service.cselect(map);
		
		int pageCount = (int) Math.ceil((double) clistcount / limit);

		int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
		int endPage = startPage + 10; // 끝 페이지
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("page", page);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("clistcount", clistcount);
		model.addAttribute("memail", memail);
		model.addAttribute("clist", clist);
		
		return "member/mypage/mycommunity";
	}
}

package com.example.demo.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.loading.MLet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	public String logininsert(Model model, Member member, @RequestParam("mschooltype") String mschooltype,
			HttpServletRequest request) {

		int result = service.logininsert(member);

		model.addAttribute("result", result);

		return "member/logininsert";
	}

	// 회원가입(아이디 중복 검사)
	@ResponseBody
	@RequestMapping("idcheck.do")
	public String idcheck(@RequestParam("memail") String memail) {
		System.out.println("idcheck");
		Member member = service.dbselectone(memail);
		System.out.println("idcheck");

		if (member == null) {
			return "Y";
		} else {
			return "N";
		}
	}

	// 회원정보 수정 이동(마이페이지 내에서 가능)
	@RequestMapping("memberupdateform.do")
	public String memberupdateform(Model model, Member member, HttpSession session) throws ParseException {

		member = (Member) session.getAttribute("member");

		String dbStart = member.getMschoolstartreg();
		String dbEnd = member.getMschoolendreg();

		SimpleDateFormat dbSd = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat newSd = new SimpleDateFormat("yyyy-MM-dd");

		// String 데이트 파싱
		Date newStart_ = dbSd.parse(dbStart);
		Date newEnd_ = dbSd.parse(dbEnd);

		// 파싱한 date 다시 format하기
		String newStart = newSd.format(newStart_);
		String newEnd = newSd.format(newEnd_);

		System.out.println("newStart_ : " + newStart_);
		System.out.println("newStart : " + newStart);

		model.addAttribute("member", member);
		model.addAttribute("startDate", newStart);
		model.addAttribute("endDate", newEnd);

		return "member/mypage/memberupdateform";
	}

	// 회원정보 수정
	@RequestMapping("memberupdate.do")
	public String memberupdate(Model model, Member member, HttpSession session, HttpServletRequest request) {

		int result = 0;
		String memail = member.getMemail();
		String newPw = member.getMpw();
		String dbPw = "";

		System.out.println("pw : " + member.getMpw());

		if (memail != null && memail != "") {
			System.out.println("로그인 세션 있음");
			Member dbMember = service.dbselectone(member.getMemail());

			if (dbMember != null) {
				System.out.println("db구해옴");
				dbPw = dbMember.getMpw();

			} else {
				System.out.println("db못구해옴");
			}
		} else {
			System.out.println("로그인 세션 없음");
		}

		if ((newPw != null && newPw != "") && newPw.equals(dbPw)) {
			System.out.println("비밀번호 검증 완료");

		} else {
			System.out.println("비밀번호 검증 실패");
			model.addAttribute("msg", "비밀번호가 올바르지 않습니다.");
			return "member/mypage/memberupdate";
		}
		System.out.println("업데이트 전 :" + member);

		result = service.updatemember(member);

		model.addAttribute("member 업데이트 후:", member);
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
	public String mypage(Model model, HttpSession session, GptGrow gg, GptMotive gm, GptPlan gp, PersonalStatement ps,
			GptCharacter gc) {

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

	// 자기소개서 선택
	@ResponseBody
	@PostMapping("updateContent")
	public String updateContent(@RequestParam("selectedId") Long selectedid, @RequestParam("content") String content,
			@RequestParam("type") String type, Model model, HttpSession session) {

		return "success";
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

	// 마이페이지 선택(성장과정)후 이력서 업데이트
	@ResponseBody
	@RequestMapping("updateGptgrow.do")
	public String updateGptgrow(String gptgid, HttpSession session) {
		System.out.println("updateGptgrow.do");

		GptGrow gptgrow = service.gptgrow(gptgid);

		String memail = gptgrow.getMemail();

		PersonalStatement ps = service.psselect(memail);

		int result = 0;

		Map map = new HashMap();
		map.put("memail", memail);
		map.put("psgcontent", gptgrow.getGptgcontent());

		if (ps == null) {

			// 이력서 성장과정 내용이 없을 경우 insert
			map.put("gid", gptgrow.getGid());
			result = service.insertGptgrow(map);
		} else {

			// 이력서 성장과정 내용이 있을 경우 update
			result = service.updateGptgrow(map);
		}

		if (result == 1) {
			return "Y";
		} else {
			return "N";
		}
	}

	// 마이페이지 이력서 직접 업데이트(성장과정)
	@RequestMapping("psgupdate.do")
	@ResponseBody
	public String psgupdate(String pid, String content) {

		PersonalStatement ps = service.selectps(pid);

		Map map = new HashMap();
		map.put("psgcontent", content);
		map.put("pid", pid);

		int result = service.psgupdate(map);

		if (result == 1) {
			return "Y";
		} else {
			return "N";
		}
	}

	// 마이페이지 선택 (성격장단점) 후 이력서 업데이트
	@ResponseBody
	@RequestMapping("updateGptcharacter.do")
	public String updateGptcharacter(String gptcid) {
		System.out.println("updateGptcharacter.do");

		GptCharacter gptcharacter = service.gptcharacter(gptcid);

		String memail = gptcharacter.getMemail();

		PersonalStatement ps = service.psselect(memail);

		int result = 0;

		Map map = new HashMap();
		map.put("memail", memail);
		map.put("psccontent", gptcharacter.getGptccontent());

		if (ps == null) {
			map.put("gid", gptcharacter.getGid());
			result = service.insertGptcharacter(map);
		} else {
			result = service.updateGptcharacter(map);

		}
		if (result == 1) {
			return "Y";
		} else {
			return "N";
		}

	}

//  마이페이지 이력서 직접 업데이트(성격장단점)
	@RequestMapping("pscupdate.do")
	@ResponseBody
	public String pscupdate(String pid, String content) {

		// pid는 계정 당 하나
		PersonalStatement ps = service.selectps(pid);

		Map map = new HashMap();
		map.put("psccontent", content);
		map.put("pid", pid);

		int result = service.pscupdate(map);

		if (result == 1) {
			return "Y";
		} else {
			return "N";
		}
	}

	// 마이페이지 선택 (지원동기) 후 이력서 업데이트
	@ResponseBody
	@RequestMapping("updateGptmotive.do")
	public String updateGptmotive(String gptmid) {
		System.out.println("updateGptmotive.do");

		GptMotive gptmotive = service.gptmotive(gptmid);

		String memail = gptmotive.getMemail();

		PersonalStatement ps = service.psselect(memail);

		int result = 0;

		Map map = new HashMap();
		map.put("memail", memail);
		map.put("psmcontent", gptmotive.getGptmcontent());

		if (ps == null) {
			map.put("gid", gptmotive.getGid());
			result = service.insertgptmotive(map);
		} else {
			result = service.updategptmotive(map);

		}
		if (result == 1) {
			return "Y";
		} else {
			return "N";
		}

	}

	// 마이페이지 이력서 직접 업데이트(성격장단점)
	@RequestMapping("psmupdate.do")
	@ResponseBody
	public String psmupdate(String pid, String content) {

		// pid는 계정 당 하나
		PersonalStatement ps = service.selectps(pid);

		Map map = new HashMap();
		map.put("psmcontent", content);
		map.put("pid", pid);

		int result = service.psmupdate(map);

		if (result == 1) {
			return "Y";
		} else {
			return "N";
		}
	}

	// 마이페이지 선택 (지원동기) 후 이력서 업데이트
	@ResponseBody
	@RequestMapping("updateGptplan.do")
	public String updateGptplan(String gptpid) {
		System.out.println("updateGptplan.do");

		GptPlan gptplan = service.gptplan(gptpid);

		String memail = gptplan.getMemail();

		PersonalStatement ps = service.psselect(memail);

		int result = 0;

		Map map = new HashMap();
		map.put("memail", memail);
		map.put("pspcontent", gptplan.getGptpcontent());

		if (ps == null) {
			map.put("gid", gptplan.getGid());
			result = service.insertgptplan(map);
		} else {
			result = service.updategptplan(map);

		}
		if (result == 1) {
			return "Y";
		} else {
			return "N";
		}

	}

	// 마이페이지 이력서 직접 업데이트(성격장단점)
	@RequestMapping("pspupdate.do")
	@ResponseBody
	public String pspupdate(String pid, String content) {

		// pid는 계정 당 하나
		PersonalStatement ps = service.selectps(pid);

		Map map = new HashMap();
		map.put("pspcontent", content);
		map.put("pid", pid);

		int result = service.pspupdate(map);

		if (result == 1) {
			return "Y";
		} else {
			return "N";
		}
	}
}

package com.example.demo.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.GPT;
import com.example.demo.model.GptCharacter;
import com.example.demo.model.GptGrow;
import com.example.demo.model.GptMotive;
import com.example.demo.model.GptPlan;
import com.example.demo.model.Member;
import com.example.demo.model.ReadCount;
import com.example.demo.service.GptService;

@Controller
public class GptController {
	private static String memail;

	@Autowired
	private GptService gs;

	// 로딩시 session 동시 초기화
	public void loading(HttpSession session) {
		System.out.println("\n ***** gptLoading 시작 ***** \n");
		Member member = (Member) session.getAttribute("member");

		System.out.println("로딩 전 memail : " + memail);
		if (member != null)
			memail = member.getMemail();
		 
		System.out.println("로딩 !null 변경 : " + memail);
		System.out.println("로딩 null 변경 : " + memail);
		System.out.println("\n ***** gptLoading 끝 ***** \n");

	}

	@RequestMapping("/gptMain")
	public String gptMain(String mainMsg, Model model, HttpSession session) {
		System.out.println("\n ***** gptMain 시작 ***** \n");
		loading(session);
		System.out.println("session : " + session);
		if (memail == null) {
			model.addAttribute("loginErr", "로그인을 해주세요.");
			return "gpt/gptMain";
		}else {
			
			
		}
		System.out.println("memail : " + memail);
		List<GPT> gptList = new ArrayList<GPT>();
		ReadCount readCount = gs.selectReadCountTop();
		if (readCount == null)
			readCount = new ReadCount();

		GPT gptTop = gs.selectGptTop(memail); // 세션의 최신질문 1개 구해옴

		GptGrow grow = new GptGrow();
		GptCharacter character = new GptCharacter();
		GptMotive motive = new GptMotive();
		GptPlan plan = new GptPlan();

		gptList = gs.selectGptList(memail);

		int i = 0;
		System.out.println("gpt갯수 : " + gptList.size());

		int gid = 0;
		System.out.println("grow : " + grow.getGid());
		System.out.println("character : " + character.getGid());
		// 처음작성이 아닐때 : 부모글번호 초기화, 하위 4개 dto초기화
		if (gptTop != null) {
			gid = gptTop.getGid();
			grow = gs.selectGptGrowTop(memail);
			character = gs.selectGptCharacterTop(memail);
			motive = gs.selectGptMotiveTop(memail);
			plan = gs.selectGptPlanTop(memail);
		}

		if (grow == null)
			grow = new GptGrow();
		if (character == null)
			character = new GptCharacter();
		if (motive == null)
			motive = new GptMotive();
		if (plan == null)
			plan = new GptPlan();
		if (mainMsg == null)
			mainMsg = "";
		System.out.println("grow : " + grow.getGid());
		System.out.println("character : " + character.getGid());
		System.out.println("motive : " + motive.getGid());
		System.out.println("plan : " + plan.getGid());
		System.out.println("mainMsg : " + mainMsg);
		System.out.println("gpt갯수 : " + gptList.size());

		model.addAttribute("grow", grow);
		model.addAttribute("character", character);
		model.addAttribute("motive", motive);
		model.addAttribute("plan", plan);
		model.addAttribute("mainMsg", mainMsg);
		model.addAttribute("gptList", gptList);
		model.addAttribute("readCount", readCount);
		System.out.println("\n ***** gptMain 끝 ***** \n");
		return "gpt/gptMain";
	}

	@ResponseBody
	@RequestMapping("/gptRequest")
	public Map<String, Object> gptRequest(@RequestBody String jString, HttpSession session) {
		System.out.println("\n ***** gptRequest ***** \n ");
		loading(session);
		System.out.println("mEmail : " + memail);

		JSONObject json = new JSONObject(jString);
		Map<String, Object> qResult = gs.request(json); // 최종답변 및 필요값들 담긴상태
		System.out.println("최종답변 : " + qResult.get("resultContent"));
		System.out.println("\n ***** Controller_gptRequest ***** 끝\n");
		return qResult;
	}

	@RequestMapping("/gptSelect")
	public String gptSelect(String resumeType, GptGrow grow, GptCharacter character, GptMotive motive, GptPlan plan,
			Model model, HttpSession session) {
		System.out.println("\n ***** gptSelect ***** \n ");
		System.out.println("mEmail : " + memail);
		System.out.println("resumeType : " + resumeType);
		System.out.println("getGptgContent : " + grow.getGptgcontent());
		System.out.println("getGptcContent : " + character.getGptccontent());
		System.out.println("getGptmContent : " + motive.getGptmcontent());
		System.out.println("getGptpContent : " + plan.getGptpcontent());

		GPT gptTop = gs.selectGptTop(memail); // 세션의 최신질문 1개 구해옴
		int gid = 0;
		int iResult = 0;

		Timestamp oldTime, newTime = new Timestamp(System.currentTimeMillis());
		System.out.println("gid : " + gid);
		System.out.println("mEmail : " + memail);

		// resumeType의 값이있고, 종류상관없이 Content가 있을경우.
		if (resumeType != null && (grow.getGptgcontent() != null || character.getGptccontent() != null
				|| motive.getGptmcontent() != null || plan.getGptpcontent() != null)) {
			if (gptTop == null) { // 첫 질문이라면
				System.out.println("if1");
				gptTop = new GPT();
				gptTop.setMemail(memail);
				gs.insertGpt(gptTop); // GPT객체 인서트 한뒤
				gptTop = gs.selectGptTop(memail);
				gid = gptTop.getGid();
				System.out.println("gid : " + gid);
				oldTime = gptTop.getGptreg(); // 인서트된 시간 다시 구해옴
				System.out.println("인설트 GPT_gid: " + gptTop.getGid() + " mEmail : " + gptTop.getMemail() + " 시간 : "
						+ gptTop.getGptreg());

			} else { // 대화중이라면 (값이 있음)
				gid = gptTop.getGid();
				System.out.println("gid : " + gid);
				oldTime = gptTop.getGptreg(); // DB에 있는 시간 구해옴
				System.out.println("셀렉트 GPT_gid : " + gptTop.getGid() + " mEmail : " + gptTop.getMemail() + " 시간 : "
						+ gptTop.getGptreg());
			}

			boolean tResult = gs.TimeOver(newTime, oldTime); // 30초가 경과됬는지

			if (tResult == true) {
				gptTop = new GPT();
				gptTop.setMemail(memail);
				iResult = gs.insertGpt(gptTop);
				gptTop = gs.selectGptTop(memail);
				gid = gptTop.getGid();
				System.out.println("gid : " + gid);
				System.out.println("시간비교 후 GPT재생성 : " + iResult + " timeOver_gid : " + gptTop.getGid());
			}

		}
		System.out.println("gid 스위치 : " + gid);
		// gptTop의 값이있고, 종류상관없이 Content가 있을경우.
		if ((gptTop != null)
				&& (resumeType != null && (grow.getGptgcontent() != null || character.getGptccontent() != null
						|| motive.getGptmcontent() != null || plan.getGptpcontent() != null))) {

			switch (resumeType) {
			case "g": {
				System.out.println("스위치_grow");
				grow.setMemail(memail);
				grow.setGid(gid);
				System.out.println("인서트 전 gid : " + grow.getGid());
				iResult = gs.insertGptGrow(grow);
				System.out.println("인서트 후 gid : " + gs.selectGptGrowTop(memail).getGid());
				System.out.println("insert : " + iResult);
				System.out.println("인설트 시간 : " + gs.selectGptTop(memail).getGptreg());
				gs.updateGptReg(gid);

				if (iResult == 1) // insert true
					model.addAttribute("grow", grow);
				else // insert false
					model.addAttribute("msg", "등록 실패.");

				// grow의 끝
				break;
			}
			case "c": {
				System.out.println("스위치_character");
				character.setMemail(memail);
				character.setGid(gid);
				System.out.println("인서트 전 gid : " + gptTop.getGid());
				iResult = gs.insertGptCharacter(character);
				System.out.println("인서트 후 gid : " + gs.selectGptCharacterTop(memail).getGid());
				System.out.println("result : " + iResult);
				System.out.println("인설트 시간 : " + gs.selectGptTop(memail).getGptreg());
				gs.updateGptReg(gid);

				if (iResult == 1) // insert true
					model.addAttribute("character", character);
				else // insert false
					model.addAttribute("msg", "등록 실패.");

				// character의 끝
				break;
			}
			case "m": {
				System.out.println("스위치_motive");
				motive.setMemail(memail);
				motive.setGid(gid);
				System.out.println("인서트 전 gid : " + gptTop.getGid());
				iResult = gs.insertGptMotive(motive);
				System.out.println("인서트 후 gid : " + gs.selectGptMotiveTop(memail).getGid());
				System.out.println("result : " + iResult);
				System.out.println("인설트 시간 : " + gs.selectGptTop(memail).getGptreg());
				gs.updateGptReg(gid);

				if (iResult == 1) // insert true
					model.addAttribute("motive", motive);
				else // insert false
					model.addAttribute("msg", "등록 실패.");

				// motive의 끝
				break;
			}
			case "p": {
				System.out.println("스위치_plan");
				plan.setMemail(memail);
				plan.setGid(gid);
				System.out.println("인서트 전 gid : " + gptTop.getGid());
				iResult = gs.insertGptPlan(plan);
				System.out.println("인서트 후 gid : " + gs.selectGptPlanTop(memail).getGid());
				System.out.println("result : " + iResult);
				System.out.println("인설트 시간 : " + gs.selectGptTop(memail).getGptreg());
				gs.updateGptReg(gid);

				if (iResult == 1) // insert true
					model.addAttribute("motive", motive);
				else // insert false
					model.addAttribute("msg", "등록 실패.");

				// plan의 끝
				break;
			}

			}
		} else {
			System.out.println("값이 없음.");
			model.addAttribute("mainMsg", "값이 없음");
			return "redirect:/gptMain";
		}
		// readCount 처리문
		ReadCount readCount = gs.selectReadCountTop();
		if (readCount == null) // readCount가 있다면
			gs.insertReadCount(readCount);
		readCount = gs.selectReadCountTop();
		gs.readCountPlus(readCount, resumeType);

		System.out.println("\n ***** Controller_gptSelect끝 ***** \n");
		return "redirect:/gptMain";
	}

	@RequestMapping("/gptHistory")
	public String gptHistory(int gid, String type, GPT gpt, HttpSession session, Model model) {
		// 해당메서드는 gid를 무조건 주기때문에 검증이 필요없음.
		System.out.println("\n ***** gptHistory ***** \n ");
		loading(session);

		System.out.println("gid : " + gid);
		System.out.println("type : " + type);

		List<GPT> gptList = gs.selectGptList(memail);
		List<Integer> gidList = gs.selectGidMemail(memail);
		Timestamp gReg = null;
		String msg = "";

		int now = 0;
		for (int i = 0; i < gidList.size(); i++) {
			if (gidList.get(i) == gid) {
				now = i;
				System.out.println("gidList : " + gidList);
				System.out.println("now번 방에 있음 : " + now);
			}
		}
		switch (type) {
		// 이전페이지일경우
		case "prev":
			if (now == 0) // 현재 gid가 총 리스트에서 0번방에 해당할경우
				msg = "이전 목록이 없습니다.";
			else
				now -= 1;

			System.out.println("switch_prev : " + now);

			break;
		case "now":
			System.out.println("switch_now : " + now);
			break;

		case "next":
			if (now + 1 == gidList.size())
				msg = "마지막 페이지 입니다.";
			else
				now += 1;

			System.out.println("switch_next : " + now);
			break;

		}
		gid = gidList.get(now);
		gReg = gptList.get(now).getGptreg();
		System.out.println("변경된 gid : " + gid);
		List<GptGrow> growList = gs.selectGptGrowGid(gid);
		List<GptCharacter> characterList = gs.selectGptCharacterGid(gid);
		List<GptMotive> motiveList = gs.selectGptMotiveGid(gid);
		List<GptPlan> planList = gs.selectGptPlanGid(gid);

		System.out.println("gidList : " + gidList);
		System.out.println("gidList갯수 : " + gidList.size());
		System.out.println("growList갯수 : " + growList.size());
		System.out.println("characterList갯수 : " + characterList.size());
		System.out.println("motiveList갯수 : " + motiveList.size());
		System.out.println("planList갯수 : " + planList.size());
		System.out.println("대화일 : " + gReg);

		model.addAttribute("gptList", gptList);
		model.addAttribute("growList", growList);
		model.addAttribute("characterList", characterList);
		model.addAttribute("motiveList", motiveList);
		model.addAttribute("planList", planList);
		model.addAttribute("gid", gid);
		model.addAttribute("gReg", gReg);
		model.addAttribute("msg", msg);

		System.out.println("\n ***** Controller_gptHistory ***** 끝\n");
		return "gpt/gptHistory";
	}

}

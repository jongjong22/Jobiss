package com.example.demo.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
	public static void loading(HttpSession session) {
		System.out.println("\n ***** gptLoading 시작 ***** \n");
		Member member = (Member) session.getAttribute("member");

		System.out.println("로딩 전 memail : " + memail);
		if (member != null)
			memail = member.getMemail();

		else
			memail = "master";
		System.out.println("로딩 !null 변경 : " + memail);
		System.out.println("로딩 null 변경 : " + memail);
		System.out.println("\n ***** gptLoading 끝 ***** \n");

	}

	@RequestMapping("/gptMain")
	public String gptMain(String mainMsg, Model model, HttpSession session) {
		System.out.println("\n ***** gptMain 시작 ***** \n");
		loading(session);

		List<GPT> gptList = new ArrayList<GPT>();
		List<Integer> gidList = new ArrayList<Integer>();

		System.out.println("memail : " + memail);
		GPT gptTop = gs.selectGptTop(memail); // 세션의 최신질문 1개 구해옴

		GptGrow grow = new GptGrow();
		GptCharacter character = new GptCharacter();
		GptMotive motive = new GptMotive();
		GptPlan plan = new GptPlan();

		gptList = gs.selectGptList(memail);
		int i = 0;
		for (GPT gpt : gptList) {
			gidList.add(gpt.getGid());
		}
		;
		System.out.println("gid갯수 : " + gidList.size());

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
		System.out.println("gid갯수 : " + gidList.size());

		model.addAttribute("grow", grow);
		model.addAttribute("character", character);
		model.addAttribute("motive", motive);
		model.addAttribute("plan", plan);
		model.addAttribute("mainMsg", mainMsg);
		model.addAttribute("gidList", gidList);
		System.out.println("\n ***** gptMain 끝 ***** \n");

		return "gpt/gptMain";
	}

	@RequestMapping("/gptHistory")
	public String gptHistory(int gid, HttpSession session, Model model) {
		System.out.println("\n ***** gptHistory ***** \n ");
		loading(session);
		System.out.println("gid : " + gid);

		List<GptGrow> growList = gs.selectGptGrowGid(gid);
		List<GptCharacter> characterList = gs.selectGptCharacterGid(gid);
		List<GptMotive> motiveList = gs.selectGptMotiveGid(gid);
		List<GptPlan> planList = gs.selectGptPlanGid(gid);

		System.out.println("growList갯수 : " + growList.size());
		System.out.println("characterList갯수 : " + characterList.size());
		System.out.println("motiveList갯수 : " + motiveList.size());
		System.out.println("planList갯수 : " + planList.size());

		model.addAttribute("growList", growList);
		model.addAttribute("characterList", characterList);
		model.addAttribute("motiveList", motiveList);
		model.addAttribute("planList", planList);
		model.addAttribute("gid", "" + gid);

		System.out.println("\n ***** Controller_gptHistory ***** 끝\n");
		return "gpt/gptHistory";
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
			Model model, HttpSession session, HttpServletRequest request) {
		System.out.println("\n ***** gptSelect ***** \n ");
		System.out.println("mEmail : " + memail);
		System.out.println("resumeType : " + resumeType);
		System.out.println("getGptgcontent : " + grow.getGptgcontent());
		System.out.println("getGptgcontent : " + character.getGptccontent());
		System.out.println("getGptgcontent : " + motive.getGptmcontent());
		System.out.println("getGptgcontent : " + plan.getGptpcontent());
		GptGrow gptGrowTop;
		GptCharacter gptCharacterTop;
		GptMotive gptMotiveTop;
		GptPlan gptPlanTop;

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
		gptGrowTop = gs.selectGptGrowTop(memail);
		gptCharacterTop = gs.selectGptCharacterTop(memail);
		gptMotiveTop = gs.selectGptMotiveTop(memail);
		gptPlanTop = gs.selectGptPlanTop(memail);

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

}

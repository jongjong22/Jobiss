package com.example.demo.controller;

import java.sql.Timestamp;
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
import com.example.demo.model.ReadCount;
import com.example.demo.service.GptService;

@Controller
public class GptController {
	private final static String memail = "master";

	@Autowired
	private GptService gs;

	@RequestMapping("/gptMain")
	public String gptMain(String mainMsg, Model model, HttpSession session) {
		System.out.println("\n ***** gptMain 시작 ***** \n");
		//  memail = (String) session.getAttribute("mEMail");
		GPT gptTop = gs.selectGptTop(memail); // 세션의 최신질문 1개 구해옴
		GptGrow grow = new GptGrow();
		GptCharacter character = new GptCharacter();
		int gid = 0;
		System.out.println("grow : " + grow.getGid());
		System.out.println("character : " + character.getGid());
		// 처음작성이 아닐때 : 부모글번호 초기화, 하위 4개 dto초기화
		if (gptTop != null) {
			gid = gptTop.getGid();
			grow = gs.selectGptGrowTop(gid);
			character = gs.selectGptCharacterTop(gid);

		}

		if (grow == null)
			grow = new GptGrow();
		if (character == null)
			character = new GptCharacter();
		if (mainMsg == null)
			mainMsg = "";
		System.out.println("grow : " + grow.getGid());
		System.out.println("character : " + character.getGid());
		System.out.println("mainMsg : " + mainMsg);
		model.addAttribute("grow", grow);
		model.addAttribute("character", character);
		System.out.println("\n ***** gptMain 끝 ***** \n");
		
		return "gpt/gptMain";
	}

	@ResponseBody
	@RequestMapping("/gptRequest")
	public Map<String, Object> gptRequest(@RequestBody String jString, HttpSession session) {
		System.out.println("\n ***** gptRequest ***** \n ");
		// mEmail = (String) session.getAttribute("mEMail");
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
		System.out.println("resumeType : " + resumeType);
		System.out.println("getGptgcontent : " + grow.getGptgcontent());
		GptGrow gptGrowTop;
		GptCharacter gptCharacterTop;
		GptMotive gptMotiveTop;
		GptPlan gptPlanTop;

		GPT gptTop = gs.selectGptTop(memail); // 세션의 최신질문 1개 구해옴
		int gid = 0;
		int iResult = 0;

		Timestamp oldTime, newTime = new Timestamp(System.currentTimeMillis());
		System.out.println("gid : " + gid);
		// String mEmail = (String) session.getAttribute("mEMail");
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
		gptGrowTop = gs.selectGptGrowTop(gid);
//		gptCharacterTop = gs.selectGptCharacterTop(gid);
//		gptMotiveTop = gs.selectGptMotiveTop(gid);
//		gptPlanTop = gs.selectGptPlanTop(gid);

		// gptTop의 값이있고, 종류상관없이 Content가 있을경우.
		if ((gptTop != null)
				&& (resumeType != null && (grow.getGptgcontent() != null || character.getGptccontent() != null
						|| motive.getGptmcontent() != null || plan.getGptpcontent() != null))) {

			switch (resumeType) {
			case "g":
				System.out.println("스위치_grow");
				if (gptGrowTop == null) { // 첫 선택이라면.
					grow.setGid(gid);
					grow.setMemail(memail);
					iResult = gs.insertGptGrow(grow); // 첫 선택이라면 insert 수행
					System.out.println("result : " + iResult);
					System.out.println("첫질문 gid : " + gptTop.getGid());
					gs.updateGptReg(gid);
					System.out.println("인설트 시간 : " + gs.selectGptTop(memail).getGptreg());

					if (iResult == 1) // insert true
						model.addAttribute("grow", grow);
					else // insert false
						model.addAttribute("msg", "등록 실패.");
				} else if (gptGrowTop != null) { // 둘째 선택이라면.
					grow.setGid(gid);
					grow.setMemail(memail);
					iResult = gs.updateGrow(grow); // 둘째 선택이라면 update 수행
					System.out.println("result : " + iResult);

					System.out.println("둘째질문 gid : " + gptTop.getGid());
					System.out.println("업데이트 전 시간 : " + gptTop.getGptreg());
					gs.updateGptReg(gid);
					System.out.println("업데이트 후 시간 : " + gs.selectGptTop(memail).getGptreg());

					if (iResult == 1) // update true
						model.addAttribute("grow", grow);

					else // update false
						model.addAttribute("msg", "등록 실패.");

				}

				/*
				 * case "c": System.out.println("스위치_Character"); if (gptCharacterTop == null) {
				 * // 첫 선택이라면. iResult = gs.insertGptCharacter(character); // 첫 선택이라면 insert 수행
				 * System.out.println("result : " + iResult); System.out.println("첫질문 gid : " +
				 * gptTop.getGid()); gs.updateGptReg(gid); System.out.println("인설트 시간 : " +
				 * gs.selectGptTop(memail).getGptreg());
				 * 
				 * character.setGid(gid); character.setMemail(memail);
				 * 
				 * if (iResult == 1) // insert true mainList.put("character", character); else
				 * // insert false mainList.put("msg", "등록 실패.");
				 * 
				 * } else if (gptCharacterTop != null) { // 둘째 선택이라면. character.setGid(gid);
				 * character.setMemail(memail); iResult = gs.updateCharacter(character); // 둘째
				 * 선택이라면 update 수행 System.out.println("result : " + iResult);
				 * 
				 * System.out.println("둘째질문 gid : " + gptTop.getGid());
				 * System.out.println("업데이트 전 시간 : " + gptTop.getGptreg());
				 * gs.updateGptReg(gid); System.out.println("업데이트 후 시간 : " +
				 * gs.selectGptTop(memail).getGptreg());
				 * 
				 * if (iResult == 1) // update true mainList.put("character", character);
				 * 
				 * else // update false mainList.put("msg", "등록 실패.");
				 * 
				 * }
				 */
				// readCount 처리문
				ReadCount readCount = gs.selectReadCountTop();
				if (readCount == null) // readCount가 있다면
					gs.insertReadCount(readCount);
				readCount = gs.selectReadCountTop();
				gs.readCountPlus(readCount, resumeType);

			}
		} else {
			System.out.println("값이 없음.");
			model.addAttribute("mainMsg", "값이 없음");
			return "redirect:/gptMain";
		}
		String s = "oo";
		model.addAttribute("s", s);
		System.out.println("\n ***** Controller_gptSelect끝 ***** \n");
		return "redirect:/gptMain";
	}

}

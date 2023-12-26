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
import com.example.demo.model.GptGrow;
import com.example.demo.service.GptService;

@Controller
public class GptController {
	private static String mEmail = "master";
	@Autowired
	private GptService gs;

	@RequestMapping("/gptMain")
	public String gptMain(GptGrow grow, Model model, HttpSession session) {
		// mEmail = (String) session.getAttribute("mEMail");

		GPT gptTop = gs.selectGptTop(mEmail); // 세션의 최신질문 1개 구해옴
		int gid = 0;
		if (gptTop != null) {
			gid = gptTop.getGid();
			grow = gs.selectGptGrowTop(gid);
		}

		if (grow != null) {
			model.addAttribute("grow", grow);
		}
		return "gpt/gptMain";
	}

	@ResponseBody
	@RequestMapping("/gptRequest")
	public Map<String, Object> gptRequest(@RequestBody String jString, HttpSession session) {
		System.out.println("gptRequest");
		// mEmail = (String) session.getAttribute("mEMail");
		Timestamp oldTime = new Timestamp(System.currentTimeMillis());
		Timestamp newTime = new Timestamp(System.currentTimeMillis());
		int iResult = 0;
		// mEmail = (String) session.getAttribute("mEMail");
		System.out.println("mEmail : " + mEmail);

		GPT gptTop = gs.selectGptTop(mEmail); // 세션의 최신질문 1개 구해옴

		JSONObject json = new JSONObject(jString);
		Map<String, Object> qResult = gs.request(json); // 최종답변 및 필요값들 담긴상태
		System.out.println("최종답변 : " + qResult.get("resultContent"));

		if (qResult.get("resultContent") != null) { // GPT가 응답했을때만 insert를 하기위해 하위배치
			if (gptTop == null) { // 첫 질문이라면
				gptTop = new GPT();
				gptTop.setMemail(mEmail);
				gs.insertGpt(gptTop); // GPT객체 인서트 한뒤
				gptTop = gs.selectGptTop(mEmail);
				oldTime = gptTop.getGanswerreg(); // 인서트된 시간 다시 구해옴
				System.out.println("인설트 GPT_gid: " + gptTop.getGid() + " mEmail : " + gptTop.getMemail() + " 시간 : "
						+ gptTop.getGanswerreg());

			} else { // 대화중이라면 (값이 있음)
				oldTime = gptTop.getGanswerreg(); // DB에 있는 시간 구해옴
				System.out.println("셀렉트 GPT_gid : " + gptTop.getGid() + " mEmail : " + gptTop.getMemail() + " 시간 : "
						+ gptTop.getGanswerreg());
			}

			boolean tResult = gs.TimeOver(newTime, oldTime); // 30초가 경과됬는지

			if (tResult == true) {
				gptTop = new GPT();
				gptTop.setMemail(mEmail);
				iResult = gs.insertGpt(gptTop);
				System.out.println("시간비교 후 GPT재생성 : " + iResult + " timeOver_gid : " + gptTop.getGid());
			}
		}
		System.out.println("Controller_gptRequest 끝");
		return qResult;
	}

	@RequestMapping("/gptSelect")
	public String gptSelect(Model model, GptGrow grow, String resumeType, HttpSession session,
			HttpServletRequest request, String resultContent) {
		System.out.println("gptSelect");
		System.out.println("resumeType : " + resumeType);
		System.out.println("getGptgcontent : " + grow.getGptgcontent());

		int iResult = 0;
		String mEmail = (String) session.getAttribute("mEMail");
		System.out.println("mEmail : " + mEmail);

		GPT gptTop = gs.selectGptTop(mEmail); // 세션의 최신질문 1개 구해옴 ( GPT는 무조건 존재함 질문을 던지고 왔기때문에 )
		int gid = gptTop.getGid();
		GptGrow gptGrowTop = gs.selectGptGrowTop(gid); // 세션의 최신질문 1개 구해옴.

		System.out.println("if타기전");
		if (gptTop != null) {
			switch (resumeType) {
			case "g":
				System.out.println("스위치-grow");
				if (gptGrowTop == null) { // 첫 선택이라면.
					System.out.println("스위치_grow_timeOver_true");
					System.out.println("첫질문 gid : " + gptTop.getGid());
					System.out.println("업데이트 전 시간 : " + gptTop.getGanswerreg());

					gs.updateGptReg(gid);
					System.out.println("업데이트 후 시간 : " + gs.selectGptTop(mEmail).getGanswerreg());

					grow.setGid(gid);
					iResult = gs.insertGptGrow(grow); // 첫 선택이라면 insert 수행
					System.out.println("result : " + iResult);
					if (iResult == 1) // insert true
						model.addAttribute("grow", grow);
					else // insert false
						model.addAttribute("msg", "등록 실패.");

				} else if (gptGrowTop != null) { // 둘째 선택이라면.
					System.out.println("스위치-grow-여러번 질문");
					System.out.println("둘째질문 gid : " + gptTop.getGid());
					System.out.println("업데이트 전 시간 : " + gptTop.getGanswerreg());

					gs.updateGptReg(gid);
					System.out.println("업데이트 후 시간 : " + gs.selectGptTop(mEmail).getGanswerreg());

					grow.setGid(gid);
					iResult = gs.updateGrow(grow); // 둘째 선택이라면 update 수행
					System.out.println("result : " + iResult);

					if (iResult == 1) // update true
						model.addAttribute("grow", grow);

					else // update false
						model.addAttribute("msg", "등록 실패.");

				}
			}
		}
		System.out.println("Controller_gptSelect 끝");
		return "redirect:/gptMain";
	}

}

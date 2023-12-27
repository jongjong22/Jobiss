package com.example.demo.service;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.GptDao;
import com.example.demo.model.GPT;
import com.example.demo.model.GptGrow;
import com.example.demo.model.ReadCount;

@Service
public class GptService {
	private static final String api_key = "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"; // api키 하루단위 초기화됨.

	@Autowired
	private GptDao dao;

	public int countGptGrow() {
		return dao.countGptGrow();
	}

	public int insertGptGrow(GptGrow grow) {
		return dao.insertGptGrow(grow);
	}

	// GPT 선택
	public int updateGrow(GptGrow grow) {
		return dao.updateGrow(grow);
	}

	public GptGrow selectGptGrowTop(int gid) {
		return dao.selectGptGrowTop(gid);
	}

	public GPT selectGptTop(String mEmail) {
		return dao.selectGptTop(mEmail);
	}

	public int insertGpt(GPT gpt) {
		return dao.insertGpt(gpt);
	}

	public int updateGptReg(int gid) {
		return dao.updateGptReg(gid);
	}

	public int insertReadCount(ReadCount readCount) {
		return dao.insertReadCount(readCount);
	}

	public ReadCount selectReadCountTop() {
		return dao.selectReadCountTop();
	}

	public int updateReadCount(ReadCount readCount) {
		return dao.updateReadCount(readCount);
	}

	// 답변 시간을 비교
	public boolean TimeOver(Timestamp newTime, Timestamp oldTime) {
		Long subtract = (newTime.getTime() - oldTime.getTime()) / 1000;
		System.out.println("oldTime : " + oldTime.getTime());
		System.out.println("newTime : " + newTime.getTime());
		System.out.println("시간차이 (초) : " + subtract);

		boolean result = subtract > 30 ? true : false;
		System.out.println("시간이 30초가 지났는지? : " + result);
		return result;
	}

	// GPT 질의응답
	public Map<String, Object> request(JSONObject json) {
		System.out.println("\n ***** Service_gptRequest ***** \n");
		// 절대조건
		final String keyword = json.getString("keyword"); // 유저입력 메시지
		final String resumeType = json.getString("resumeType"); // 질문유형
		final String systemContent = "You are the interviewer. and Think step by step, "; // GPT 대전제
		final String startConetnet = " 이력서를 수정할꺼야 내용은"; // 시작점

//		 final String endConetnet = " 에 대한 내용을 수정하고 답변을 한글로 해줘. "; // 끝점
		final String endConetnet = " 이것에 대한 내용을 수정하고 답변을 한글로 해줘. 답변을 20자 이내로 해줘 "; // 끝점

		Map<String, Object> result = new HashMap<String, Object>(); // 리턴객체 (서비스에서 리턴을 하지않기위해)
		String userContent = ""; // 최종질문
		String resultContent = ""; // 최종답변

		if ((keyword.length() > 0) && (resumeType.length() > 0)) {
			if (resumeType.equals("g")) { // 성장과정을 선택한경우
				userContent = startConetnet + " 성장과정에 관한 내용이야" + endConetnet;
			} else if (resumeType.equals("c")) { // 성격의 장단점을 선택한 경우
				userContent = startConetnet + " 성격의 장단점에 관한 내용이야" + endConetnet;
			} else if (resumeType.equals("p")) { // 직무역량을 선택한 경우
				userContent = startConetnet + " 직무역량에 관한 내용이야" + endConetnet;
			} else if (resumeType.equals("m")) { // 입사지원 동기를 선택한 경우
				userContent = startConetnet + " 입사 지원동기에 관한 내용이야" + endConetnet;
			}
			System.out.println("최종 질문 : " + userContent);

			// GPT 모델링과정
			JSONObject messages = new JSONObject();
			messages.put("role", "system");
			messages.put("content", systemContent);

			// GPT 유저 입력 메시지 전달
			JSONObject userMessage = new JSONObject();
			userMessage.put("role", "user");
			userMessage.put("content", userContent);

			JSONObject[] messageArray = { messages, userMessage };

			JSONObject data = new JSONObject();
			data.put("model", "gpt-3.5-turbo");
			data.put("temperature", 0.5);
			data.put("n", 1);
			data.put("messages", messageArray);

			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder().uri(URI.create("https://api.openai.com/v1/chat/completions"))
					.header("Authorization", "Bearer " + api_key).header("Content-Type", "application/json")
					.POST(HttpRequest.BodyPublishers.ofString(data.toString())).build();

			try {
				HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
				JSONObject jsonResponse = new JSONObject(response.body());
				resultContent = jsonResponse.getJSONArray("choices").getJSONObject(0).getJSONObject("message")
						.getString("content");
				if (resultContent.length() > 0) { // 답변이 1글자라도 들어온경우.
					result.put("resultContent", resultContent);
					result.put("resumeType", resumeType); // 응답이 돌아온경우
					System.out.println("답변 성공 - 서비스");
				} else {
					System.out.println("GPT 답변이 없음.");
					result.put("msg", "GPT의 응답이 없습니다.");
					result.put("resultType", "resultNull");
				}

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("GPT 답변이 없음.");
				result.put("msg", "GPT의 응답이 없습니다.");
				result.put("resultType", "resultNull");
				result.put("resumeType", resumeType);
				return result;
			}

		} else { // 유저의 입력이 0인경우
			System.out.println("request : 값이 안들어옴");
			result.put("msg", "값을 제대로 입력해 주세요.");
			result.put("resultType", "requestNull");
			result.put("resumeType", resumeType);
		}
		;
		System.out.println("\n ***** Service_gptRequest 끝 ***** \n");
		return result;
	}

	// 컨설팅 선택시 readCount 증가
	public int readCountPlus(ReadCount readCount, String resumeType) {

		int greadcount = readCount.getGreadcount(); // 성장과정 조회수
		int creadcount = readCount.getCreadcount(); // 성격장단점 조회수
		int mreadcount = readCount.getMreadcount(); // 입사동기 조회수
		int preadcount = readCount.getPreadcount(); // 입사후 포부 조회수
		int result = 0;
		switch (resumeType) {
		case "g":
			greadcount += 1;
			readCount.setGreadcount(greadcount);
			System.out.println("readCount : g");
			break;
		case "c":
			creadcount += 1;
			readCount.setGreadcount(creadcount);
			System.out.println("readCount : c");
			break;
		case "m":
			mreadcount += 1;
			readCount.setGreadcount(mreadcount);
			System.out.println("readCount : m");
			break;
		case "p":
			preadcount += 1;
			readCount.setGreadcount(preadcount);
			System.out.println("readCount : p");
			break;
		}
		result = updateReadCount(readCount);
		if (result > 0)
			System.out.println("readCount 업데이트 성공");
		else if (result == 0)
			System.out.println("readCount 업데이트 실패");

		return result;
	}

}
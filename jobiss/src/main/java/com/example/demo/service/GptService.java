package com.example.demo.service;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.example.demo.dao.GptDao;
import com.example.demo.model.GPT;
import com.example.demo.model.GptCharacter;
import com.example.demo.model.GptGrow;
import com.example.demo.model.GptMotive;
import com.example.demo.model.GptPlan;
import com.example.demo.model.ReadCount;

@Service
public class GptService {

	@Value("${openai.model}")
	private String model;

	@Value("${openai.url}")
	private String url;

	@Value("${openai.api_key}")
	private String api_key;

	@Autowired
	private GptDao dao;

	/*** GPT 부모글 ***/
	// 부모 insert
	public int insertGpt(GPT gpt) {
		return dao.insertGpt(gpt);
	}

	// 부모 특정글
	public GPT selectGptGid(int gid) {
		return dao.selectGptGid(gid);
	}

	// 부모 최신글
	public GPT selectGptTop(String mEmail) {
		return dao.selectGptTop(mEmail);
	}

	// 부모 전체글
	public List<GPT> selectGptList(String mEmail) {
		return dao.selectGptList(mEmail);
	}

	// 부모 시간 최신화
	public int updateGptReg(int gid) {
		return dao.updateGptReg(gid);
	}

	/*** 성장과정 ***/
	// 성장과정 insert
	public int insertGptGrow(GptGrow grow) {
		return dao.insertGptGrow(grow);
	}

	// 성장과정 gid기준 전체글
	public List<GptGrow> selectGptGrowGid(int gid) {
		return dao.selectGptGrowGid(gid);
	}

	// 성장과정 최신글
	public GptGrow selectGptGrowTop(String memail) {
		return dao.selectGptGrowTop(memail);
	}

	// 성장과정 최신화
	public int updateGrow(GptGrow grow) {
		return dao.updateGrow(grow);
	}

	/*** 성격장단점 ***/
	// 성격장단점 insert
	public int insertGptCharacter(GptCharacter character) {
		return dao.insertGptCharacter(character);
	}

	// 성격장단점 gid기준 전체글
	public List<GptCharacter> selectGptCharacterGid(int gid) {
		return dao.selectGptCharacterGid(gid);
	}

	// 성격장단점 최신글
	public GptCharacter selectGptCharacterTop(String memail) {
		return dao.selectGptCharacterTop(memail);
	}

	// 성격장단점 최신화
	public int updateCharacter(GptCharacter character) {
		return dao.updateCharacter(character);
	}

	/*** 지원동기 ***/
	// 지원동기 insert
	public int insertGptMotive(GptMotive motive) {
		return dao.insertGptMotive(motive);
	}

	// 지원동기 gid기준 전체글
	public List<GptMotive> selectGptMotiveGid(int gid) {
		return dao.selectGptMotiveGid(gid);
	}

	// 지원동기 최신글
	public GptMotive selectGptMotiveTop(String memail) {
		return dao.selectGptMotiveTop(memail);
	}

	// 지원동기 최신화
	public int updateMotive(GptMotive motive) {
		return dao.updateMotive(motive);
	}

	/*** 입사후포부 ***/
	// 입사후포부 insert
	public int insertGptPlan(GptPlan plan) {
		return dao.insertGptPlan(plan);
	}

	// 성장과정 gid기준 전체글
	public List<GptPlan> selectGptPlanGid(int gid) {
		return dao.selectGptPlanGid(gid);
	}

	// 입사후포부 최신글
	public GptPlan selectGptPlanTop(String memail) {
		return dao.selectGptPlanTop(memail);
	}

	// 입사후포부 최신화
	public int updatePlan(GptPlan plan) {
		return dao.updatePlan(plan);
	}

	/*** 조회수 ***/
	// 조회수 insert
	public int insertReadCount(ReadCount readCount) {
		return dao.insertReadCount(readCount);
	}

	// 조회수 최신글
	public ReadCount selectReadCountTop() {
		return dao.selectReadCountTop();
	}

	// 조회수 최신화
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

		Map<String, Object> result = new HashMap<String, Object>(); // 리턴객체 (서비스에서 리턴을 하지않기위해)

		// 절대조건
		final String keyword = json.getString("keyword"); // 유저입력 메시지
		final String resumeType = json.getString("resumeType"); // 질문유형
		final String lengthType = json.getString("lengthType"); // 질문유형

		final String systemContent = " you are a job seeker  " + "Let me suggest three conditions. 1=short"
				+ "2=Only as many characters as given" + "3=long and detailed"
				+ "Please answer according to the conditions above. and Think step by step Answer in Korean"; // GPT 대전제

		final String startConetnet = " 이력서를 수정할꺼야 내용은"; // 시작점
		String endConetnet = ""; // 끝점
		String userContent = ""; // 최종질문
		String resultContent = ""; // 최종답변

		System.out.println("resumeType : " + resumeType);
		System.out.println("lengthType : " + lengthType);
		if (lengthType.length() > 0) {
			switch (lengthType) {
			case "short":
				endConetnet += "1=short 에 대한 부족한 부분을 3가지만 지적해줘. 어디가 부족하다거나 어디를 어떻게 고쳐야 한다거나 그런식으로. 내용은 쌍따옴표 안에있어 내 질문은 대답하지마 ";
				break;
			case "medium":
				endConetnet += "2=midium 에 대한 내용을 수정해서 150자 내외로 대답해줘. 부족하다면 채워서 넣어줘. 내용을 쌍따옴표로 묶어준 부분만 수정해줘 ";
				break;
			case "long":
				endConetnet += "3=long 에 대한 내용을 수정해서 200자 내외로 대답해줘. 부족하다면 채워서 넣어줘. 내용을 쌍따옴표로 묶어준 부분만 수정해줘  ";
				break;
			case "test":
				endConetnet += " 20자 이내로만 대답해.";
				break;
			}

		}
		if ((keyword.length() > 0) && (resumeType.length() > 0 && lengthType.length() > 0)) {
			if (resumeType.equals("g")) { // 성장과정을 선택한경우
				userContent = startConetnet + " 성장과정에 관한 내용이야 : \"" + keyword + "\"" + endConetnet;
			} else if (resumeType.equals("c")) { // 성격의 장단점을 선택한 경우
				userContent = startConetnet + " 성격의 장단점에 관한 내용이야 : \"" + keyword + "\"" + endConetnet;
			} else if (resumeType.equals("p")) { // 직무역량을 선택한 경우
				userContent = startConetnet + " 직무역량에 관한 내용이야 : \"" + keyword + "\"" + endConetnet;
			} else if (resumeType.equals("m")) { // 입사지원 동기를 선택한 경우
				userContent = startConetnet + " 입사 지원동기에 관한 내용이야 : \"" + keyword + "\"" + endConetnet;
			}
			System.out.println("GPT 모델링 : " + systemContent);
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
			data.put("model", model);
			data.put("temperature", 0.5);
			data.put("n", 1);
			data.put("messages", messageArray);

			HttpClient client = HttpClient.newHttpClient();
			HttpRequest request = HttpRequest.newBuilder().uri(URI.create(url))
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
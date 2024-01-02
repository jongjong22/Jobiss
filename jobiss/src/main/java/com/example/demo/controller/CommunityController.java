package com.example.demo.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.Community;
import com.example.demo.model.Member;
import com.example.demo.service.CommunityService;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService cs;
	
	@RequestMapping("community.do")
	public String community(Model model) {
		
		// 전체 커뮤니티 글 리스트 구하기
		System.out.println("요기?");
		List<Community> communityList = cs.selectCommunityList();
		System.out.println("communityList : " + communityList); 
		model.addAttribute("communityList", communityList);
		
		return "community/communityForm";
	}

	/*
	 * 커뮤니트 글 작성 폼 이동 메소드
	 */
	@RequestMapping("communityWriteForm.do")
	public String communityWriteForm(HttpSession session, Model model) {

		Member member = (Member) session.getAttribute("member");
		System.out.println("member : " + member);

		if (member != null) {
			String memail = member.getMemail();
			System.out.println("memail : " + memail);
			model.addAttribute("memail", memail);
		}

		return "community/communityWriteForm";
	}

	@RequestMapping("communityInsert.do")
	public String communityInsert(Community community, Model model,
			@RequestParam(value = "cimage1", required = false) MultipartFile mfile, HttpServletRequest request)
			throws Exception {
		int result, sizeCheck, extensionCheck;

		// 첨부 파일명
		String fileName = mfile.getOriginalFilename();
		System.out.println("파일명 : " + fileName);

		// 첨부파일 사이즈
		int size = (int) mfile.getSize();

		// 파일 저장될 경로
		String path = request.getRealPath("images");
		System.out.println("oldpath : " + path);

		// 확장자 잘라서 저장할 배열
		String[] file = new String[2];

		// 확장자 잘라서 저장할 변수
		String newFileName = "";

		if (fileName != "") { // 첨부 파일이 전송된 경우
			// .뒤에 확장자만 자르기
			String extension = fileName.substring(fileName.lastIndexOf("."), fileName.length());

			UUID uuid = UUID.randomUUID();

			// 난수를 발생시킨 후 확장자 결합
			newFileName = uuid.toString() + extension;

			// 확장자를 구분해 조건을 주기 위해 잘라줌 file[1] 에 확장자가 저장됨.
			StringTokenizer st = new StringTokenizer(fileName, ".");
			file[0] = st.nextToken();
			file[1] = st.nextToken();

			if (size > 10000000) {
				// 사이즈가 설정된 범위를 초과할 경우
				sizeCheck = -1;
				model.addAttribute("sizeCheck", sizeCheck);
				System.out.println("설정범위 초과");
				return "communityResultCheck.do";

			} else if (!file[1].equals("jpg") && !file[1].equals("png") && !file[1].equals("jpeg")
					&& !file[1].equals("gif")) {
				extensionCheck = -1;
				model.addAttribute("extensionCheck", extensionCheck);
				return "communityResultCheck.do";
			}

		}

		// 첨부파일이 전송된 경우
		if (size > 0) {
			mfile.transferTo(new File(path + "/" + newFileName));
			community.setCimage(newFileName);
			System.out.println("전송됐음!!");
		}
		
		// 커뮤니티 글 insert
		result = cs.communityInsert(community);

		return "redirect:/community.do";
	}
}

























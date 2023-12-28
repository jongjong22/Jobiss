package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.CommunityService;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService cs;
	
	/*
	 * 커뮤니트 글 작성 폼 이동 메소드
	 */
	@RequestMapping("communityWriteForm.do")
	public String communityWriteForm() {
		
		return "community/communityWriteForm";
	}
}

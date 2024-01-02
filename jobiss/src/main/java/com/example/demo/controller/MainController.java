package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.GptService;
import com.example.demo.service.MemberService;

@Controller
public class MainController {

	@Autowired
	private MemberService ms;

	@RequestMapping("main.do")
	public String main(Model model) {
		return "common/main";
	}

}

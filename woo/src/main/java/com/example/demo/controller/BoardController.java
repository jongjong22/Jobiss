package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService bs;

	@RequestMapping("main.do")
	public String main() {
		System.out.println("main");

		return "common/main";
	}

}

package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.GptService;

@Controller
public class GptController {

	@Autowired
	private GptService gs;

	@RequestMapping("/gptMain")
	public String gptMain() {
		System.out.println("gptMain");
		return "gpt/gptMain";
	}
 

}

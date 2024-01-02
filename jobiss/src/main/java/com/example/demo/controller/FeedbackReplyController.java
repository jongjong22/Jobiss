package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.FeedbackReply;
import com.example.demo.model.Member;
import com.example.demo.service.FeedbackReplyService;

@Controller
public class FeedbackReplyController {

	@Autowired
	private FeedbackReplyService service;

	@RequestMapping("feedReplyWrite.do")
	public String feedReplyWrite(FeedbackReply feedbackreply, Model model) {

		int tmp = service.insert(feedbackreply);

		if (tmp == 1) {

			int fid = feedbackreply.getFid();

			model.addAttribute("insertResult", tmp);
			model.addAttribute("fid", fid);
		}

		return "feedback/feedReplyInsertResult";
	}

	// 댓글 삭제
	@RequestMapping("feedReplyDelete.do")
	@ResponseBody
	public String feedReplyDelete(HttpSession session, int frid) {

		int deleteResult = 0;

		FeedbackReply db = service.getBoard(frid);

		Member member = (Member) session.getAttribute("member");

		String id = member.getMemail();

		String emailFromDB = db.getMemail();

		if (id.equals(emailFromDB)) {
			deleteResult = service.delete(frid);
		}

		if (deleteResult == 1) {
			return "Y";
		} else {
			return "N";
		}

	}

}

package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Member;

import com.example.demo.model.ReviewReply;
import com.example.demo.service.ReviewReplyService;

@Controller
public class ReviewReplyController {

	@Autowired
	public ReviewReplyService service;

	// 댓글작성으로 이동
	@RequestMapping("replyWrite.do")
	public String replyWrite(ReviewReply reviewreply, Model model) {
		
		int tmp = service.insert(reviewreply);

		if (tmp == 1) {

			int rid = reviewreply.getRid();
			
			model.addAttribute("insertResult", tmp);
			model.addAttribute("rid", rid);
		}

		return "review/replyInsertResult";
	}



	// 댓글 수정
	@RequestMapping("replyUpdate.do")
	public String replyUpdate(ReviewReply reviewreply, int rrid, @RequestParam(value = "page", defaultValue = "1") int page, HttpSession session, Model model) {


		int updateResult = 0;
		
		ReviewReply db = service.getBoard(reviewreply.getRrid());
		
		Member member = (Member) session.getAttribute("member"); // session에서 member가져와서 member변수에 넣어줌 ~
		
		String id = member.getMemail(); // 멤버에 있는 이메일 가져옴 !

		String emailFromDB = db.getMemail(); // db에 있는 이메일 가져옴

		if(id.equals(emailFromDB)) {
		    updateResult = service.update(reviewreply);
		} else {
		    updateResult = -1;
		}

		
		model.addAttribute("page",page);
		model.addAttribute("updateResult",updateResult);
		model.addAttribute("reviewply",reviewreply);
		
		
		return "review/reviewDetails";

	}

	// 댓글 삭제
	@RequestMapping("replyDelete.do")
	@ResponseBody
	public String replyDelete(HttpSession session, int rrid) {

		int deleteResult = 0;
		
		ReviewReply db = service.getBoard(rrid);
		
		Member member = (Member)session.getAttribute("member");
		
		String id = member.getMemail();
		
		String emailFromDB = db.getMemail();
		
		if(id.equals(emailFromDB)) {
			deleteResult = service.delete(rrid);
		}
		
	    if(deleteResult == 1) {
	    	return "Y";
	    }else {
	    	return "N";
	    }		
		

	}
}

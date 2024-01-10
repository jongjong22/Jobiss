package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Member;
import com.example.demo.model.QnA;
import com.example.demo.model.ReQnA;
import com.example.demo.service.QnAService;
import com.example.demo.service.ReQnAService;

@Controller
public class ReQnaController {
	
	@Autowired
	public QnAService qservice;
	
	@Autowired
	public ReQnAService rqservice;
	
	// 댓글 목록
	@RequestMapping("qnareplylist.do")
	public String qnareplylist(int qid, Model model) {
		QnA qna = qservice.getqna(qid);
		
		
		return "";
	}
	
	
	
	
	//댓글 작성으로 이동
	@RequestMapping("qnareplyWrite.do")
	public String qnareplyWrite(ReQnA reqna, int page, Model model) {
		
		int tmp = rqservice.insert(reqna);
		
		if (tmp == 1) {
			
			int qid = reqna.getQid();
			
			model.addAttribute("insertResult", tmp);
			model.addAttribute("qid", qid);
			model.addAttribute("page", page);
			
		}
		
		return "QnA/replyresult";
	}
	
	//댓글 삭제
	@RequestMapping("deleteqnareply.do")
	@ResponseBody
	public String deleteqnareply(HttpSession session, int qrid) {
		
		int deleteResult = 0;
		
		ReQnA db = rqservice.getBoard(qrid);
		
		Member member = (Member)session.getAttribute("member");
		
		String id = member.getMemail();
		
		String emailFromDB = db.getMemail();
		
		if(id.equals(emailFromDB)) {
			deleteResult = rqservice.delete(qrid);
		}
		
	    if(deleteResult == 1) {
	    	return "Y";
	    }else {
	    	return "N";
	    }		
		

	}

}

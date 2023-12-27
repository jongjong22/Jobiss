package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Member;
import com.example.demo.model.Review;
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

			model.addAttribute("insertResult", tmp);

		}

		return "review/replyInsertResult";
	}

	// 댓글 리스트 보여주기
	@RequestMapping("replyList.do")
	public String replyList(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		 int limit = 5; // 한 페이지에 출력할 데이터 개수
		    

		    int listcount = service.getCount(); // 전체 데이터 개수

		    int start = (page - 1) * 10;  // limit로 추출하기 위한 시작번호 : 0, 10, 20...

		    List<Review> resultList = service.getList(start);

			System.out.println(resultList);
			
		    int pageCount = (int) Math.ceil((double) listcount / limit); // 전체 페이지 개수

		    int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지

	

		    int endPage = startPage + 10; // 끝 페이지 
		    
		    if (endPage > pageCount) {
		        endPage = pageCount;
		    }



		    model.addAttribute("list", resultList);
		    model.addAttribute("startPage", startPage);
		    model.addAttribute("endPage", endPage);
		    model.addAttribute("pageCount", pageCount);
		    model.addAttribute("listcount", listcount);
		    model.addAttribute("page", page);
		    
		
		return "review/reviewDetails";
	}

	// 댓글 수정
	@RequestMapping("replyUpdate.do")
	public String replyUpdate(ReviewReply reviewreply, int rid, @RequestParam(value = "page", defaultValue = "1") int page, HttpSession session, Model model) {


		int updateResult = 0;
		
		Review db = service.getBoard(reviewreply.getRid());
		
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
	public String replyDelete(HttpSession session, int rid) {

int deleteResult = 0;
		
		Review db = service.getBoard(rid);
		
		Member member = (Member)session.getAttribute("member");
		
		String id = member.getMemail();
		
		String emailFromDB = db.getMemail();
		
		if(id.equals(emailFromDB)) {
			deleteResult = service.delete(rid);
		}
		
	    if(deleteResult == 1) {
	    	return "Y";
	    }else {
	    	return "N";
	    }		
		

	}
}

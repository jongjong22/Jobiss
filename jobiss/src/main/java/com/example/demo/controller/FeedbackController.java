package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.FeedBack;
import com.example.demo.model.FeedbackReply;
import com.example.demo.model.Member;
import com.example.demo.service.FeedbackReplyService;
import com.example.demo.service.FeedbackService;

@Controller
public class FeedbackController {

	@Autowired
	private FeedbackService service;
	
	@Autowired
	private FeedbackReplyService fs;

	@RequestMapping("FeedWriteForm.do")
	public String FeedWriteForm() {

		return "feedback/feedWriteForm";

	}

	@RequestMapping("FeedWrite.do")
	public String FeedWrite(FeedBack feedback, String page, Model model, HttpSession session) {

		Member member = (Member) session.getAttribute("member");

		feedback.setMemail(member.getMemail());

		int FeedInsertResult = service.insert(feedback);

		if (FeedInsertResult == 1) {

			model.addAttribute("FeedInsertResult", FeedInsertResult);
			model.addAttribute("page", page);

		}

		return "feedback/feedInsertResult";

	}

	@RequestMapping("FeedbackList.do")
	public String FeedbackList(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		int limit = 10; // 한 페이지에 출력할 데이터 개수

		int listcount = service.getCount(); // 전체 데이터 개수

		int start = (page - 1) * 10; // limit로 추출하기 위한 시작번호 : 0, 10, 20...

		List<FeedBack> resultList = service.getList(start);

		int pageCount = (int) Math.ceil((double) listcount / limit); // 전체 페이지 개수

		int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
		int endPage = startPage + 10; // 끝 페이지
		if (endPage > pageCount) {
			endPage = pageCount;
		}

		model.addAttribute("Flist", resultList);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("listcount", listcount);
		model.addAttribute("page", page);

		return "feedback/feedbackList";
	}

	
	@RequestMapping("FeedDetails.do")
	public String FeedDetails(int fid, @RequestParam(value = "page", defaultValue = "1") int page, Model model ) {
		
			int limit = 10; // 한 페이지에 출력할 데이터 개수

		    int listcount = service.getCount(); // 전체 데이터 개수

		    int start = (page - 1) * 10;  // limit로 추출하기 위한 시작번호 : 0, 10, 20...

		    int pageCount = (int) Math.ceil((double) listcount / limit); // 전체 페이지 개수

		    int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
		    int endPage = startPage + 10; // 끝 페이지 
		    if (endPage > pageCount) {
		        endPage = pageCount;
		    }
			
			FeedBack feedback = service.getBoard(fid);
			
			String content = feedback.getFcontent().replace("\n", "<br>");
			
			List<FeedbackReply> Flist = fs.FgetList(fid);
			
			model.addAttribute("Flist", Flist);
			model.addAttribute("feedback",feedback);
			model.addAttribute("fid",fid);
			model.addAttribute("content",content);
			model.addAttribute("page",page);
			
		
		return "feedback/feedDetails";
	}
	

	@RequestMapping("FeedUpdateForm.do")
	public String FeedUpdateForm(int fid, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {

			
			FeedBack feedback = service.getBoard(fid);
			
			model.addAttribute("page",page);
			model.addAttribute("feedback",feedback);
			model.addAttribute("fid",fid);
			
		
		return "feedback/feedUpdateForm";
	}
	
	@RequestMapping("FeedUpdate.do")
	public String FeedUpdate(FeedBack feedback, int fid, @RequestParam(value = "page", defaultValue = "1") int page, HttpSession session, Model model) {

			int updateResult = 0;
			
			FeedBack db = service.getBoard(feedback.getFid());
			
			Member member = (Member) session.getAttribute("member"); // session에서 member가져와서 member변수에 넣어줌 ~
			
			String id = member.getMemail(); // 멤버에 있는 이메일 가져옴 !

			String emailFromDB = db.getMemail(); // db에 있는 이메일 가져옴

			if(id.equals(emailFromDB)) {
			    updateResult = service.update(feedback);
			} else {
			    updateResult = -1;
			}

			
			model.addAttribute("page",page);
			model.addAttribute("updateResult",updateResult);
			model.addAttribute("feedback",feedback);
			
		
		return "feedback/feedUpdateResult";
	}
	

	@RequestMapping(value="FeedbackDelete.do" ,method=RequestMethod.POST)
	@ResponseBody
	public String FeedbackDelete(HttpSession session, int fid) {

		int deleteResult = 0;
		
		FeedBack db = service.getBoard(fid);
		
		Member member = (Member)session.getAttribute("member");
		
		String id = member.getMemail();
		
		String emailFromDB = db.getMemail();
		
		if(id.equals(emailFromDB)) {
			deleteResult = service.delete(fid);
		}
		
	    if(deleteResult == 1) {
	    	return "Y";
	    }else {
	    	return "N";
	    }
		

	}
}

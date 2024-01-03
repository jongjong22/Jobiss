package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public String FeedWrite(FeedBack feedback, Model model, HttpSession session) {

		Member member = (Member) session.getAttribute("member");

		feedback.setMemail(member.getMemail());

		int FeedInsertResult = service.insert(feedback);

		if (FeedInsertResult == 1) {
			model.addAttribute("FeedInsertResult", FeedInsertResult);
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
	public String FeedDetails(int fid, Model model ) {
		
			FeedBack feedback = service.getBoard(fid);
			
			String content = feedback.getFcontent().replace("\n", "<br>");
			
			List<FeedbackReply> Flist = fs.FgetList(fid);
			
			model.addAttribute("Flist", Flist);
			model.addAttribute("feedback",feedback);
			model.addAttribute("fid",fid);
			model.addAttribute("content",content);
		
		return "feedback/feedDetails";
	}
	

	@RequestMapping("FeedUpdateForm.do")
	public String FeedUpdateForm(int fid, Model model) {
			
			FeedBack feedback = service.getBoard(fid);
			
			String content = feedback.getFcontent().replace("\n", "<br>");
			
			model.addAttribute("feedback",feedback);
			model.addAttribute("content",content);
			
		return "feedback/feedUpdateForm";
	}
	
	@RequestMapping("FeedUpdate.do")
	@ResponseBody
	public String FeedUpdate(String ftitle, String fcontent, int fid, Model model) {

			Map map = new HashMap();
			map.put("ftitle", ftitle);
			map.put("fcontent", fcontent);
			map.put("fid", fid);
			
			int result = service.update(map);
			
			if(result == 1) {
				return "Y";
			}else {
				return "N";
			}
	}
	

	@RequestMapping(value="FeedbackDelete.do" ,method=RequestMethod.POST)
	@ResponseBody
	public String FeedbackDelete(int fid) {

     	int deleteResult = service.delete(fid);
		
	    if(deleteResult == 1) {
	    	return "Y";
	    }else {
	    	return "N";
	    }
	}
	
}

package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Member;
import com.example.demo.model.QnA;
import com.example.demo.model.ReQnA;
import com.example.demo.service.QnAService;
import com.example.demo.service.ReQnAService;



@Controller
public class QnaController{
	
	@Autowired
	public QnAService qservice;
	
	@Autowired 
	private ReQnAService rqservice;
	
	//글작성 폼으로 이동
	@RequestMapping("QnAform.do")
	public String QnAform() {
		
		return "QnA/QnAform";
	}
	
	//글작성
	@RequestMapping(value = "qnaWrite.do" , method = RequestMethod.POST)
	public String qnaWrite(QnA qna, HttpSession session, 
			 HttpServletRequest request, Model model) throws Exception {

	// session에서 "member"를 가져옴. 
	Member member = (Member)session.getAttribute("member");
	qna.setMemail(member.getMemail());
	
	int tmp = qservice.qnaInsert(qna);
	
	if (tmp == 1) {
		model.addAttribute("insertResult", tmp);
		System.out.println("성공");
	}
	
	return "QnA/insertresult";
	
}
	
	//QnA 리스트, 댓글 리스트 불러오기
	@RequestMapping("QnAlist.do")
	public String QnAlist(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		int limit = 10; // 한 페이지에 출력할 데이터 개수
		
		int listcount = qservice.getqnaCount(); // 전체 데이터 개수
		
		int start = (page - 1) * 10;  // limit로 추출하기 위한 시작번호 : 0, 10, 20...
		
		List<QnA> resultList = qservice.getqnaList(start);
		System.out.println("qnalist");
		
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
	    
	    return "QnA/QnAlist";
	}
	
	//QnA 상세페이지로 이동
	@RequestMapping("QnAcontent.do")
	public String QnAcontent(int qid, int page, Model model) {
//		int limit = 10; // 한 페이지에 출력할 데이터 개수
//
//	    int listcount = qservice.getqnaCount(); // 전체 데이터 개수
//
//	    int start = (page - 1) * 10;  // limit로 추출하기 위한 시작번호 : 0, 10, 20...
//
//	    int pageCount = (int) Math.ceil((double) listcount / limit); // 전체 페이지 개수
//
//	    int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
//	    int endPage = startPage + 10; // 끝 페이지 
//	    if (endPage > pageCount) {
//	        endPage = pageCount;
//	    }
	    
	    QnA qna = qservice.getqna(qid);
	    
	    String content = qna.getQcontent().replace("\n", "<br>");
	    
	    List<ReQnA> Rlist = rqservice.RgetList(qid);
	    
//		model.addAttribute("qid",qid);
	    model.addAttribute("Rlist", Rlist);
		model.addAttribute("content",content);
		model.addAttribute("qna",qna);
		model.addAttribute("page",page);
		
		return "QnA/QnAcontent";
	    
	}
	
	//수정폼으로 이동
	@RequestMapping("QnAupdateform.do")
	public String QnAupdateform(int qid, int page, Model model) {
	
		QnA qna = qservice.getqna(qid);
		
		model.addAttribute("page",page);
		model.addAttribute("qna", qna);
//		model.addAttribute("qid", qid);
		
		return "QnA/QnAupdateform";
	}
	
	//수정하기
	@RequestMapping("QnAupdate.do")
	public String QnAupdate(QnA qna, int page, HttpSession session, Model model) {
	
		int updateResult = 0;
		
		QnA db = qservice.getqna(qna.getQid());
		
		Member member = (Member) session.getAttribute("member"); // session에서 member가져와서 member변수에 넣어줌 ~
		
		String id = member.getMemail(); // 멤버에 있는 이메일 가져옴 !

		String emailFromDB = db.getMemail(); // db에 있는 이메일 가져옴

		if(id.equals(emailFromDB)) {
		    updateResult = qservice.qnaUpdate(qna);
		} else {
		    updateResult = -1;
		}

		model.addAttribute("page",page);
		model.addAttribute("updateResult",updateResult);
		model.addAttribute("qna",qna);
		
		return "QnA/updateresult";
		
	}
	
	//삭제하기
	@RequestMapping(value="qnaDelete.do" ,method=RequestMethod.POST)
	@ResponseBody
	public String qnaDelete(HttpSession session, int qid) {
		
		int deleteResult = 0;
		
		QnA db = qservice.getqna(qid);
		
		Member member = (Member)session.getAttribute("member");
		
		String id = member.getMemail();
		
		String emailFromDB = db.getMemail();
		
		if(id.equals(emailFromDB)) {
			deleteResult = qservice.qnaDelete(qid);
		}
		
	    if(deleteResult == 1) {
	    	return "Y";
	    }else {
	    	return "N";
	    }
		
	}

}
package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.QnA;
import com.example.demo.service.QnAService;



@Controller
public class QnaController {
	
	@Autowired
	private QnAService qs;
	
	//글작성 폼으로 이동
	@RequestMapping("QnAform.do")
	public String QnAform() {
		return "QnA/QnAform";
	}
	
	//글작성
	@RequestMapping("QnAwrite.do")
	public String QnAwrite(@ModelAttribute QnA qna,
							Model model) {
		
		int result = qs.qnaInsert(qna);
		if(result == 1) System.out.println("글 작성 성공");
			model.addAttribute("result", result);
		return "QnA/insertresult";
	}
	
	//리스트 불러오기
	@RequestMapping("QnAlist.do")
	public String QnAlist(@RequestParam(value = "page", defaultValue = "1") int page,
							Model model) {
	
		int limit = 10;
		
		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;
		
		int listCount = qs.getqnaCount();
		System.out.println("listcount");
		
		List<QnA> qnaList = qs.getqnaList(page);
		System.out.println("qnalist");
		
		int pageCount = listCount/limit+((listCount%10 == 0)?0:1);
		
		int startPage = ((page-1)/10) * limit + 1;	// 1, 11, 21...
		int endPage = startPage + 10 - 1;			// 10, 20, 30...
		
		if(endPage > pageCount)
			endPage = pageCount;
		
		model.addAttribute("page", page);
		model.addAttribute("listCount", listCount);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "QnA/QnAlist";
	}
	
	//상세페이지로 이동
	@RequestMapping("QnAcontent.do")
	public String QnAcontent(@RequestParam("qid") int qid,
							  @RequestParam("page") String page,
							  Model model) {
		qs.QnAUpdateCount(qid);
		QnA qna = qs.getQnA(qid);		
		String qcontent = qna.getQcontent().replace("\n","<br>");
		
		model.addAttribute("qna", qna);
		model.addAttribute("qcontent", qcontent);
		model.addAttribute("page", page);
		
		return "QnA/QnAcontent";
	}
	
	//수정폼으로 이동
	@RequestMapping("QnAupdateform.do")
	public String QnAupdateform(@ModelAttribute QnA qna,
							  @RequestParam("page") String page,
							  Model model) {
		
		int result = qs.QnAUpdate(qna);
		
		model.addAttribute("result", result);
		model.addAttribute("qna", qna);
		model.addAttribute("page", page);
		
		return"redirect:QnAlist";
		
	}

	@RequestMapping("QnAdelete.do")
	public String QnAdelete(@ModelAttribute QnA qna,
							  @RequestParam("page") String page,
							  Model model) {
		
		int result = qs.delete(qna.getQid()); 
		
		model.addAttribute("result", result);
		model.addAttribute("page", page);
		
		return"redirect:QnAlist";
	}

}

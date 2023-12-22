package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Review;
import com.example.demo.service.ReviewService;


@Controller
public class ReviewController {

	@Autowired
	public ReviewService service; 

	// 글작성 폼으로 이동 
	@RequestMapping("reviewWriteForm.do")
	public String reviewform() {

		return "review/reviewWriteForm";

	}

	// 글작성
	@RequestMapping("reviewWrite.do")
	public String reviewWrite(Review review, Model model) {

		
		
		int tmp = service.insert(review);

		if (tmp == 1) {
			model.addAttribute("insertResult", tmp);
			
		}
		
		
		return "review/reviewInsertResult";

	}

	@RequestMapping("reviewList.do")
	public String reviewList(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
	    int limit = 10; // 한 페이지에 출력할 데이터 개수

	    int startRow = (page - 1) * limit + 1; // 시작 row
	    int endRow = startRow + limit - 1; // 끝 row

	    int listcount = service.getCount(); // 전체 데이터 개수

	    int pageCount = (int) Math.ceil((double) listcount / limit); // 전체 페이지 개수

	    int startPage = ((page - 1) / 10) * 10 + 1; // 시작 페이지
	    int endPage = startPage + 9; // 끝 페이지 
	    if (endPage > pageCount) {
	        endPage = pageCount;
	    }

	    List<Review> resultList = new ArrayList<>();

	    Review review = new Review();
	    review.setStartRow(startRow);
	    review.setEndRow(endRow);

	    resultList = service.getList(review);

	    model.addAttribute("list", resultList);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);

	    return "review/reviewList";
	}


	// 리뷰게시판 상세페이지로 이동
	@RequestMapping("reviewDetail.do")
	public String reviewDetail() {

		return "review/reviewDetail";
	}

	// 수정폼으로 이동
	@RequestMapping("reviewUpdateForm.do")
	public String reviewUpdateForm() {

		return "review/reviewUpdateForm";

	}

	// 수정하기
	@RequestMapping("reviewUpdate.do")
	public String reviewUpdate() {

		return "review/reviewUpdateResult";

	}

	// 삭제하기 폼으로 이동
	@RequestMapping("reviewDeleteForm.do")
	public String reviewDeleteForm() {

		return "review/reviewDeleteForm";
	}

	// 삭제하기
	@RequestMapping("reviewDelete.do")
	public String reviewDelete() {

		return "review/reviewDelete";

	}

}

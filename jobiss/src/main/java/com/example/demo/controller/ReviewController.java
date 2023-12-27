package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.Member;
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
	@RequestMapping(value = "reviewWrite.do" , method = RequestMethod.POST)
	public String reviewWrite(@RequestParam("rsuccess1") MultipartFile mf, 
							   String page, Review review, HttpSession session, 
							   HttpServletRequest request, Model model) throws Exception {


		// session에서 "member"를 가져옴. 
		Member member = (Member)session.getAttribute("member");
		
		// 첨부파일명
		String filename = mf.getOriginalFilename();
		
		// 첨부파일 크기 
		int size = (int)mf.getSize();
		
		// 실제 파일 경로를 반환하는 메서드
		// 이 메서드는 서블릿 컨터이너가 웹 애플리케이션을 배포할 때 생성하는 디렉터리 구조를 기반으로 함.
		String path = request.getRealPath("upload");

		
		// 파일 중복 문제 해결 
		
		String file[] = new String[2];
		String newfilename = "";
		
		// 파일 이름에서 확장자를 추출하는 과정 
		String extension = filename.substring(filename.lastIndexOf("."));
		
		// 랜덤하게 생성되는 128비트의 수 
		UUID uuid = UUID.randomUUID();
		
		newfilename = uuid.toString() + extension;
		
		StringTokenizer st = new StringTokenizer(filename,".");
		
		file[0] = st.nextToken();	// 파일명
		file[1] = st.nextToken();	// 확장자

		int result = 0; 
		
		if(size > 10000000) {
			result = 1;
			
			model.addAttribute("result", result);
			
			return "review/sizeResult";
			
		}else if (!extension.equals(".jpg") && !extension.equals(".jpeg") && !extension.equals(".gif")
				&& !extension.equals(".png")) {
			result = 2;
			
			model.addAttribute("result", result);
			return "review/reviewWriteForm";
		}
		
		
		
		// 첨부파일이 전송된 경우
		if(size > 0) {
			// transferTo()메서드를 사용하여 업로드된 파일을 서버의 지정된 경로에 저장
			mf.transferTo(new File(path + "/" + newfilename));
		}
				
		
		review.setRsuccess(newfilename);
		review.setMemail(member.getMemail());
		
		int tmp = service.insert(review);

		if (tmp == 1) {

			model.addAttribute("insertResult", tmp);
			model.addAttribute("page", page);
			
		}
		
		
		return "review/reviewInsertResult";

	}

	@RequestMapping("reviewList.do")
	public String reviewList(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
	    int limit = 10; // 한 페이지에 출력할 데이터 개수
	    

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
	    

	    return "review/reviewList";
	}


	// 리뷰게시판 상세페이지로 이동
	@RequestMapping("reviewDetails.do")
	public String reviewDetails(int rid, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		Review review = service.getBoard(rid);
		
		String content = review.getRcontent().replace("\n", "<br>");
		
		model.addAttribute("review",review);
		model.addAttribute("rid",rid);
		model.addAttribute("content",content);
		model.addAttribute("page",page);
		
		return "review/reviewDetails";
	}

	// 수정폼으로 이동
	@RequestMapping("reviewUpdateForm.do")
	public String reviewUpdateForm(int rid, @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		
		Review review = service.getBoard(rid);
		
		model.addAttribute("page",page);
		model.addAttribute("review",review);
		model.addAttribute("rid",rid);
		
		
		
		return "review/reviewUpdateForm";

	}

	// 수정하기
	@RequestMapping("reviewUpdate.do")
	public String reviewUpdate(Review review, int rid, @RequestParam(value = "page", defaultValue = "1") int page, HttpSession session, Model model) {

		int updateResult = 0;
		
		Review db = service.getBoard(review.getRid());
		
		Member member = (Member) session.getAttribute("member"); // session에서 member가져와서 member변수에 넣어줌 ~
		
		String id = member.getMemail(); // 멤버에 있는 이메일 가져옴 !

		String emailFromDB = db.getMemail(); // db에 있는 이메일 가져옴

		if(id.equals(emailFromDB)) {
		    updateResult = service.update(review);
		} else {
		    updateResult = -1;
		}

		
		model.addAttribute("page",page);
		model.addAttribute("updateResult",updateResult);
		model.addAttribute("review",review);
		
		
		return "review/reviewUpdateResult";

	}


	// 삭제하기
	@RequestMapping(value="reviewDelete.do" ,method=RequestMethod.POST)
	@ResponseBody
	public String reviewDelete(HttpSession session, int rid) {

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

package com.sumy.gamestore.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.sumy.gamestore.config.auth.PrincipalDetail;
import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.service.GameInfoService;
import com.sumy.gamestore.service.NewsListService;
import com.sumy.gamestore.service.ReviewListService;

@Controller
public class NewsController {
	

	@Autowired
	NewsListService newsListService;
	
	// 뉴스 리스트 페이지
	@GetMapping("/sumy/news/list")
	public String showReview(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, @RequestParam(value="principal", required=false)PrincipalDetail principal) {
		
		int total = newsListService.뉴스총개수(vo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		String keywordOpt = vo.getKeywordOpt();
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), vo.getKeyword());
		vo.setKeywordOpt(keywordOpt);
		
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", newsListService.한페이지뉴스리스트(vo));
		
		//model.addAttribute("gameInfo", gameInfoService.게임검색(gameId));
		//model.addAttribute("reviewList", reviewListService.리뷰검색_게임아이디(gameId, vo));
		
//			if(principal != null) {
//				// 로그인한 아이디로 리뷰조회 갯수 -> 0이면 리뷰 작성 가능!
//				model.addAttribute("userReviewCnt", reviewListService.유저아이디개수_이메일(principal.getUsername(), gameId));
//			}
		return "user/page-news-list";
	}
	
	// 뉴스 상세보기 페이지
	@GetMapping("/sumy/news/{newsId}")
	public String showSingleProduct(@PathVariable int newsId, Model model) {
		
		model.addAttribute("news", newsListService.뉴스검색(newsId));
		
		System.out.println(newsListService.뉴스검색(newsId));
		
		return "user/page-news-detail";
	}
	
	
	
}


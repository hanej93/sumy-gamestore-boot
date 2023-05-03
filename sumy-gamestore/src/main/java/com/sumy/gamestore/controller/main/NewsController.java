package com.sumy.gamestore.controller.main;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.sumy.gamestore.config.auth.PrincipalDetail;
import com.sumy.gamestore.vo.PagingVO;
import com.sumy.gamestore.service.NewsListService;

@RequiredArgsConstructor
@Controller
public class NewsController {
	
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
		
		return "user/page-news-list";
	}
	
	// 뉴스 상세보기 페이지
	@GetMapping("/sumy/news/{newsId}")
	public String showSingleProduct(@PathVariable int newsId, Model model) {
		
		model.addAttribute("news", newsListService.뉴스검색(newsId));

		return "user/page-news-detail";
	}
	
	
	
}


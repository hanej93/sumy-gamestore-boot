package com.sumy.gamestore.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.service.NewsListService;

@Controller
@RequestMapping("/admin")
public class NewsListController {
	
	@Autowired
	NewsListService newsListService;
	
	@GetMapping("/news/list")
	public String showNews(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = newsListService.뉴스총개수(vo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), vo.getKeyword());
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", newsListService.한페이지뉴스리스트(vo));
		
		return "admin/news_list";
	}

	@GetMapping("/news/add")
	public String addNews() {
		
		return "admin/news_add";
	}
	
	@GetMapping("/news/update/{newsId}")
	public String updateNews(@PathVariable int newsId, Model model) {
		
		model.addAttribute("newsList", newsListService.뉴스검색(newsId));
		
		return "admin/news_update";
	}
	
}

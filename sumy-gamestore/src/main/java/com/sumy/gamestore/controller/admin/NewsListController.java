package com.sumy.gamestore.controller.admin;

import com.sumy.gamestore.service.NewsListService;
import com.sumy.gamestore.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class NewsListController {
	
	private final NewsListService newsListService;
	
	@GetMapping("/news/list")
	public String showNews(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = newsListService.getCountForPaging(vo);
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
		model.addAttribute("viewAll", newsListService.findList(vo));
		
		return "admin/news_list";
	}

	@GetMapping("/news/add")
	public String addNews() {
		return "admin/news_add";
	}
	
	@GetMapping("/news/update/{newsId}")
	public String updateNews(@PathVariable int newsId, Model model) {
		model.addAttribute("newsList", newsListService.findById(newsId));
		
		return "admin/news_update";
	}
	
}

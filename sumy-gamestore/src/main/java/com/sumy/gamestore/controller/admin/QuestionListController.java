package com.sumy.gamestore.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.service.QuestionListService;

@Controller
@RequestMapping("/admin")
public class QuestionListController {
	
	@Autowired
	QuestionListService questionListService;
	
	@GetMapping("/question/list")
	public String showQuestion(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = questionListService.문의총개수(vo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), vo.getKeyword(), vo.getAnswerYn(), vo.getReaderYn());
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", questionListService.한페이지문의리스트(vo));
		
		return "admin/question_list";
	}
	
//	@GetMapping("/news/update")
//	public String updateNews() {
//		
//		return "admin/news_update";
//	}
	
}

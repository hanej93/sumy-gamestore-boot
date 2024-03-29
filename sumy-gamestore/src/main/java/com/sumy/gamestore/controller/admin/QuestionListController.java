package com.sumy.gamestore.controller.admin;

import com.sumy.gamestore.service.QuestionListService;
import com.sumy.gamestore.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class QuestionListController {

	private final QuestionListService questionListService;
	
	@GetMapping("/question/list")
	public String showQuestion(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = questionListService.getTotalCount(vo);
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
		model.addAttribute("viewAll", questionListService.findList(vo));
		
		return "admin/question_list";
	}

}

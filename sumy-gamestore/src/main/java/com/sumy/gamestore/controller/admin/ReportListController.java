package com.sumy.gamestore.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.service.ReportListService;

@Controller
@RequestMapping("/admin")
public class ReportListController {
	
	@Autowired
	ReportListService reportListService;
	
	@GetMapping("/report/list")
	public String showReport(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = reportListService.신고총개수(vo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		String reportReadYn = vo.getReportReadYn();
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), vo.getKeyword());
		vo.setReportReadYn(reportReadYn);
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", reportListService.한페이지신고리스트(vo));
		
		return "admin/report_list";
	}
	
//	@GetMapping("/news/update")
//	public String updateNews() {
//		
//		return "admin/news_update";
//	}
	
}

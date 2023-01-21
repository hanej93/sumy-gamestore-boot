package com.sumy.gamestore.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.service.ReportListService;
import com.sumy.gamestore.service.UserInfoService;

@Controller
@RequestMapping("/admin")
public class UserInfoController {
	
	@Autowired
	private UserInfoService userInfoService;
	
	@GetMapping("/user/list")
	public String showUser(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = userInfoService.유저총개수(vo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), vo.getKeyword(), vo.getBlacklistYn());
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", userInfoService.한페이지유저리스트(vo));
		
		return "admin/user_list";
	}
	
//	@GetMapping("/news/update")
//	public String updateNews() {
//		
//		return "admin/news_update";
//	}
	
}

package com.sumy.gamestore.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sumy.gamestore.vo.CataloguePagingAndFilterVO;
import com.sumy.gamestore.service.CatalogueService;

@Controller
public class CatalogueController {
	
	@Autowired
	CatalogueService gameInfoService;
	
	@GetMapping("/catalogue")
	public String showGame(CataloguePagingAndFilterVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = gameInfoService.게임총개수(vo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "9";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "9";
		}
		
		vo = new CataloguePagingAndFilterVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), vo.getKeyword(),
				vo.getOrderOpt(), vo.getLowPriceFilter(), vo.getHighPriceFilter(), vo.getStarFilter(), 
				vo.getDiscountFilter() ,vo.getCategoryListFilter());
		
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", gameInfoService.한페이지게임리스트(vo));
		
		//필터관련
		model.addAttribute("countGameListAll", gameInfoService.전체상품개수조회());
		model.addAttribute("countGameListDiscount", gameInfoService.할인상품개수조회());
		model.addAttribute("categoryListGroupById", gameInfoService.카테고리별개수조회());
		
		return "user/catalogue-page";
	}
}

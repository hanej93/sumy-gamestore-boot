package com.sumy.gamestore.controller.main;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sumy.gamestore.vo.CataloguePagingAndFilterVO;
import com.sumy.gamestore.service.CatalogueService;

@RequiredArgsConstructor
@Controller
public class CatalogueController {
	
	private final CatalogueService catalogueService;
	
	@GetMapping("/catalogue")
	public String showGame(CataloguePagingAndFilterVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = catalogueService.getCountForPaging(vo);
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
		model.addAttribute("viewAll", catalogueService.findList(vo));
		
		//필터관련
		model.addAttribute("countGameListAll", catalogueService.getTotalGameListCount());
		model.addAttribute("countGameListDiscount", catalogueService.getDiscountGameListCount());
		model.addAttribute("categoryListGroupById", catalogueService.findCategoryListWithCount());
		
		return "user/catalogue-page";
	}
}

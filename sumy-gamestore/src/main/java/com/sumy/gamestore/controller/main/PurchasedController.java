package com.sumy.gamestore.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sumy.gamestore.config.auth.PrincipalDetail;
import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.service.PurchasedService;

@Controller
public class PurchasedController {
	
	@Autowired
	PurchasedService purchasedService;
	
	
	@GetMapping("/user/purchased")
	public String showMygame(PagingVO vo, Model model, Authentication authentication
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		if(authentication != null) {
			PrincipalDetail principal = (PrincipalDetail) authentication.getPrincipal();
			int userId = principal.getUser().getUserId();
			String orderOpt = vo.getOrderOpt();
			
			vo.setLoginUserId(userId);
			
			
			int total = purchasedService.구매한게임총개수(vo);
			model.addAttribute("purchasedGameCount", total);
			
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), vo.getKeyword());
			vo.setLoginUserId(userId);
			vo.setOrderOpt(orderOpt);
			model.addAttribute("paging", vo);
			model.addAttribute("viewAll", purchasedService.한페이지구매한게임리스트(vo));
			
			
				// 로그인한 유저아이디로 조회!!
		}
		
		return "user/page-purchased-1";
	}
	

}

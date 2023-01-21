package com.sumy.gamestore.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sumy.gamestore.config.auth.PrincipalDetail;
import com.sumy.gamestore.service.WishListService;

@Controller
public class WishlistController {
	
	@Autowired
	WishListService wishListService;
	
	
	@GetMapping("/user/wishlist")
	public String showReview(Model model, Authentication authentication) {
		
		if(authentication != null) {
			PrincipalDetail principal = (PrincipalDetail) authentication.getPrincipal();
			int userId = principal.getUser().getUserId();
			// 로그인한 유저아이디로 조회!!
			model.addAttribute("viewAll", wishListService.selectWishListByUserId(userId));
			System.out.println(wishListService.selectWishListByUserId(userId));
		}
		
		return "user/page-wishlist-1";
	}
	

}

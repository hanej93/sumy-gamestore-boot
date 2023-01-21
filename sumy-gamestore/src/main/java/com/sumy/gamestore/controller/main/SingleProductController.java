package com.sumy.gamestore.controller.main;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.sumy.gamestore.config.auth.PrincipalDetail;
import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.model.GameInfo;
import com.sumy.gamestore.model.WishlistGame;
import com.sumy.gamestore.service.GameInfoService;
import com.sumy.gamestore.service.PurchasedService;
import com.sumy.gamestore.service.ReviewListService;
import com.sumy.gamestore.service.WishListService;

@Controller
public class SingleProductController {
	
	
	@Autowired
	GameInfoService gameInfoService;
	
	@Autowired
	ReviewListService reviewListService;
	
	@Autowired
	WishListService wishListService;
	
	@Autowired
	PurchasedService purchasedService;
	
	
	@GetMapping("/sumy/single-product/{gameId}")
	public String showSingleProduct(@PathVariable int gameId, Model model, Authentication authentication) {
		
		if(authentication != null) {
			PrincipalDetail principal = (PrincipalDetail) authentication.getPrincipal();
			int userId = principal.getUser().getUserId();
			
			int exists =  wishListService.위시리스트유무(userId, gameId);
			
			int purchased = purchasedService.구매한게임유무(userId, gameId);
			
			model.addAttribute("purchasedGame", purchased);
			
			if(exists > 0 ) {
				model.addAttribute("existsWishlist", exists);
			} else {
				model.addAttribute("existsWishlist", null);
			}
		}
		
		// 관련게임 조회
		GameInfo inputGameInfo = gameInfoService.게임검색(gameId);
		
		model.addAttribute("gameInfo", inputGameInfo);
		model.addAttribute("reviewList", reviewListService.리뷰검색_게임아이디_5(gameId));
		model.addAttribute("gameCategoryList", gameInfoService.카테고리이름검색(gameId));
		model.addAttribute("relatedGameList", gameInfoService.관련게임검색(inputGameInfo.getGameCategoryId1()));
		
		
		System.out.println(gameInfoService.게임검색(gameId));
		System.out.println(reviewListService.리뷰검색_게임아이디_5(gameId));
		
		return "user/page-single-product-1";
	}
	
	
	@GetMapping("/sumy/single-product/{gameId}/review")
	public String showReview(@PathVariable int gameId, PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, Authentication authentication
	/* , @AuthenticationPrincipal PrincipalDetail principal */) {
		
		int total = reviewListService.리뷰총개수_게임아이디(gameId, vo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("gameInfo", gameInfoService.게임검색(gameId));
		model.addAttribute("reviewList", reviewListService.리뷰검색_게임아이디(gameId, vo));
		
		System.out.println(gameId);
		if(authentication != null) {
			PrincipalDetail principal = (PrincipalDetail) authentication.getPrincipal();
			int userId = principal.getUser().getUserId();
			int exists =  wishListService.위시리스트유무(userId, gameId);
			int purchased = purchasedService.구매한게임유무(userId, gameId);
			
			model.addAttribute("purchasedGame", purchased);
						
			if(exists > 0 ) {
				model.addAttribute("existsWishlist", exists);
			} else {
				model.addAttribute("existsWishlist", null);
			}
			
			System.out.println("쿼리문 결과: " + reviewListService.유저아이디개수_이메일(principal.getUser().getUserId(), gameId));
			// 로그인한 아이디로 리뷰조회 갯수 -> 0이면 리뷰 작성 가능!
			model.addAttribute("userReviewCnt", reviewListService.유저아이디개수_이메일(principal.getUser().getUserId(), gameId));
		}
		return "user/reviewMore-page";
	}
}


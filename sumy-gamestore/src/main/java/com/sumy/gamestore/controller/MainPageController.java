package com.sumy.gamestore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sumy.gamestore.model.GameInfo;
import com.sumy.gamestore.model.NewsList;
import com.sumy.gamestore.service.ShowGameService;
import com.sumy.gamestore.service.ShowNewsService;

@Controller
public class MainPageController {
	
	@Autowired
	ShowGameService showGameService;
	
	@Autowired
	ShowNewsService showNewsService;
	
	//메인 페이지
	@GetMapping(value = {"/home-page", "/", ""})
	public String test1(Model model) {
		//뉴스
		List<NewsList> newsList = showNewsService.selectNewsAll();
		model.addAttribute("newsList", newsList);
		
		//게임 리스트
		List<GameInfo> AllUsersGameList = showGameService.selectAllUsersGame();
		model.addAttribute("AllUsersGameList", AllUsersGameList);
		
		List<GameInfo> DiscountGameList = showGameService.selectDiscountGame();
		model.addAttribute("DiscountGameList", DiscountGameList);
		
		List<GameInfo> FreeGameList = showGameService.selectFreeGame();
		model.addAttribute("FreeGameList", FreeGameList);
		
		List<GameInfo> HottestGameList = showGameService.selectHottestGame();
		model.addAttribute("HottestGameList", HottestGameList);
		
		List<GameInfo> MostReviewGameList = showGameService.selectMostReviewGame();
		model.addAttribute("MostReviewGameList", MostReviewGameList);
		
		List<GameInfo> NewGameList = showGameService.selectNewGame();
		model.addAttribute("NewGameList", NewGameList);
		
		List<GameInfo> RecentUpdateGameList = showGameService.selectRecentUpdateGame(); 
		model.addAttribute("RecentUpdateGameList", RecentUpdateGameList);
	 	
		List<GameInfo> RecommendGameList = showGameService.selectRecommendGame();
		model.addAttribute("RecommendGameList", RecommendGameList);
		
		
		
		
		
	     return "user/home-page-1";
//		return "index";
	}
	

}

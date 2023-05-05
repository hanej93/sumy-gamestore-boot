package com.sumy.gamestore.controller.admin;

import com.sumy.gamestore.service.GameInfoService;
import com.sumy.gamestore.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class GameListController {
	
	private final GameInfoService gameInfoService;

	@GetMapping("/game/list")
	public String showGame(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = gameInfoService.getTotalCount(vo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), vo.getKeyword());
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", gameInfoService.findList(vo));
		
		return "admin/game_list";
	}
	
	@GetMapping("/game/add")
	public String addGame(Model model) {
		
		model.addAttribute("categoryList", gameInfoService.findAllCategoriesWithCount());
		
		return "admin/game_add";
	}
	
	@GetMapping("/game/update/{gameId}")
	public String updateGame(@PathVariable int gameId, Model model) {
		
		model.addAttribute("categoryList", gameInfoService.findAllCategoriesWithCount());
		model.addAttribute("gameInfo", gameInfoService.findById(gameId));
		
		return "admin/game_update";
	}
	
	
}

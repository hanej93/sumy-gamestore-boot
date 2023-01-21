package com.sumy.gamestore.controller.main.api;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sumy.gamestore.config.auth.PrincipalDetail;
import com.sumy.gamestore.dto.ResponseDto;
import com.sumy.gamestore.dto.WishlistGameInfoDto;
import com.sumy.gamestore.model.ReviewList;
import com.sumy.gamestore.model.WishlistGame;
import com.sumy.gamestore.service.WishListService;

@RestController
public class WishlistApiController {
	
	@Autowired
	WishListService wishListService;
	
	@PostMapping("/user/wishlist")
	public int insertWishlist(@RequestBody int gameId, Authentication authentication){
		
		if(authentication != null) {
			PrincipalDetail principal = (PrincipalDetail) authentication.getPrincipal();
			int userId = principal.getUser().getUserId();
			
			int exists =  wishListService.위시리스트유무(userId, gameId);
			
			if(exists > 0 ) {
				wishListService.위시리스트삭제(userId,gameId);
			} else {
				// 없으면 추가
				WishlistGame inputWishlist = WishlistGame.builder()
														 .wishlistId(0)
														 .gameId(gameId)
														 .userId(userId)
														 .wishlistWriteDate(LocalDateTime.now())
														 .build();
				wishListService.위시리스트추가(inputWishlist);
			}
			return 1;
		}
		
		return 0;
		
		
		
		
	}
	
	@DeleteMapping("/user/wishlist")
	public ResponseDto<Integer> deleteWishlist(@RequestBody WishlistGame wishlistGame){
		
		wishListService.위시리스트삭제_위시리스트아이디(wishlistGame.getWishlistId());
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	
}

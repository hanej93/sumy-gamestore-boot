package com.sumy.gamestore.controller.user.api;

import java.time.LocalDateTime;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sumy.gamestore.config.auth.PrincipalDetail;
import com.sumy.gamestore.dto.ResponseDto;
import com.sumy.gamestore.model.WishlistGame;
import com.sumy.gamestore.service.WishListService;

@RequiredArgsConstructor
@RestController
public class WishlistApiController {

	private final WishListService wishListService;
	
	@PostMapping("/user/wishlist")
	public int insertWishlist(@RequestBody int gameId, Authentication authentication){
		
		if(authentication != null) {
			PrincipalDetail principal = (PrincipalDetail) authentication.getPrincipal();
			int userId = principal.getUser().getUserId();
			
			int exists =  wishListService.getCountByUserIdAndGameId(userId, gameId);
			
			if(exists > 0 ) {
				wishListService.deleteByUserIdAndGameId(userId,gameId);
			} else {
				// 없으면 추가
				WishlistGame inputWishlist = WishlistGame.builder()
														 .wishlistId(0)
														 .gameId(gameId)
														 .userId(userId)
														 .wishlistWriteDate(LocalDateTime.now())
														 .build();
				wishListService.svae(inputWishlist);
			}
			return 1;
		}
		
		return 0;
		
		
		
		
	}
	
	@DeleteMapping("/user/wishlist")
	public ResponseDto<Integer> deleteWishlist(@RequestBody WishlistGame wishlistGame){
		
		wishListService.deleteById(wishlistGame.getWishlistId());
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	
}

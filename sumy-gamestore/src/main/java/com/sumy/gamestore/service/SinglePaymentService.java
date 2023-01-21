package com.sumy.gamestore.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sumy.gamestore.config.auth.PrincipalDetail;
import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.dto.WishlistGameInfoDto;
import com.sumy.gamestore.mapper.GameInfoMapper;
import com.sumy.gamestore.mapper.PaymentMapper;
import com.sumy.gamestore.mapper.PurchasedMapper;
import com.sumy.gamestore.model.GameInfo;
import com.sumy.gamestore.model.PurchasedGameList;
import com.sumy.gamestore.model.WishlistGame;

@Service
public class SinglePaymentService {

	@Autowired
	private PaymentMapper paymentMapper;
	
	@Autowired
	WishListService wishListService;
	
	@Autowired
	GameInfoService gameInfoService;
	
	@Autowired
	PurchasedMapper purchasedMapper;
	
	@Transactional 
	public int insertPurchasedGame(Authentication authentication, int gameId) {
		PrincipalDetail principal = (PrincipalDetail)authentication.getPrincipal();
		int userId = principal.getUser().getUserId();
		System.out.println("service에 전달된 유저아이디 : "+userId);
		System.out.println("service에 전달된 게임아이디 : "+gameId);
		
		int row=0;
		
		List<WishlistGameInfoDto> userWishList = wishListService.selectWishListByUserId(userId);//위시리스트에서 유저아이디 가져오기.
		List<GameInfo> gameInfoList = new ArrayList<GameInfo>();
		GameInfo gameInfo = gameInfoService.게임검색(gameId);
		System.out.println(gameInfo);
		if(userWishList.size()>0) {//만약 wishlist에 해당게임이 있다면
			deleteWish(new WishlistGame(userWishList.get(0).getWishlistId(), userWishList.get(0).getGameId(), userWishList.get(0).getUserId(),
					userWishList.get(0).getWishlistWriteDate()));
		}
		//wishlist에 있거나 없다면
		System.out.println("PaymentService : 상세내역에서 결제함."+userWishList);
		paymentMapper.insertPurchasedGame(new PurchasedGameList(0,gameId,userId,LocalDateTime.now()));
		updateGameSaleCountAndGameTotalEarnings(gameInfo);//게임 총 판매수량, 총 판매 금액 추가
		return row;
	}
	@Transactional
	public void updateGameSaleCountAndGameTotalEarnings(GameInfo gameInfo) {
		gameInfo.setGameSaleCount(gameInfo.getGameSaleCount()+1);
		gameInfo.setGameTotalEarnings(gameInfo.getGameTotalEarnings()+(gameInfo.getGamePrice()*(100-gameInfo.getGameDiscountRate()) / 100));
		paymentMapper.updateGameSaleCountAndGameTotalEarnings(gameInfo);
	}
	@Transactional
	public int deleteWish(WishlistGame wishlistGame) {
		int row = paymentMapper.deleteWish(wishlistGame);
		return row;
	}
	
	public boolean selectPurchasedGameYN(Authentication authentication, int gameId) {
		PrincipalDetail principal = (PrincipalDetail)authentication.getPrincipal();
		int userId = principal.getUser().getUserId();
		int purchasedCnt = purchasedMapper.countPurchasedGameListByIds(userId, gameId);
		if(purchasedCnt>0) {
			System.out.println("서비스 : 유저가 이미 게임을 구매함");
			return false;
		}
		return true;
	}
}

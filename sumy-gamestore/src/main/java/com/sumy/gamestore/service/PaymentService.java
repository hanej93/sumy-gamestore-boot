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
public class PaymentService {

	@Autowired
	private PaymentMapper paymentMapper;

	@Autowired
	WishListService wishListService;

	@Autowired
	GameInfoService gameInfoService;

	@Autowired
	PurchasedMapper purchasedMapper;

	@Transactional
	public int insertPurchasedGame(Authentication authentication) {
		PrincipalDetail principal = (PrincipalDetail) authentication.getPrincipal();
		int userId = principal.getUser().getUserId();
		System.out.println("service에 전달된 유저아이디 : " + userId);

		int row = 0;

		List<WishlistGameInfoDto> userWishList = wishListService.selectWishListByUserId(userId);// 위시리스트에서 유저아이디 가져오기.
		List<GameInfo> gameInfoList = new ArrayList<GameInfo>();
		for (WishlistGameInfoDto userWish : userWishList) {
			row += paymentMapper
					.insertPurchasedGame(new PurchasedGameList(0, userWish.getGameId(), userId, LocalDateTime.now()));
			GameInfo gameInfo = gameInfoService.게임검색(userWish.getGameId());// userWish 객체만큼 게임 데이터 가져오기.
			gameInfoList.add(gameInfo);
			deleteWish(new WishlistGame(userWish.getWishlistId(), userWish.getGameId(), userWish.getUserId(),
					userWish.getWishlistWriteDate()));
		}
		updateGameSaleCountAndGameTotalEarnings(gameInfoList);// 게임 총 판매수량, 총 판매 금액 추가
		System.out.println("purchased_game_list에 구매한 게임 추가된 줄의 수 : " + row);
		return row;
	}

	@Transactional
	public void updateGameSaleCountAndGameTotalEarnings(List<GameInfo> gameInfoList) {
		for (GameInfo gameInfo : gameInfoList) {
			System.out.println(gameInfo.getGameId() + " 게임 판매 수 : " + gameInfo.getGameSaleCount());
			System.out.println(gameInfo.getGameId() + " 게임 판매 금액 : " + gameInfo.getGameTotalEarnings());
			System.out.println("============================================");

			System.out.println(gameInfo.getGameId() + "증가시키기 전 게임 판매 횟수 : " + gameInfo.getGameSaleCount());
			gameInfo.setGameSaleCount(gameInfo.getGameSaleCount() + 1);
			System.out.println(gameInfo.getGameId() + "증가시킨 후 게임 판매 횟수 : " + gameInfo.getGameSaleCount());
			System.out.println("============================================");

			System.out.println(gameInfo.getGameId() + "누적시키기 전 판매 금액 : " + gameInfo.getGameTotalEarnings());
			gameInfo.setGameTotalEarnings(gameInfo.getGameTotalEarnings()
					+ (gameInfo.getGamePrice() * (100 - gameInfo.getGameDiscountRate()) / 100));
			System.out.println(gameInfo.getGameId() + "누적시킨 후 게임 판매 횟수 : " + (gameInfo.getGameTotalEarnings()));
			System.out.println("============================================");

			paymentMapper.updateGameSaleCountAndGameTotalEarnings(gameInfo);
		}
	}

	@Transactional
	public int deleteWish(WishlistGame wishlistGame) {
		int row = paymentMapper.deleteWish(wishlistGame);
		return row;
	}
}

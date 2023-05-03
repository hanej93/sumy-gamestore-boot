package com.sumy.gamestore.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sumy.gamestore.config.auth.PrincipalDetail;
import com.sumy.gamestore.dto.WishlistGameInfoDto;
import com.sumy.gamestore.mapper.PaymentMapper;
import com.sumy.gamestore.mapper.PurchasedMapper;
import com.sumy.gamestore.model.GameInfo;
import com.sumy.gamestore.model.PurchasedGameList;
import com.sumy.gamestore.model.WishlistGame;

@RequiredArgsConstructor
@Service
public class PaymentService {

	private final PaymentMapper paymentMapper;
	private final WishListService wishListService;
	private final GameInfoService gameInfoService;
	private final PurchasedMapper purchasedMapper;

	@Transactional
	public int insertPurchasedGame(Authentication authentication) {
		PrincipalDetail principal = (PrincipalDetail) authentication.getPrincipal();
		int userId = principal.getUser().getUserId();
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
		return row;
	}

	@Transactional
	public void updateGameSaleCountAndGameTotalEarnings(List<GameInfo> gameInfoList) {
		for (GameInfo gameInfo : gameInfoList) {
			gameInfo.setGameSaleCount(gameInfo.getGameSaleCount() + 1);
			gameInfo.setGameTotalEarnings(gameInfo.getGameTotalEarnings()
					+ (gameInfo.getGamePrice() * (100 - gameInfo.getGameDiscountRate()) / 100));

			paymentMapper.updateGameSaleCountAndGameTotalEarnings(gameInfo);
		}
	}

	@Transactional
	public int deleteWish(WishlistGame wishlistGame) {
		int row = paymentMapper.deleteWish(wishlistGame);
		return row;
	}
}

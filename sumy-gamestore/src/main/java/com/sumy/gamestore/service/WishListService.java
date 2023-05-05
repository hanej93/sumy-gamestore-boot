package com.sumy.gamestore.service;

import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.sumy.gamestore.dto.WishlistGameInfoDto;
import com.sumy.gamestore.mapper.WishlistMapper;
import com.sumy.gamestore.model.WishlistGame;

@RequiredArgsConstructor
@Service
public class WishListService {

	private final WishlistMapper wishlistMapper;
	
	public List<WishlistGameInfoDto> selectWishListByUserId(int userId) {
		return wishlistMapper.selectWishList(userId);
		
	}
	
	public int svae(WishlistGame wishlistGame) {
		return wishlistMapper.insertWishlist(wishlistGame);
	}
	
	public int getCountByUserIdAndGameId(int userId, int gameId) {
		return wishlistMapper.countWishlistByIds(userId, gameId);
	}
	
	public int deleteByUserIdAndGameId(int userId, int gameId) {
		return wishlistMapper.deleteWishlistByIds(userId, gameId);
	}
	
	public int deleteById(int wishlistId) {
		return wishlistMapper.deletewishListbyId(wishlistId);
	}
	
}

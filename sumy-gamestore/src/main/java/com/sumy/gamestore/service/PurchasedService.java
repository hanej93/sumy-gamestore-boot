package com.sumy.gamestore.service;

import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.sumy.gamestore.vo.PagingVO;
import com.sumy.gamestore.dto.PurchasedGameInfoDto;
import com.sumy.gamestore.mapper.PurchasedMapper;
import com.sumy.gamestore.model.PurchasedGameList;

@RequiredArgsConstructor
@Service
public class PurchasedService {

	private final PurchasedMapper purchasedMapper;
	
	public List<PurchasedGameInfoDto> selectPurchasedGameByUserId(int userId) {
		return purchasedMapper.selectPurchasedGameListByUserId(userId);
	}
	
	public int getCountForPaging(PagingVO vo) {
		return purchasedMapper.countPurchasedGameList(vo);
	}
	
	// 한 페이지 구매한게임 리스트 조회
	public List<PurchasedGameInfoDto> findList(PagingVO vo){
		return purchasedMapper.selectPurchasedGameList(vo);
	}
	
	public int update(PurchasedGameList purchasedGameList) {
		return purchasedMapper.insertPurchasedGameList(purchasedGameList);
	}
	
	public int isPurchased(int userId, int gameId) {
		return purchasedMapper.countPurchasedGameListByIds(userId, gameId);
	}
	
	public int delete(int userId, int gameId) {
		return purchasedMapper.deletePurchasedGameListByIds(userId, gameId);
	}
	
}

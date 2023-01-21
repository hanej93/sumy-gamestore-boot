package com.sumy.gamestore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.dto.PurchasedGameInfoDto;
import com.sumy.gamestore.mapper.PurchasedMapper;
import com.sumy.gamestore.model.PurchasedGameList;

@Service
public class PurchasedService {

	@Autowired
	private PurchasedMapper purchasedMapper;
	
	public List<PurchasedGameInfoDto> selectPurchasedGameByUserId(int userId) {
		return purchasedMapper.selectPurchasedGameListByUserId(userId);
		
	}
	
	public int 구매한게임총개수(PagingVO vo) {
		return purchasedMapper.countPurchasedGameList(vo);
	}
	
	// 한 페이지 구매한게임 리스트 조회
	public List<PurchasedGameList> 한페이지구매한게임리스트(PagingVO vo){
		return purchasedMapper.selectPurchasedGameList(vo);
	}
	
	public int 구매한게임추가(PurchasedGameList purchasedGameList) {
		return purchasedMapper.insertPurchasedGameList(purchasedGameList);
	}
	
	public int 구매한게임유무(int userId, int gameId) {
		return purchasedMapper.countPurchasedGameListByIds(userId, gameId);
	}
	
	public int 구매한게임삭제(int userId, int gameId) {
		return purchasedMapper.deletePurchasedGameListByIds(userId, gameId);
	}
	
}

package com.sumy.gamestore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.mapper.OrdersMapper;
import com.sumy.gamestore.model.PurchasedGameList;

@Service
public class OrdersService {

	@Autowired
	private OrdersMapper ordersMapper;
	
	public List<PurchasedGameList> selectPurchasedGameList(PagingVO vo, PurchasedGameList purchasedGameList) {
		System.out.println(purchasedGameList);
		return ordersMapper.selectPurchasedGameList(vo);
		
	}
	
}

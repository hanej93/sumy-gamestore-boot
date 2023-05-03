package com.sumy.gamestore.service;

import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumy.gamestore.vo.PagingVO;
import com.sumy.gamestore.mapper.OrdersMapper;
import com.sumy.gamestore.model.PurchasedGameList;

@RequiredArgsConstructor
@Service
public class OrdersService {

	private final OrdersMapper ordersMapper;
	
	public List<PurchasedGameList> selectPurchasedGameList(PagingVO vo, PurchasedGameList purchasedGameList) {
		return ordersMapper.selectPurchasedGameList(vo);
	}
	
}

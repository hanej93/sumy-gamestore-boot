package com.sumy.gamestore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.model.PurchasedGameList;

@Mapper
public interface OrdersMapper {

	// ================================================

	@Select("select count(*) from purchased_game_list")
	public int countPurchasedGameList(PagingVO vo);

	@Select("select * from purchased_game_list order by purchased_game_id desc limit #{start}, #{cntPage}")
	public List<PurchasedGameList> selectPurchasedGameList(PagingVO vo);

}

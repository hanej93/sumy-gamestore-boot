package com.sumy.gamestore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sumy.gamestore.vo.PagingVO;
import com.sumy.gamestore.dto.PurchasedGameInfoDto;
import com.sumy.gamestore.model.PurchasedGameList;

@Mapper
public interface PurchasedMapper {

	public List<PurchasedGameInfoDto> selectPurchasedGameListByUserId(int userId);

	public int insertPurchasedGameList(PurchasedGameList purchasedGameList);
	
	public int countPurchasedGameListByIds(@Param(value = "userId") int userId,@Param(value = "gameId") int gameId);
	
	public int deletePurchasedGameListByIds(@Param(value = "userId") int userId,@Param(value = "gameId") int gameId);

	// ================================================
	
	public int countPurchasedGameList(PagingVO vo);

	public List<PurchasedGameInfoDto> selectPurchasedGameList(PagingVO vo);

	
}

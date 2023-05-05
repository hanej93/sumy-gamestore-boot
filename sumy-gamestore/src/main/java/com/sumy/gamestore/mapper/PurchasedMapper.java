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

	@Select("select * from purchased_game_list as p "
			+ "join game_info as g "
			+ "on p.game_id = g.game_id where user_id = #{userId} order by purchased_game_id desc ")
	public List<PurchasedGameInfoDto> selectPurchasedGameListByUserId(int userId);

	@Insert("insert into purchased_game_list values(#{purchasedGameId}, #{gameId}, #{userId}, #{purchasedWriteDate})")
	public int insertPurchasedGameList(PurchasedGameList purchasedGameList);
	
	@Select("select count(*) from purchased_game_list where user_id=#{userId} and game_id=#{gameId}")
	public int countPurchasedGameListByIds(@Param(value = "userId") int userId,@Param(value = "gameId") int gameId);
	
	@Delete("delete from purchased_game_list where user_id=#{userId} and game_id=#{gameId}")
	public int deletePurchasedGameListByIds(@Param(value = "userId") int userId,@Param(value = "gameId") int gameId);

	// ================================================
	
	public int countPurchasedGameList(PagingVO vo);

	public List<PurchasedGameInfoDto> selectPurchasedGameList(PagingVO vo);

	
}

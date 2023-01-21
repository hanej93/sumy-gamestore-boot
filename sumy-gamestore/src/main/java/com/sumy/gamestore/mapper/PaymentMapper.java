package com.sumy.gamestore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.model.GameInfo;
import com.sumy.gamestore.model.NewsList;
import com.sumy.gamestore.model.PurchasedGameList;
import com.sumy.gamestore.model.UserInfo;
import com.sumy.gamestore.model.WishlistGame;

@Mapper
public interface PaymentMapper {
	// purchased_game_list 추가
	@Insert("insert into purchased_game_list values(#{purchasedGameId}, #{gameId}, #{userId}, #{purchasedWriteDate})")
	public int insertPurchasedGame(PurchasedGameList purchasedGameList);

	// game데이터 업데이트
	@Update("update game_info set game_sale_count = #{gameSaleCount}, game_total_earnings = #{gameTotalEarnings} where game_id = #{gameId}")
	public int updateGameSaleCountAndGameTotalEarnings(GameInfo gameInfo);

	// wishlist에서 삭제하기
	@Delete("delete from wishlist_game where wishlist_id = #{wishlistId} and game_id=#{gameId} and user_id=#{userId}")
	public int deleteWish(WishlistGame wishlistGame);

}

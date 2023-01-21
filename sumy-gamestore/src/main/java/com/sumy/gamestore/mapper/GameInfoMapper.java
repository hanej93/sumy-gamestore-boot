package com.sumy.gamestore.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sumy.gamestore.dto.CategoryCountDto;
import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.model.GameInfo;



@Mapper
public interface GameInfoMapper {
	
	@Insert("insert into game_info "
			+ "values(#{gameId}, #{gameTitle}, #{gameDev}, #{gamePrice}, #{gameDiscountRate}"
			+ ", #{gameSubText}, #{gameMainText}, #{gameRate}, #{gameThumbImage}"
			+ ", #{gameCategoryId1}, #{gameCategoryId2}, #{gameCategoryId3}, #{gameCategoryId4}"
			+ ", #{gameIntroImage1}, #{gameIntroImage2}, #{gameIntroImage3}, #{gameIntroImage4}, #{gameIntroImage5}"
			+ ", #{gameReleaseDate}, #{gameUpdateDate}, #{gameSaleCount}, #{gameTotalEarnings})")
	public int insertGame(GameInfo game);
	
	@Select("select * from game_info where game_id = #{gameId}")
	public GameInfo selectOneByGameId(int gameId);
	
	@Update("update game_info set game_title = #{gameTitle}, game_dev = #{gameDev}, game_price = #{gamePrice}, "
			+ "game_discount_rate = #{gameDiscountRate}, game_sub_text = #{gameSubText}, game_main_text = #{gameMainText}, "
			+ "game_rate = #{gameRate}, game_thumb_image = #{gameThumbImage}, game_category_id1 = #{gameCategoryId1}, "
			+ "game_category_id2 = #{gameCategoryId2}, game_category_id3 = #{gameCategoryId3}, "
			+ "game_category_id4 = #{gameCategoryId4}, game_intro_image1 = #{gameIntroImage1}, "
			+ "game_intro_image2 = #{gameIntroImage2}, game_intro_image3 = #{gameIntroImage3}, "
			+ "game_intro_image4 = #{gameIntroImage4}, game_intro_image5 = #{gameIntroImage5}, "
			+ "game_release_date = #{gameReleaseDate}, game_update_date = #{gameUpdateDate}, "
			+ "game_sale_count = #{gameSaleCount}, game_total_earnings = #{gameTotalEarnings} "
			+ "where game_id = #{gameId}")		
	public int updateGame(GameInfo game);
	
	//리뷰리스트를 게임 아이디로 조회해서 해당 리뷰아이디를 List<> 로 받아옴
	@Select("select review_id from review_list where game_id = #{gameId}")
	public List<Integer> reviewIdList(int gameId);
	
	@Delete("delete from report_list where review_id = #{reviewId}")
	public int deleteReportList(int reviewId);

	@Delete("delete from review_list where game_id = #{gameId}")
	public int deleteReview(int gameId);

	@Delete("delete from wishlist_game where game_id = #{gameId}")
	public int deleteWishListGame(int gameId);

	@Delete("delete from purchased_game_list where game_id = #{gameId}")
	public int deletePurchasedGameList(int gameId);
	
	@Delete("delete from game_Info where game_id = #{gameId}")
	public int deleteGame(int gameId);
	
	
	@Select("select category_name"
			+ " from category_list"
			+ " where"
			+ " category_id = (select game_category_id1 from game_info where game_id = #{gameId} )"
			+ " or category_id = (select game_category_id2 from game_info where game_id = #{gameId} )"
			+ " or category_id = (select game_category_id3 from game_info where game_id = #{gameId} )"
			+ " or category_id = (select game_category_id4 from game_info where game_id = #{gameId} )")
	public List<String> selectCategoryNameByCategoryId(int gameId);
	
	@Select("select * from game_info"
			+ " where game_category_id1 = #{categoryId}"
			+ " or game_category_id2 = #{categoryId}"
			+ " or game_category_id3 = #{categoryId}"
			+ " or game_category_id4 = #{categoryId}"
			+ " order by game_id desc"
			+ " limit 7;")
	public List<GameInfo> selectRelatedGameInfo(int categoryId);
	
	// 카테고리별 개수 조회
	@Select("select category_id, category_name, count(*) as category_count"
			+ " from game_info g"
			+ " join category_list c"
			+ " on g.game_category_id1 = c.category_id"
			+ " or g.game_category_id2 = c.category_id"
			+ " or g.game_category_id3 = c.category_id"
			+ " or g.game_category_id4 = c.category_id"
			+ " group by category_id order by category_name")
	public List<CategoryCountDto> countCategoryListGroupById();
	// ================================================
	
	//@Select("select count(*) from game_info")
	public int countGameList(PagingVO vo);

	//@Select("select * from game_info order by game_id desc limit #{start}, #{cntPage}")
	public List<GameInfo> selectGameList(PagingVO vo);

	
	
	
}

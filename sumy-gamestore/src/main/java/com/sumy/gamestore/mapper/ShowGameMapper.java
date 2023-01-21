package com.sumy.gamestore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sumy.gamestore.model.GameInfo;

@Mapper
public interface ShowGameMapper {  //메인 페이지
	
	//무료 게임
	@Select("select * from game_info where game_discount_rate = 100 order by game_id desc limit 7")
	public List<GameInfo> selectFreeGame();
	
	//할인 게임
	@Select("select * from game_info where game_discount_rate between 1 and 99 order by game_discount_rate desc limit 7")
	public List<GameInfo> selectDiscountGame();
	
	//신규 및 인기작
		//1.신규 출시
		@Select("select * from game_info order by game_id desc limit 3")
		public List<GameInfo> selectNewGame();
		
		//2.리뷰 많은 순
		@Select("select g.game_id, g.game_title, g.game_dev, g.game_price, g. game_thumb_image , g. game_discount_rate, count(*) as rv_cnt "
				+ "from review_list as r join game_info as g on r.game_id = g.game_id group by game_id order by rv_cnt desc limit 3")
		public List<GameInfo> selectMostReviewGame();
		
		//3.전체 이용가
		@Select("select * from game_info where game_rate= '전체' order by game_id limit 3")
		public List<GameInfo> selectAllUsersGame();
	
	//추천 게임
	@Select("select * from game_info order by game_sale_count desc limit 3")
	public List<GameInfo> selectRecommendGame();
	
	
	
	//최근 업데이트
	@Select("select * from game_info order by game_id desc limit 7")
	public List<GameInfo> selectRecentUpdateGame();
	
	//최고 인기작
	@Select("select * from game_info order by game_sale_count limit 7")
	public List<GameInfo> selectHottestGame();
	
	
}

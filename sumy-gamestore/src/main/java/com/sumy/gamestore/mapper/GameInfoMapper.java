package com.sumy.gamestore.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sumy.gamestore.dto.CategoryCountDto;
import com.sumy.gamestore.vo.PagingVO;
import com.sumy.gamestore.model.GameInfo;



@Mapper
public interface GameInfoMapper {
	
	public int insertGame(GameInfo game);
	public GameInfo selectOneByGameId(int gameId);
	public int updateGame(GameInfo game);
	//리뷰리스트를 게임 아이디로 조회해서 해당 리뷰아이디를 List<> 로 받아옴
	public List<Integer> findReviewListByGameId(int gameId);
	public int deleteReportListByReviewId(int reviewId);
	public int deleteReviewByGameId(int gameId);
	public int deleteWishListGameByGameId(int gameId);
	public int deletePurchasedGameListByGameId(int gameId);
	public int deleteGameInfoById(int gameId);
	public List<String> selectCategoryNameByCategoryId(int gameId);
	public List<GameInfo> selectRelatedGameInfo(int categoryId);
	// 카테고리별 개수 조회
	public List<CategoryCountDto> countCategoryListGroupById();
	public int countGameList(PagingVO vo);
	public List<GameInfo> selectGameList(PagingVO vo);

}


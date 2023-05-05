package com.sumy.gamestore.mapper;

import com.sumy.gamestore.dto.ReviewUserDto;
import com.sumy.gamestore.model.ReviewList;
import com.sumy.gamestore.vo.PagingVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReviewListMapper {
	
	public ReviewList selectOneByReviewId(int reviewId);
	public int insertReview(ReviewList reviewList);
	public int updateReview(ReviewList reviewList);
	public int deleteReportList(int reviewId);
	public int deleteReview(int reviewId);
	public List<ReviewUserDto> selectReviewByGameIdUpto5(int gameId);
	public List<ReviewUserDto> selectReviewByGameId(@Param("gameId") int gameId,@Param("vo") PagingVO vo);
	public int countReviewByGameId(@Param("gameId") int gameId,@Param("vo") PagingVO vo);
	public int countReviewByGameIdAndUserName(@Param("userId") int userId, @Param("gameId") int gameId);
	
	public int countReviewList(PagingVO vo);
	public List<ReviewList> selectReviewList(PagingVO vo);
	
}

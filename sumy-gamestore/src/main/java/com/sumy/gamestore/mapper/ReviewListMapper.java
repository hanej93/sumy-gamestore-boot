package com.sumy.gamestore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.dto.ReviewUserDto;
import com.sumy.gamestore.model.ReviewList;

@Mapper
public interface ReviewListMapper {
	
	@Select("select * from review_list where review_id = #{reviewId}")
	public ReviewList selectOneByReviewId(int reviewId);
	
	@Insert("insert into review_list values("
			+ "#{reviewId}, "
			+ "#{gameId}, "
			+ "#{userId}, "
			+ "#{reviewText}, "
			+ "#{reviewLikeCount}, "
			+ "#{reviewReportCount}, "
			+ "#{reviewStarRating}, "
			+ "#{reviewWriteDate}, "
			+ "#{reviewUpdateDate})")
	public int insertReview(ReviewList reviewList);
	
	@Update("update review_list set "
			+ "game_id=#{gameId}, "
			+ "user_id = #{userId}, "
			+ "review_text = #{reviewText}, "
			+ "review_like_count = #{reviewLikeCount}, "
			+ "review_report_count = #{reviewReportCount}, "
			+ "review_star_rating = #{reviewStarRating}, "
			+ "review_write_date = #{reviewWriteDate}, "
			+ "review_update_date = #{reviewUpdateDate} "
			+ " where review_id = #{reviewId}")
	public int updateReview(ReviewList reviewList);
	
	@Delete("delete from report_list where review_id = #{reviewId}")
	public int deleteReportList(int reviewId);
	
	@Delete("delete from review_list where review_id = #{reviewId}")
	public int deleteReview(int reviewId);
	
	// ================================================
	
	@Select("select * from review_list r "
			+ "join user_info u "
			+ "on r.user_id = u.user_id "
			+ "where game_id = #{gameId} "
			+ "order by review_update_date desc limit 5")
	public List<ReviewUserDto> selectReviewByGameIdUpto5(int gameId);
	
	
	@Select("select * from review_list r "
			+ "join user_info u "
			+ "on r.user_id = u.user_id "
			+ "where game_id = #{gameId} "
			+ "order by review_update_date desc limit #{vo.start}, #{vo.cntPerPage}")
	public List<ReviewUserDto> selectReviewByGameId(@Param("gameId") int gameId,@Param("vo") PagingVO vo);
	
	@Select("select count(*) from review_list r "
			+ "join user_info u "
			+ "on r.user_id = u.user_id "
			+ "where game_id = #{gameId} "
			+ "order by review_update_date desc")
	public int countReviewByGameId(@Param("gameId") int gameId,@Param("vo") PagingVO vo);
	
	@Select("select count(*) from review_list r "
			+ "join user_info u "
			+ "on r.user_id = u.user_id "
			+ "where r.user_id = #{userId} "
			+ "and game_id = #{gameId}")
	public int countReviewByGameIdAndUserName(@Param("userId") int userId, @Param("gameId") int gameId);
	
//	@Select("select count(*) from review_list")
	public int countReviewList(PagingVO vo);

//	@Select("select * from review_list order by review_id desc limit #{start}, #{cntPage}")
	public List<ReviewList> selectReviewList(PagingVO vo);
	
}

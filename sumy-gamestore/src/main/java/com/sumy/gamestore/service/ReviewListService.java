package com.sumy.gamestore.service;

import com.sumy.gamestore.dto.ReviewUserDto;
import com.sumy.gamestore.mapper.ReviewListMapper;
import com.sumy.gamestore.model.ReviewList;
import com.sumy.gamestore.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class ReviewListService {

	private final ReviewListMapper reviewListMapper;

	public int getCountForPaging(PagingVO vo) {
		return reviewListMapper.countReviewList(vo);
	}
	
	public List<ReviewList> findList(PagingVO vo){
		return reviewListMapper.selectReviewList(vo);
	}
	
	public List<ReviewUserDto> findReviewListByGameIdTop5(int gameId){
		return reviewListMapper.selectReviewByGameIdUpto5(gameId);
	}

	public int getCountByGameIdAndUserId(int userId, int gameId) {
		return reviewListMapper.countReviewByGameIdAndUserName(userId, gameId);
	}
	
	public int save(ReviewList reviewList){
		return reviewListMapper.insertReview(reviewList);
	}
	
	public List<ReviewUserDto> findByGameIdForPaging(int gameId, PagingVO vo){
		return reviewListMapper.selectReviewByGameId(gameId, vo);
	}
	
	public int getByGameIdForPaging(int gameId, PagingVO vo) {
		return reviewListMapper.countReviewByGameId(gameId, vo);
	}
	
	
	public ReviewList findById(int reviewId) {
		ReviewList reviewList = reviewListMapper.selectOneByReviewId(reviewId);
		return reviewList;
	}
	
	public int update(ReviewList reviewList) {
		return reviewListMapper.updateReview(reviewList);
	}
	
	public int delete(int reviewId) {
		reviewListMapper.deleteReportList(reviewId);
		return reviewListMapper.deleteReview(reviewId);
	}
}

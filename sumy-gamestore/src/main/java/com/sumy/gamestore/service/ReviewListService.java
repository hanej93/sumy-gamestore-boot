package com.sumy.gamestore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.dto.ReviewUserDto;
import com.sumy.gamestore.mapper.ReviewListMapper;
import com.sumy.gamestore.mapper.UserInfoMapper;
import com.sumy.gamestore.model.ReviewList;
import com.sumy.gamestore.model.UserInfo;

@Service
public class ReviewListService {

	@Autowired
	private ReviewListMapper reviewListMapper;
	
	@Autowired
	private UserInfoMapper userInfoMapper; 

	// 총 리뷰 갯수 조회
	public int 리뷰총개수(PagingVO vo) {
		return reviewListMapper.countReviewList(vo);
	}
	
	// 한 페이지 리뷰 리스트 조회
	public List<ReviewList> 한페이지리뷰리스트(PagingVO vo){
		return reviewListMapper.selectReviewList(vo);
	}
	
	// 한 페이지 리뷰 리스트 조회
	public List<ReviewUserDto> 리뷰검색_게임아이디_5(int gameId){
		return reviewListMapper.selectReviewByGameIdUpto5(gameId);
	}
	
	// 리뷰테이블에 유저아이디 갯수
	public int 유저아이디개수_이메일(int userId, int gameId) {
		// UserInfo userInfo = userInfoMapper.findByUserEmail(email);
		return reviewListMapper.countReviewByGameIdAndUserName(userId, gameId);
	}
	
	public int 리뷰작성(ReviewList reviewList){
		return reviewListMapper.insertReview(reviewList);
	}
	
	public List<ReviewUserDto> 리뷰검색_게임아이디(int gameId, PagingVO vo){
		return reviewListMapper.selectReviewByGameId(gameId, vo);
	}
	
	public int 리뷰총개수_게임아이디(int gameId, PagingVO vo) {
		return reviewListMapper.countReviewByGameId(gameId, vo);
	}
	
	
	public ReviewList 리뷰검색(int reviewId) {
		ReviewList reviewList = reviewListMapper.selectOneByReviewId(reviewId);
		return reviewList;
	}
	
	public int 리뷰수정(ReviewList reviewList) {
		return reviewListMapper.updateReview(reviewList);
	}
	
	public int 리뷰삭제(int reviewId) {
		reviewListMapper.deleteReportList(reviewId);
		return reviewListMapper.deleteReview(reviewId);
	}
}

package com.sumy.gamestore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.mapper.UserInfoMapper;
import com.sumy.gamestore.model.UserInfo;

@Service
public class UserInfoService {

	@Autowired
	private UserInfoMapper userInfoMapper;
	
	// 총 유저 갯수 조회
	public int 유저총개수(PagingVO vo) {
		return userInfoMapper.countUserList(vo);
	}
	
	// 한 페이지 유저 리스트 조회
	public List<UserInfo> 한페이지유저리스트(PagingVO vo){
		return userInfoMapper.selectUserInfo(vo);
	}
	
	public UserInfo 유저검색(int userId) {
		UserInfo userInfo = userInfoMapper.selectOneByUserId(userId);
		return userInfo;
	}
	
	public UserInfo 유저검색_이메일(String userEmail) {
		UserInfo userInfo = userInfoMapper.findByUserEmail(userEmail);
		return userInfo;
	}
	
	public int 유저수정(UserInfo userInfo) {
		return userInfoMapper.updateUser(userInfo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int 유저삭제(int userId) {
		
		userInfoMapper.deleteReportList(userId);
		
		userInfoMapper.deletePurchasedGameList(userId);
		userInfoMapper.deleteQuestionList(userId);
		
		userInfoMapper.deleteReview(userId);
		userInfoMapper.deleteWishListGame(userId);
		
		return userInfoMapper.deleteUser(userId);
	}
}

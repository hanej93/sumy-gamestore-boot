package com.sumy.gamestore.service;

import com.sumy.gamestore.mapper.UserInfoMapper;
import com.sumy.gamestore.model.UserInfo;
import com.sumy.gamestore.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
@RequiredArgsConstructor
@Service
public class UserInfoService {

	private final UserInfoMapper userInfoMapper;
	
	// 총 유저 갯수 조회
	public int getTotalCount(PagingVO vo) {
		return userInfoMapper.countUserList(vo);
	}
	
	// 한 페이지 유저 리스트 조회
	public List<UserInfo> findList(PagingVO vo){
		return userInfoMapper.selectUserInfo(vo);
	}
	
	public UserInfo findById(int userId) {
		UserInfo userInfo = userInfoMapper.selectOneByUserId(userId);
		return userInfo;
	}
	
	public UserInfo findByUserEmail(String userEmail) {
		UserInfo userInfo = userInfoMapper.findByUserEmail(userEmail);
		return userInfo;
	}

	@Transactional
	public int update(UserInfo userInfo) {
		return userInfoMapper.updateUser(userInfo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int delete(int userId) {
		
		userInfoMapper.deleteReportList(userId);
		userInfoMapper.deletePurchasedGameList(userId);
		userInfoMapper.deleteQuestionList(userId);
		userInfoMapper.deleteReview(userId);
		userInfoMapper.deleteWishListGame(userId);
		
		return userInfoMapper.deleteUser(userId);
	}
}

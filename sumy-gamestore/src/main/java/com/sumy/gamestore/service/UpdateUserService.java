package com.sumy.gamestore.service;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumy.gamestore.mapper.UpdateUserMapper;
import com.sumy.gamestore.model.UserInfo;

@RequiredArgsConstructor
@Service
public class UpdateUserService {

	private final UpdateUserMapper updateUserMapper;
	
	//프로필 이미지 업데이트
	public UserInfo insertUserProfileImage(UserInfo userInfo) {
		System.out.println("정보수정 전 객체 내용 : "+userInfo.getUserProfileImage());
		int row = updateUserMapper.insertUserProfileImage(userInfo);
		if(!(row>0)) {
			System.out.println("updateUserMapper.insertUserProfileImage(userInfo) 반영된 줄 수 : "+row);
			System.out.println("정보수정 완료 객체 내용"+userInfo.getUserProfileImage());
			return null;
		}
		return userInfo;//성공 시 객체 반환
	}
	
	//닉네임 업데이트
	public UserInfo insertUserNickname(UserInfo userInfo) {
		System.out.println("정보수정 전 객체 내용 : "+userInfo.getUserNickname());
		int row = updateUserMapper.insertUserNickname(userInfo);
		if(!(row>0)) {
			System.out.println("updateUserMapper.insertUserNickname(userInfo) 반영된 줄 수 : "+row);
			System.out.println("정보수정 완료 객체 내용"+userInfo.getUserNickname());
			return null;
		}
		return userInfo;//성공 시 객체 반환
	}
	
	//비밀번호 찾기 이메일 체크
	public int selectUserEmail(UserInfo userInfo) {
		System.out.println("정보수정 전 객체 내용 : "+userInfo.getUserEmail());
		UserInfo selectUser = updateUserMapper.selectUserEmail(userInfo);
		
		if(selectUser==null) {
			System.out.println("select된 email 없음");
			
			return 0;
		}
		System.out.println("정보수정 완료 객체 내용"+selectUser.getUserId());
		System.out.println("정보수정 완료 객체 내용"+selectUser.getUserEmail());
		return selectUser.getUserId();
	}
	
	//비밀번호 업데이트
	public UserInfo insertUserPassword(UserInfo userInfo) {
		System.out.println("서비스에서 받은 유저 아이디 : "+userInfo.getUserId());
		System.out.println("서비스에서 받은 유저 이메일 : "+userInfo.getUserEmail());
		System.out.println("서비스에서 받은 유저 비밀번호 : "+userInfo.getUserPassword());
		int row = updateUserMapper.insertUserPassword(userInfo);
		if(!(row>0)) {
			System.out.println("updateUserMapper.insertUserPassword(userInfo) 반영된 줄 수 : "+row);
			System.out.println("정보수정 완료 객체 내용"+userInfo.getUserPassword());
			return null;
		}
		return userInfo;//성공 시 객체 반환
	}
	
	//주소 업데이트
	public UserInfo insertUserAddress(UserInfo userInfo) {
		System.out.println("정보수정 전 객체 내용 : "+userInfo.getUserAddress());
		int row = updateUserMapper.insertUserAddress(userInfo);
		if(!(row>0)) {
			System.out.println("updateUserMapper.insertUserAddress(userInfo) 반영된 줄 수 : "+row);
			System.out.println("정보수정 완료 객체 내용"+userInfo.getUserAddress());
			return null;
		}
		return userInfo;//성공 시 객체 반환
	}
	
	//폰번호 업데이트
	public UserInfo insertUserPhoneNumber(UserInfo userInfo) {
		System.out.println("정보수정 전 객체 내용 : "+userInfo.getUserPhoneNumber());
		int row = updateUserMapper.insertUserPhoneNumber(userInfo);
		if(!(row>0)) {
			System.out.println("updateUserMapper.insertUserPhoneNumber(userInfo) 반영된 줄 수 : "+row);
			System.out.println("정보수정 완료 객체 내용"+userInfo.getUserPhoneNumber());
			return null;
		}
		return userInfo;//성공 시 객체 반환
	}
	
	//비밀번호 업데이트
		public UserInfo pwdRecoveryUpdate(UserInfo userInfo) {
			System.out.println("정보수정 전 객체 내용 : "+userInfo.getUserPassword());
			int row = updateUserMapper.pwdRecoveryUpdate(userInfo);
			if(!(row>0)) {
				System.out.println("updateUserMapper.insertUserPhoneNumber(userInfo) 반영된 줄 수 : "+row);
				System.out.println("정보수정 완료 객체 내용"+userInfo.getUserPassword());
				return null;
			}
			return userInfo;//성공 시 객체 반환
		}
	

}

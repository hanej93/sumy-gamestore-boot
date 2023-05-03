package com.sumy.gamestore.service;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumy.gamestore.mapper.LoginUserMapper;
import com.sumy.gamestore.model.UserInfo;

@RequiredArgsConstructor
@Service
public class LoginUserService {

	private final LoginUserMapper loginUserMapper;
	
	public boolean selectUser(UserInfo userInfo) {
		System.out.println(userInfo);
		System.out.println(userInfo.getUserEmail());
		UserInfo user = loginUserMapper.selectUserByEmail(userInfo.getUserEmail());
		System.out.println("3번째 친구 : "+user);
		return true;
	}
	
}

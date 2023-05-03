package com.sumy.gamestore.service;

import java.time.LocalDate;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumy.gamestore.mapper.JoinedUserMapper;
import com.sumy.gamestore.model.UserInfo;

@Service
@RequiredArgsConstructor
public class JoinedUserService {

	private final JoinedUserMapper joinedUserMapper;
	
	public int addUser(UserInfo userInfo) {
		userInfo.setUserJoinedDate(LocalDate.now());
		userInfo.setUserAuthorityRate("ROLE_USER");
		System.out.println(userInfo);
		return joinedUserMapper.insertUser(userInfo);
	}
}

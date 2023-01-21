package com.sumy.gamestore.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.mapper.JoinedUserMapper;
import com.sumy.gamestore.mapper.NewsListMapper;
import com.sumy.gamestore.model.NewsList;
import com.sumy.gamestore.model.UserInfo;

@Service
public class JoinedUserService {

	@Autowired
	private JoinedUserMapper joinedUserMapper;
	
	public int addUser(UserInfo userInfo) {
		userInfo.setUserJoinedDate(LocalDate.now());
		userInfo.setUserAuthorityRate("ROLE_USER");
		System.out.println(userInfo);
		return joinedUserMapper.insertUser(userInfo);
	}
}

package com.sumy.gamestore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sumy.gamestore.model.UserInfo;
import com.sumy.gamestore.service.JoinedUserService;

//@Controller
//@RequestMapping("/success")
//public class ComleteController {

//
//	@Autowired
//	JoinedUserService joinedUserService;
//
//	
//	// 회원가입 완료 화면
//	@PostMapping("/login")
//	public String test8(UserInfo userInfo) {
//		int total = joinedUserService.addUser(userInfo);
//		System.out.println(total);
//		return "user/page-order-completed-1";
//	}
//}

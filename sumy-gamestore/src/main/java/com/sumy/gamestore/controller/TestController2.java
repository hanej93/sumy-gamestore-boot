package com.sumy.gamestore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.sumy.gamestore.service.JoinedUserService;

@Controller
//@RequestMapping("/sumy")
public class TestController2 {
	
	@Autowired
	JoinedUserService joinedUserService;

	// 카탈로그 화면
	@GetMapping("catalogue-page")
	public String test2() {

		return "user/catalogue-page";
	}

	// 게임 상세 화면
	@GetMapping("page-single-product-1")
	public String test3() {

		return "user/page-single-product-1";
	}

	// 리뷰 화면
	@GetMapping("reviewMore-page")
	public String test4() {

		return "user/reviewMore-page";
	}

	// Q&A화면
	@GetMapping("qna")
	public String test5() {

		return "user/page-help-1";
	}

	// 뉴스 화면
//	@GetMapping("page-our-stores-1")
//	public String test10() {
//
//		return "user/page-our-stores-1";
//	}
//
//	// 뉴스 상세 화면
//	@GetMapping("page-our-stores-2")
//	public String test11() {
//
//		return "user/page-our-stores-2";
//	}
}

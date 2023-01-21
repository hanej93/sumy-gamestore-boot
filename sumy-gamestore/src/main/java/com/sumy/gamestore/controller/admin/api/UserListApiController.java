package com.sumy.gamestore.controller.admin.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sumy.gamestore.dto.ResponseDto;
import com.sumy.gamestore.model.PurchasedGameList;
import com.sumy.gamestore.model.QuestionList;
import com.sumy.gamestore.model.ReportList;
import com.sumy.gamestore.model.ReviewList;
import com.sumy.gamestore.model.UserInfo;
import com.sumy.gamestore.model.WishlistGame;
import com.sumy.gamestore.service.UserInfoService;

@RestController
public class UserListApiController {

	@Autowired
	UserInfoService userInfoService;

	@PutMapping("/admin/user/blacklist")
	public ResponseDto<Integer> updateUserBlackList(@RequestBody UserInfo userInfo) {
		System.out.println(userInfo.getUserId());
		System.out.println(userInfo.getUserBlacklist());	
		
		UserInfo resultUser = userInfoService.유저검색(userInfo.getUserId());
		resultUser.setUserBlacklist(userInfo.getUserBlacklist());
		userInfoService.유저수정(resultUser);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	
	
	@PostMapping("/admin/user/memo")
	public ResponseDto<UserInfo> showMemo(@RequestBody UserInfo userInfo) {
		
		UserInfo resultUser = userInfoService.유저검색(userInfo.getUserId());
		
		return new ResponseDto<UserInfo>(HttpStatus.OK.value(), resultUser);
	}
	
	@PutMapping("/admin/user/memo")
	public ResponseDto<Integer> updateMemo(@RequestBody UserInfo userInfo) {
		
		UserInfo resultUser = userInfoService.유저검색(userInfo.getUserId());
		resultUser.setUserWarningCount(userInfo.getUserWarningCount());
		resultUser.setUserMemo(userInfo.getUserMemo());
		
		userInfoService.유저수정(resultUser);

		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	
	
	@PutMapping("/admin/user/update")
	public ResponseDto<Integer> updateGame(@RequestBody UserInfo userInfo) {
		System.out.println("출력확인!!");
		System.out.println(HttpStatus.OK.value());
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/admin/user/list")
	public ResponseDto<Integer> deleteGame(@RequestBody UserInfo userInfo, QuestionList questionList, 
		ReportList reportList, ReviewList reviewList, WishlistGame wishlistGame, PurchasedGameList purchasedGameList) {
		System.out.println(userInfo.getUserId());
		int result = userInfoService.유저삭제(userInfo.getUserId());
		
		userInfoService.유저삭제(reviewList.getUserId());
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
	}
}

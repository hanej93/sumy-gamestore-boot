package com.sumy.gamestore.controller.admin.api;

import com.sumy.gamestore.dto.ResponseDto;
import com.sumy.gamestore.model.*;
import com.sumy.gamestore.service.UserInfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RequiredArgsConstructor
@RestController
public class UserListApiController {

	private final UserInfoService userInfoService;

	@PutMapping("/admin/user/blacklist")
	public ResponseDto<Integer> updateUserBlackList(@RequestBody UserInfo userInfo) {
		UserInfo resultUser = userInfoService.findById(userInfo.getUserId());
		resultUser.setUserBlacklist(userInfo.getUserBlacklist());
		userInfoService.update(resultUser);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/admin/user/memo")
	public ResponseDto<UserInfo> showMemo(@RequestBody UserInfo userInfo) {
		UserInfo resultUser = userInfoService.findById(userInfo.getUserId());
		
		return new ResponseDto<UserInfo>(HttpStatus.OK.value(), resultUser);
	}
	
	@PutMapping("/admin/user/memo")
	public ResponseDto<Integer> updateMemo(@RequestBody UserInfo userInfo) {
		UserInfo resultUser = userInfoService.findById(userInfo.getUserId());
		resultUser.setUserWarningCount(userInfo.getUserWarningCount());
		resultUser.setUserMemo(userInfo.getUserMemo());
		
		userInfoService.update(resultUser);

		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PutMapping("/admin/user/update")
	public ResponseDto<Integer> updateGame(@RequestBody UserInfo userInfo) {
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/admin/user/list")
	public ResponseDto<Integer> deleteGame(@RequestBody UserInfo userInfo, QuestionList questionList, 
		ReportList reportList, ReviewList reviewList, WishlistGame wishlistGame, PurchasedGameList purchasedGameList) {
		int result = userInfoService.delete(userInfo.getUserId());
		
		userInfoService.delete(reviewList.getUserId());
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
	}
}

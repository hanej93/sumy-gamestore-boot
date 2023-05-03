package com.sumy.gamestore.controller.admin.api;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sumy.gamestore.dto.ReportReviewUserDto;
import com.sumy.gamestore.dto.ResponseDto;
import com.sumy.gamestore.model.ReportList;
import com.sumy.gamestore.model.UserInfo;
import com.sumy.gamestore.service.ReportListService;
import com.sumy.gamestore.service.ReviewListService;
import com.sumy.gamestore.service.UserInfoService;

@Slf4j
@RequiredArgsConstructor
@RestController
public class ReportListApiController {

	private final ReportListService reportListService;
	private final ReviewListService reviewListService;
	private final UserInfoService userInfoService;
	
	// 리포트 읽음 수정
	@PutMapping("/admin/report/readYn")
	public ResponseDto<Integer> updateReportReadYn(@RequestBody ReportList reportList) {
		ReportList resultReport = reportListService.신고검색(reportList.getReportId());
		resultReport.setReportReadYn(reportList.getReportReadYn());
		// 신고수정
		int result = reportListService.신고수정(resultReport);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
	}
	
	// 유저 경고 수정
	@PutMapping("/admin/report/memo")
	public ResponseDto<Integer> updateUserWarningCnt(@RequestBody ReportReviewUserDto reportReviewUserDto) {
		UserInfo resultUser =  userInfoService.유저검색(reportReviewUserDto.getToUserId());
		resultUser.setUserWarningCount(reportReviewUserDto.getToUserWarningCount());
		
		userInfoService.유저수정(resultUser);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	// 신고삭제 기능
	@DeleteMapping("/admin/report/list")
	public ResponseDto<Integer> deleteReport(@RequestBody ReportList reportList) {
		int result = reportListService.신고삭제(reportList.getReportId());
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
	}
	
	// 리뷰삭제 기능 (미구현 - 리뷰 관련 클래스필요)
	@DeleteMapping("/admin/report/review")
	public ResponseDto<Integer> deleteReview(@RequestBody ReportReviewUserDto reportReviewUserDto) {
		reviewListService.리뷰삭제(reportReviewUserDto.getReviewId());
		
		int result = 1;
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
	}
	
}

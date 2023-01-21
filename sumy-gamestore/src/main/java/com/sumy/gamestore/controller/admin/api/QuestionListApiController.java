package com.sumy.gamestore.controller.admin.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;

import com.sumy.gamestore.dto.QuestionUserDto;
import com.sumy.gamestore.dto.ResponseDto;
import com.sumy.gamestore.model.QuestionList;
import com.sumy.gamestore.service.QuestionListService;
import com.sumy.gamestore.service.QuestionMailSendService;

@RestController
public class QuestionListApiController {

	@Autowired
	QuestionListService questionListService;

	@Autowired
	QuestionMailSendService questionMailSendService;
	
	@PutMapping("/admin/question/answer")
	public ResponseDto<Integer> updateQuestionAnswer(@RequestBody QuestionList questionList) {
		System.out.println("questionAnswer : " + questionList.getQuestionAnswerYn());
		
		QuestionList resultQuestion = questionListService.문의검색(questionList.getQuestionId());
		resultQuestion.setQuestionAnswerYn(questionList.getQuestionAnswerYn());
		questionListService.문의수정(resultQuestion);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PutMapping("/admin/question/reader")
	public ResponseDto<Integer> updateQuestionReader(@RequestBody QuestionList questionList) {
		System.out.println("QuestionId : " + questionList.getQuestionId());
		System.out.println("QuestionReadYn : " + questionList.getQuestionReadYn());
		
		QuestionList resultQuestion = questionListService.문의검색(questionList.getQuestionId());
		resultQuestion.setQuestionReadYn(questionList.getQuestionReadYn());
		questionListService.문의수정(resultQuestion);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PostMapping("/admin/question/email")
	public ResponseDto<Integer> updateQuestionReader(@RequestBody QuestionUserDto questionUserDto) {
		System.out.println("Email : " + questionUserDto.getUserEmail());
		System.out.println("Text : " + questionUserDto.getQuestionText());
		questionMailSendService.sendMail(questionUserDto.getUserEmail(), questionUserDto.getQuestionText());
		
		QuestionList answerQuestion = questionListService.문의검색(questionUserDto.getQuestionId());
		answerQuestion.setQuestionAnswerYn(1);
		questionListService.문의수정(answerQuestion);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	
//	
//	@PostMapping("/admin/user/memo")
//	public ResponseDto<UserInfo> showMemo(@RequestBody UserInfo userInfo) {
//		
//		UserInfo resultUser = userInfoService.유저검색(userInfo.getUserId());
//		
//		return new ResponseDto<UserInfo>(HttpStatus.OK.value(), resultUser);
//	}
//	
//	@PutMapping("/admin/user/memo")
//	public ResponseDto<Integer> updateMemo(@RequestBody UserInfo userInfo) {
//		
//		UserInfo resultUser = userInfoService.유저검색(userInfo.getUserId());
//		resultUser.setUserWarningCount(userInfo.getUserWarningCount());
//		resultUser.setUserMemo(userInfo.getUserMemo());
//		
//		System.out.println(resultUser);
//
//		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
//	}

	
	
	@PutMapping("/admin/question/update")
	public ResponseDto<Integer> updateQuestion(@RequestBody QuestionList questionList) {
		System.out.println("출력확인!!");
		System.out.println(HttpStatus.OK.value());
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/admin/question/list")
	public ResponseDto<Integer> deletequestion(@RequestBody QuestionList questionList) {
		System.out.println(questionList.getQuestionId());
		int result = questionListService.문의삭제(questionList.getQuestionId());
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
	}
}

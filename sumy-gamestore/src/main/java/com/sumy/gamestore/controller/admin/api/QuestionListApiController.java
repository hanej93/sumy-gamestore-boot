package com.sumy.gamestore.controller.admin.api;

import com.sumy.gamestore.mail.MailSendService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sumy.gamestore.dto.QuestionUserDto;
import com.sumy.gamestore.dto.ResponseDto;
import com.sumy.gamestore.model.QuestionList;
import com.sumy.gamestore.service.QuestionListService;

@Slf4j
@RequiredArgsConstructor
@RestController
public class QuestionListApiController {

	private final QuestionListService questionListService;
	private final MailSendService mailSendService;
	
	@PutMapping("/admin/question/answer")
	public ResponseDto<Integer> updateQuestionAnswer(@RequestBody QuestionList questionList) {
		log.info("questionAnswer : " + questionList.getQuestionAnswerYn());
		
		QuestionList resultQuestion = questionListService.문의검색(questionList.getQuestionId());
		resultQuestion.setQuestionAnswerYn(questionList.getQuestionAnswerYn());
		questionListService.문의수정(resultQuestion);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PutMapping("/admin/question/reader")
	public ResponseDto<Integer> updateQuestionReader(@RequestBody QuestionList questionList) {
		log.info("QuestionId : " + questionList.getQuestionId());
		log.info("QuestionReadYn : " + questionList.getQuestionReadYn());
		
		QuestionList resultQuestion = questionListService.문의검색(questionList.getQuestionId());
		resultQuestion.setQuestionReadYn(questionList.getQuestionReadYn());
		questionListService.문의수정(resultQuestion);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PostMapping("/admin/question/email")
	public ResponseDto<Integer> updateQuestionReader(@RequestBody QuestionUserDto questionUserDto) {
		log.info("Email : " + questionUserDto.getUserEmail());
		log.info("Text : " + questionUserDto.getQuestionText());
		mailSendService.sendMail(questionUserDto.getUserEmail(), questionUserDto.getQuestionText(), "Sumy GameStore 문의 답변");
		
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
//		log.info(resultUser);
//
//		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
//	}

	
	
	@PutMapping("/admin/question/update")
	public ResponseDto<Integer> updateQuestion(@RequestBody QuestionList questionList) {
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/admin/question/list")
	public ResponseDto<Integer> deletequestion(@RequestBody QuestionList questionList) {
		int result = questionListService.문의삭제(questionList.getQuestionId());
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
	}
}

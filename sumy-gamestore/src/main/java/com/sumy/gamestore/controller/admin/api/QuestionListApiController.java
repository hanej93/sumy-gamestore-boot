package com.sumy.gamestore.controller.admin.api;

import com.sumy.gamestore.dto.QuestionUserDto;
import com.sumy.gamestore.dto.ResponseDto;
import com.sumy.gamestore.mail.MailSendService;
import com.sumy.gamestore.model.QuestionList;
import com.sumy.gamestore.service.QuestionListService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RequiredArgsConstructor
@RestController
public class QuestionListApiController {

	private final QuestionListService questionListService;
	private final MailSendService mailSendService;
	
	@PutMapping("/admin/question/answer")
	public ResponseDto<Integer> updateQuestionAnswer(@RequestBody QuestionList questionList) {

		QuestionList resultQuestion = questionListService.findById(questionList.getQuestionId());
		resultQuestion.setQuestionAnswerYn(questionList.getQuestionAnswerYn());
		questionListService.update(resultQuestion);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PutMapping("/admin/question/reader")
	public ResponseDto<Integer> updateQuestionReader(@RequestBody QuestionList questionList) {
		log.info("QuestionId : " + questionList.getQuestionId());
		log.info("QuestionReadYn : " + questionList.getQuestionReadYn());
		
		QuestionList resultQuestion = questionListService.findById(questionList.getQuestionId());
		resultQuestion.setQuestionReadYn(questionList.getQuestionReadYn());
		questionListService.update(resultQuestion);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PostMapping("/admin/question/email")
	public ResponseDto<Integer> updateQuestionReader(@RequestBody QuestionUserDto questionUserDto) {
		log.info("Email : " + questionUserDto.getUserEmail());
		log.info("Text : " + questionUserDto.getQuestionText());
		mailSendService.sendMail(questionUserDto.getUserEmail(), questionUserDto.getQuestionText(), "Sumy GameStore 문의 답변");
		
		QuestionList answerQuestion = questionListService.findById(questionUserDto.getQuestionId());
		answerQuestion.setQuestionAnswerYn(1);
		questionListService.update(answerQuestion);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PutMapping("/admin/question/update")
	public ResponseDto<Integer> updateQuestion(@RequestBody QuestionList questionList) {
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/admin/question/list")
	public ResponseDto<Integer> deleteQuestion(@RequestBody QuestionList questionList) {
		int result = questionListService.delete(questionList.getQuestionId());
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
	}
}

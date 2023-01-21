package com.sumy.gamestore.service;


import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumy.gamestore.controller.MyPageController;
import com.sumy.gamestore.mapper.QuestionUserMapper;
import com.sumy.gamestore.model.QuestionList;

@Service
public class QuestionUserService {
	
	@Autowired
	private QuestionUserMapper questionUserMapper;
	
	public int questionInsert(QuestionList question) {
		question.setQuestionWriteDate(LocalDateTime.now());//문의등록 시간 보여줌
		question.setQuestionAnswerYn(0);//문의등록 응답여부
		question.setQuestionReadYn(0);//문의등록 확인여부
		System.out.println(question);
		return questionUserMapper.insertQuestion(question);
	}

}

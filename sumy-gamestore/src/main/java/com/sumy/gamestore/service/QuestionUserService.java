package com.sumy.gamestore.service;


import com.sumy.gamestore.mapper.QuestionUserMapper;
import com.sumy.gamestore.model.QuestionList;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class QuestionUserService {
	
	private final QuestionUserMapper questionUserMapper;

	public int insertQuestion(QuestionList question) {
		question.setQuestionWriteDate(LocalDateTime.now());//문의등록 시간 보여줌
		question.setQuestionAnswerYn(0);//문의등록 응답여부
		question.setQuestionReadYn(0);//문의등록 확인여부
		System.out.println(question);
		return questionUserMapper.insertQuestion(question);
	}

}

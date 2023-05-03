package com.sumy.gamestore.service;

import com.sumy.gamestore.dto.QuestionUserDto;
import com.sumy.gamestore.mapper.QuestionListMapper;
import com.sumy.gamestore.model.QuestionList;
import com.sumy.gamestore.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class QuestionListService {

	private final QuestionListMapper questionListMapper;

	// 총 문의 갯수 조회
	public int 문의총개수(PagingVO vo) {
		return questionListMapper.countQuestionList(vo);
	}
	
	// 한 페이지 문의 리스트 조회
	public List<QuestionUserDto> 한페이지문의리스트(PagingVO vo){
		return questionListMapper.selectQuestionList(vo);
	}
	
	public QuestionList 문의검색(int questionId) {
		QuestionList questionList = questionListMapper.selectOneByQuestionId(questionId);
		return questionList;
	}
	
	public int 문의수정(QuestionList questionList) {
		return questionListMapper.updateQuestion(questionList);
	}
	
	public int 문의삭제(int questionId) {
		return questionListMapper.deleteQuestion(questionId);
	}
}

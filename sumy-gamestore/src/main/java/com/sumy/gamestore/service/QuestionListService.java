package com.sumy.gamestore.service;

import com.sumy.gamestore.dto.QuestionUserDto;
import com.sumy.gamestore.mapper.QuestionListMapper;
import com.sumy.gamestore.model.QuestionList;
import com.sumy.gamestore.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
@RequiredArgsConstructor
@Service
public class QuestionListService {

	private final QuestionListMapper questionListMapper;

	// 총 문의 갯수 조회
	public int getTotalCount(PagingVO vo) {
		return questionListMapper.countQuestionList(vo);
	}
	
	// 한 페이지 문의 리스트 조회
	public List<QuestionUserDto> findList(PagingVO vo){
		return questionListMapper.selectQuestionList(vo);
	}
	
	public QuestionList findById(int questionId) {
		QuestionList questionList = questionListMapper.selectOneByQuestionId(questionId);
		return questionList;
	}

	@Transactional
	public int update(QuestionList questionList) {
		return questionListMapper.updateQuestion(questionList);
	}

	@Transactional
	public int delete(int questionId) {
		return questionListMapper.deleteQuestion(questionId);
	}
}

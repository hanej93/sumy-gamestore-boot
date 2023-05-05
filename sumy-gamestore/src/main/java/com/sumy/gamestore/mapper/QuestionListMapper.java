package com.sumy.gamestore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sumy.gamestore.vo.PagingVO;
import com.sumy.gamestore.dto.QuestionUserDto;
import com.sumy.gamestore.model.QuestionList;

@Mapper
public interface QuestionListMapper {
	
	public QuestionList selectOneByQuestionId(int questionId);
	public int updateQuestion(QuestionList Question);
	public int deleteQuestion(int questionId);
	
	// ================================================
	public int countQuestionList(PagingVO vo);
	public List<QuestionUserDto> selectQuestionList(PagingVO vo);
	
}

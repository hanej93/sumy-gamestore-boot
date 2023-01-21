package com.sumy.gamestore.mapper;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.sumy.gamestore.model.QuestionList;

@Mapper
public interface QuestionUserMapper {
	
	@Insert("insert into question_list "
			+ "values"
			+ "(0, #{userId}, #{questionTitle}, #{questionText}"
			+ ", #{questionWriteDate}, #{questionAnswerYn}, #{questionReadYn}, #{questionImage1}"
			+ ", #{questionImage2},#{questionImage3})")
	public int insertQuestion(QuestionList question);

}

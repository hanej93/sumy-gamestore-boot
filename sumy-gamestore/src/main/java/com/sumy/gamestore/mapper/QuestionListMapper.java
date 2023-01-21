package com.sumy.gamestore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.dto.QuestionUserDto;
import com.sumy.gamestore.model.QuestionList;

@Mapper
public interface QuestionListMapper {
	
	@Select("select * from question_list where question_id = #{questionId}")
	public QuestionList selectOneByQuestionId(int questionId);

//	private int questionId;
//	private int userId;
//	private String questionTitle;
//	private String questionText;
//	private LocalDateTime questionWriteDate;
//	private int questionAnswerYn;
//	private int questionReadYn;
//	private String questionImage1;
//	private String questionImage2;
//	private String questionImage3;
	
	@Update("update question_list set user_id=#{userId}, question_title = #{questionTitle}, question_text = #{questionText},"
			+ " question_write_date = #{questionWriteDate}, question_answer_yn = #{questionAnswerYn},"
			+ " question_read_yn = #{questionReadYn}, question_image1 = #{questionImage1},"
			+ " question_image2 = #{questionImage2}, question_image3 = #{questionImage3}"
			+ " where question_id = #{questionId}")
	public int updateQuestion(QuestionList Question);
	
	@Delete("delete from question_list where question_id = #{questionId}")
	public int deleteQuestion(int questionId);
	
	// ================================================
	
//	@Select("select count(*) from question_list")
	public int countQuestionList(PagingVO vo);

//	@Select("select * from question_list order by question_id desc limit #{start}, #{cntPage}")
	public List<QuestionUserDto> selectQuestionList(PagingVO vo);
	
}

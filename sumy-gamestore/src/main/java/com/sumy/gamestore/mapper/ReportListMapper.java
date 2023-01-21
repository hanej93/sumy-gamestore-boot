package com.sumy.gamestore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.dto.ReportReviewUserDto;
import com.sumy.gamestore.model.ReportList;

@Mapper
public interface ReportListMapper {
	
//	private int reportId;
//	private int reportFromUserId;
//	private int reviewId;
//	private String reportText;
//	private LocalDateTime reportWriteDate;
//	private boolean reportReadYn;
	
	@Select("select * from report_list where report_id = #{reportId}")
	public ReportList selectOneByReportId(int reportId);
	
	@Insert("insert into report_list values(#{reportId}, #{reportFromUserId}, #{reviewId},"
			+ " #{reportText}, #{reportWriteDate}, #{reportReadYn})")
	public int insertReport(ReportList reportList);
	
	@Update("update report_list set report_from_user_id=#{reportFromUserId}, review_id = #{reviewId},"
			+ " report_text = #{reportText}, report_write_date = #{reportWriteDate},"
			+ " report_read_yn = #{reportReadYn} where report_id = #{reportId}")
	public int updateReport(ReportList reportList);
	
	@Delete("delete from report_list where report_id = #{reportId}")
	public int deleteReport(int reportId);
	
	@Select("select count(*) from report_list where review_id = #{reviewId}")
	public int countReportByReviewId(int reviewId);
	
	// ================================================
	
//	@Select("select count(*) from report_list")
	public int countReportList(PagingVO vo);

//	@Select("select * from report_list order by report_id desc limit #{start}, #{cntPage}")
	public List<ReportReviewUserDto> selectReportList(PagingVO vo);
	
}

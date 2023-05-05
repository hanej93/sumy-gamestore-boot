package com.sumy.gamestore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sumy.gamestore.vo.PagingVO;
import com.sumy.gamestore.dto.ReportReviewUserDto;
import com.sumy.gamestore.model.ReportList;

@Mapper
public interface ReportListMapper {

	public ReportList selectOneByReportId(int reportId);
	public int insertReport(ReportList reportList);
	public int updateReport(ReportList reportList);
	public int deleteReport(int reportId);
	public int countReportByReviewId(int reviewId);
	
	// ================================================
	
	public int countReportList(PagingVO vo);

	public List<ReportReviewUserDto> selectReportList(PagingVO vo);
	
}

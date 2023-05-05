package com.sumy.gamestore.mapper;

import com.sumy.gamestore.dto.ReportReviewUserDto;
import com.sumy.gamestore.model.ReportList;
import com.sumy.gamestore.vo.PagingVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

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

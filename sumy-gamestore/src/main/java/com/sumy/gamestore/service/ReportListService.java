package com.sumy.gamestore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.dto.ReportReviewUserDto;
import com.sumy.gamestore.mapper.ReportListMapper;
import com.sumy.gamestore.model.ReportList;

@Service
public class ReportListService {

	@Autowired
	private ReportListMapper reportListMapper;
	
	// 총 신고 갯수 조회
	public int 신고총개수(PagingVO vo) {
		return reportListMapper.countReportList(vo);
	}
	
	// 한 페이지 신고 리스트 조회
	public List<ReportReviewUserDto> 한페이지신고리스트(PagingVO vo){
		return reportListMapper.selectReportList(vo);
	}
	
	public ReportList 신고검색(int reportId) {
		ReportList reportList = reportListMapper.selectOneByReportId(reportId);
		return reportList;
	}
	
	public int 신고수정(ReportList reportList) {
		return reportListMapper.updateReport(reportList);
	}
	
	public int 신고삭제(int reportId) {
		return reportListMapper.deleteReport(reportId);
	}
	
	public int 댓글신고추가(ReportList reportList) {
		return reportListMapper.insertReport(reportList);
	}
	
	public int 신고개수_리뷰(int reviewId) {
		return reportListMapper.countReportByReviewId(reviewId);
	}
	
}

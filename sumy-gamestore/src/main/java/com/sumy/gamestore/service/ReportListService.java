package com.sumy.gamestore.service;

import com.sumy.gamestore.dto.ReportReviewUserDto;
import com.sumy.gamestore.mapper.ReportListMapper;
import com.sumy.gamestore.model.ReportList;
import com.sumy.gamestore.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
@RequiredArgsConstructor
@Service
public class ReportListService {

	private final ReportListMapper reportListMapper;
	
	// 총 신고 갯수 조회
	public int getTotalCount(PagingVO vo) {
		return reportListMapper.countReportList(vo);
	}
	
	// 한 페이지 신고 리스트 조회
	public List<ReportReviewUserDto> findList(PagingVO vo){
		return reportListMapper.selectReportList(vo);
	}
	
	public ReportList findById(int reportId) {
		ReportList reportList = reportListMapper.selectOneByReportId(reportId);
		return reportList;
	}

	@Transactional
	public int update(ReportList reportList) {
		return reportListMapper.updateReport(reportList);
	}

	@Transactional
	public int delete(int reportId) {
		return reportListMapper.deleteReport(reportId);
	}

	@Transactional
	public int save(ReportList reportList) {
		return reportListMapper.insertReport(reportList);
	}
	
	public int getCountById(int reviewId) {
		return reportListMapper.countReportByReviewId(reviewId);
	}
	
}

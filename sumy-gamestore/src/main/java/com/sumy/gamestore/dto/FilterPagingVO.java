package com.sumy.gamestore.dto;


import java.util.List;

import lombok.Data;

@Data
public class FilterPagingVO{
	
	private int lowPriceFilter;
	private int highPriceFilter;
	private int starFilter;
	private String discountFilter = "";
	private List<Integer> categoryListFilter;
	
	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
	private int cntPage = 5;
	
	// keyword
	private String keyword = "";
	private String orderOpt = "";
	
	public FilterPagingVO() {
	}
	
	
	public FilterPagingVO(int total, int nowPage, int cntPerPage, String keyword, String orderOpt
			, int lowPriceFilter, int highPriceFilter, int starFilter, String discountFilter, List<Integer> categoryListFilter) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
		setKeyword(keyword);
		setOrderOpt(orderOpt);
		setLowPriceFilter(lowPriceFilter);
		setHighPriceFilter(highPriceFilter);
		setStarFilter(starFilter);
		setDiscountFilter(discountFilter);
		setCategoryListFilter(categoryListFilter);
	}
	
	public FilterPagingVO(int total, int nowPage, int cntPerPage, String keyword) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
		setKeyword(keyword);
	}
	
	public FilterPagingVO(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	
	
	
	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage);
	}
}

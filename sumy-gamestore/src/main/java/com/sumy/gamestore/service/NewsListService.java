package com.sumy.gamestore.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.mapper.NewsListMapper;
import com.sumy.gamestore.model.NewsList;

@Service
public class NewsListService {

	@Autowired
	private NewsListMapper newsListMapper;
	
	public int 뉴스추가(NewsList newsList) {
		newsList.setNewsWriteDate(LocalDateTime.now());
		return newsListMapper.insertNews(newsList);
	}
	
	// 총 뉴스 갯수 조회
	public int 뉴스총개수(PagingVO vo) {
		return newsListMapper.countNewsList(vo);
	}
	// 한 페이지 뉴스 리스트 조회
	public List<NewsList> 한페이지뉴스리스트(PagingVO vo){
		return newsListMapper.selectNewsList(vo);
	}
	
	public NewsList 뉴스검색(int newsId) {
		NewsList newsList = newsListMapper.selectOneByNewsId(newsId);
		return newsList;
	}
	
	//빌더패턴 주석 걸어놓았어요
	public int 뉴스수정(NewsList newsList) {
		return newsListMapper.updateNews(newsList);
	}
	
	public int 뉴스삭제(int newsId) {
		return newsListMapper.deleteNews(newsId);
	}
}

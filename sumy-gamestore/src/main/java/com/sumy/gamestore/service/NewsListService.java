package com.sumy.gamestore.service;

import com.sumy.gamestore.mapper.NewsListMapper;
import com.sumy.gamestore.model.NewsList;
import com.sumy.gamestore.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.List;

@Transactional(readOnly = true)
@RequiredArgsConstructor
@Service
public class NewsListService {

	private final NewsListMapper newsListMapper;
	private final FileUploadService fileUploadService;

	// 총 뉴스 갯수 조회
	public int getTotalCount(PagingVO vo) {
		return newsListMapper.countNewsList(vo);
	}

	// 한 페이지 뉴스 리스트 조회
	public List<NewsList> findList(PagingVO vo){
		return newsListMapper.selectNewsList(vo);
	}
	
	public NewsList findById(int newsId) {
		NewsList newsList = newsListMapper.selectOneByNewsId(newsId);
		return newsList;
	}

	@Transactional
	public int save(NewsList newsList, MultipartFile file) {
		String resourcePathname = null;
		if (!ObjectUtils.isEmpty(file)) {
			resourcePathname = fileUploadService.uploadFile(file);
		}

		NewsList addNews =
				NewsList.builder()
						.newsId(0)
						.newsTitle(newsList.getNewsTitle())
						.newsSubTitle(newsList.getNewsSubTitle())
						.newsThumbImage(resourcePathname)
						.newsText(newsList.getNewsText())
						.newsWriteDate(LocalDateTime.now())
						.newsUpdateDate(null)
						.build();

		return newsListMapper.insertNews(addNews);
	}

	@Transactional
	public int update(NewsList newsList, MultipartFile file) {
		// 아이디로 데이터를 가져옴
		NewsList oldNews = findById(newsList.getNewsId());

		String resourcePathname = null;
		if (!ObjectUtils.isEmpty(file)) {
			resourcePathname = fileUploadService.uploadFile(file);
		}

		NewsList updateNews = NewsList.builder()
				.newsId(newsList.getNewsId())
				.newsTitle(newsList.getNewsTitle())
				.newsSubTitle(newsList.getNewsSubTitle())
				.newsThumbImage(resourcePathname)
				.newsText(newsList.getNewsText())
				.newsWriteDate(oldNews.getNewsWriteDate())
				.newsUpdateDate(LocalDateTime.now())
				.build();

		return newsListMapper.updateNews(updateNews);
	}

	@Transactional
	public int deleteById(int newsId) {
		return newsListMapper.deleteNews(newsId);
	}
}

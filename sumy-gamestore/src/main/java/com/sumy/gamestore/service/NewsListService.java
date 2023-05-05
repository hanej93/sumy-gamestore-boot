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

	public int getCountForPaging(PagingVO vo) {
		return newsListMapper.countNewsList(vo);
	}

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

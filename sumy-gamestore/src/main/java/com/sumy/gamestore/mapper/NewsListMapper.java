package com.sumy.gamestore.mapper;

import com.sumy.gamestore.model.NewsList;
import com.sumy.gamestore.vo.PagingVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NewsListMapper {

	public int countNewsList(PagingVO vo);
	public List<NewsList> selectNewsList(PagingVO vo);

	public int insertNews(NewsList News);
	public NewsList selectOneByNewsId(int newsId);
	public int updateNews(NewsList News);
	public int deleteNews(int newsId);

}

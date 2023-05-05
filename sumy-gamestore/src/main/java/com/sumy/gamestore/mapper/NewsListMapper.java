package com.sumy.gamestore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sumy.gamestore.vo.PagingVO;
import com.sumy.gamestore.model.NewsList;

@Mapper
public interface NewsListMapper {

	public int countNewsList(PagingVO vo);
	public List<NewsList> selectNewsList(PagingVO vo);

	public int insertNews(NewsList News);
	public NewsList selectOneByNewsId(int newsId);
	public int updateNews(NewsList News);
	public int deleteNews(int newsId);

}

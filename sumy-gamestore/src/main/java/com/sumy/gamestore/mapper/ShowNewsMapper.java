package com.sumy.gamestore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sumy.gamestore.model.NewsList;
@Mapper
public interface ShowNewsMapper { //메인 페이지
	
	//뉴스 보여주기
	@Select("select news_id, news_title, news_sub_title, "
			+ "news_thumb_image, news_write_date, news_update_date "
			+ "from news_list order by news_id desc limit 3")
	public List<NewsList> selectNewsAll();
	
}


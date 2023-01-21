package com.sumy.gamestore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.model.NewsList;

@Mapper
public interface NewsListMapper {
	@Insert("insert into news_list values(#{newsId}, #{newsTitle}, #{newsSubTitle}, #{newsThumbImage},"
			+ "#{newsText}, #{newsWriteDate}, #{newsUpdateDate})")
	public int insertNews(NewsList News);

	@Select("select * from news_list where news_id = #{newsId}")
	public NewsList selectOneByNewsId(int newsId);
	
	@Update("update news_list set news_title = #{newsTitle}, news_sub_title = #{newsSubTitle}, news_thumb_image = #{newsThumbImage}, "
			+ "news_text = #{newsText}, news_write_date = #{newsWriteDate}, news_update_date = #{newsUpdateDate} "
			+ "where news_id = #{newsId}")
	public int updateNews(NewsList News);
	
	@Delete("delete from news_list where news_id = #{newsId}")
	public int deleteNews(int newsId);
	
	// ================================================
	
//	@Select("select count(*) from news_list")
	public int countNewsList(PagingVO vo);

//	@Select("select * from news_list order by news_id desc limit #{start}, #{cntPage}")
	public List<NewsList> selectNewsList(PagingVO vo);
	
}

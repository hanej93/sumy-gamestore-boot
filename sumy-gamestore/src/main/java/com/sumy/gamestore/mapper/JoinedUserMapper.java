package com.sumy.gamestore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.model.NewsList;
import com.sumy.gamestore.model.UserInfo;

@Mapper
public interface JoinedUserMapper {
	@Insert("insert into user_info values(#{userId}, #{userEmail}, #{userPassword}, #{userProvider}, #{userToken}, #{userNickname},"
			+ "#{userProfileImage}, #{userZipCode}, #{userAddress}, #{userDetailAddress}, #{userPhoneNumber}, #{userName}, #{userBirthDate}, #{userGender}, #{userJoinedDate}, #{userWarningCount}, #{userBlacklist}, #{userAuthorityRate}, #{userMemo})")
	public int insertUser(UserInfo userInfo);

	@Select("select * from news_list where news_id = #{newsId}")
	public NewsList selectOneByNewsId(int newsId);
	
	@Update("update set news_title = #{newsTitle}, news_sub_title = #{newsSubTitle}, news_thumb_image = #{newsThumbImage}, "
			+ "news_text = #{newsText}, news_write_date = #{newsWriteDate}, news_update_date = #{newsUpdateDate} "
			+ "from news_list where news_id = #{newsId}")
	public int updateNews(NewsList News);
	
	@Delete("delete from news_list where news_id = #{newsId}")
	public int deleteNews(int newsId);
	
	// ================================================
	
//	@Select("select count(*) from news_list")
	public int countNewsList(PagingVO vo);

//	@Select("select * from news_list order by news_id desc limit #{start}, #{cntPage}")
	public List<NewsList> selectNewsList(PagingVO vo);
	
}

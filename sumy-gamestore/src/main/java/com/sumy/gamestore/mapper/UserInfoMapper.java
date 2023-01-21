package com.sumy.gamestore.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sumy.gamestore.dto.PagingVO;
import com.sumy.gamestore.model.UserInfo;

@Mapper
public interface UserInfoMapper {
	
	@Select("select * from user_info where user_name = #{username}")
	public UserInfo findByUsername(String username);
	
	@Select("select * from user_info where user_email = #{userEmail}")
	public UserInfo findByUserEmail(String userEmail);
	
	@Select("select * from user_info where user_id = #{userId}")
	public UserInfo selectOneByUserId(int userId);
	
//	user_id
//	user_email
//	user_password
//	user_nickname
//	user_profile_image
//	user_zip_code
//	user_address
//	user_detail_address
//	user_phone_number
//	user_name
//	user_birth_date
//	user_gender
//	user_joined_date
//	user_warning_count
//	user_blacklist
//	user_authority_rate
//	user_memo
	
	@Update("update user_info set user_email =#{userEmail}, "
			+ "user_password =#{userPassword}, "
			+ "user_nickname =#{userNickname}, "
			+ "user_profile_image =#{userProfileImage}, "
			+ "user_zip_code =#{userZipCode}, "
			+ "user_address =#{userAddress}, "
			+ "user_detail_address =#{userDetailAddress}, "
			+ "user_phone_number =#{userPhoneNumber}, "
			+ "user_name =#{userName},"
			+ "user_birth_date =#{userBirthDate}, "
			+ "user_gender =#{userGender}, "
			+ "user_joined_date =#{userJoinedDate}, "
			+ "user_warning_count =#{userWarningCount}, "
			+ "user_blacklist =#{userBlacklist}, "
			+ "user_authority_rate =#{userAuthorityRate}, "
			+ "user_memo = #{userMemo} where user_id = #{userId}")
	public int updateUser(UserInfo userInfo);

	//리뷰리스트를 유저 아이디로 조회해서 해당 리뷰아이디를 List<> 로 받아옴
	@Select("select review_id from review_list where user_id = #{userId}")
	public List<Integer> reviewIdList(int userId);
	
	@Delete("delete from question_list where user_id = #{userId}")
	public int deleteQuestionList(int userId);
	
	@Delete("delete from report_list where report_from_user_id = #{userId}")
	public int deleteReportList(int userId);

	@Delete("delete from review_list where user_id = #{userId}")
	public int deleteReview(int userId);

	@Delete("delete from wishlist_game where user_id = #{userId}")
	public int deleteWishListGame(int userId);

	@Delete("delete from purchased_game_list where user_id = #{userId}")
	public int deletePurchasedGameList(int userId);

	@Delete("delete from user_info where user_id = #{userId}")
	public int deleteUser(int userId);
	
	// ================================================
	
//	@Select("select count(*) from user_info")
	public int countUserList(PagingVO vo);

//	@Select("select * from user_info order by user_id desc limit #{start}, #{cntPage}")
	public List<UserInfo> selectUserInfo(PagingVO vo);
}

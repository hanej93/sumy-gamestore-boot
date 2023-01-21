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
public interface UpdateUserMapper {

	// update user_info user_profile_image
	@Update("update user_info set user_profile_image = #{userProfileImage} where user_id = #{userId}")
	public int insertUserProfileImage(UserInfo userInfo);

	// update user_info user_nickname
	@Update("update user_info set user_nickname = #{userNickname} where user_id = #{userId}")
	public int insertUserNickname(UserInfo userInfo);

	// update user_info user_password
	@Update("update user_info set user_password = #{userPassword} where user_id = #{userId}")
	public int insertUserPassword(UserInfo userInfo);

	// update user_info user_zip_code, user_address, user_detail_address
	@Update("update user_info set user_zip_code = #{userZipCode}, user_address = #{userAddress}, user_detail_address = #{userDetailAddress} where user_id = #{userId}")
	public int insertUserAddress(UserInfo userInfo);

	// update user_info user_phone_number
	@Update("update user_info set user_phone_number = #{userPhoneNumber} where user_id = #{userId}")
	public int insertUserPhoneNumber(UserInfo userInfo);
	
	// update user_info user_pwdRecoveryUpdate
	@Update("update user_info set user_password = #{userPassword} where user_id = #{userId}")
	public int pwdRecoveryUpdate(UserInfo userInfo);
	
	// select user_info user_pwdRecoveryUpdate
	@Select("select user_id, user_email from user_info where user_email = #{userEmail}")
	public UserInfo selectUserEmail(UserInfo userInfo);



	

}

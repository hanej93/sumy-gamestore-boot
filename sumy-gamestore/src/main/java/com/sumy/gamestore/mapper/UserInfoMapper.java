package com.sumy.gamestore.mapper;

import com.sumy.gamestore.model.UserInfo;
import com.sumy.gamestore.vo.PagingVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserInfoMapper {
	
	public UserInfo findByUsername(String username);
	
	public UserInfo findByUserEmail(String userEmail);
	
	public UserInfo selectOneByUserId(int userId);
	public int updateUser(UserInfo userInfo);

	//리뷰리스트를 유저 아이디로 조회해서 해당 리뷰아이디를 List<> 로 받아옴
	public List<Integer> reviewIdList(int userId);
	public int deleteQuestionList(int userId);
	public int deleteReportList(int userId);
	public int deleteReview(int userId);
	public int deleteWishListGame(int userId);
	public int deletePurchasedGameList(int userId);
	public int deleteUser(int userId);
	
	public int countUserList(PagingVO vo);
	public List<UserInfo> selectUserInfo(PagingVO vo);
}

package com.sumy.gamestore.model;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data   // getter setter tostring 자동으로 만들어줌
@NoArgsConstructor  // 빈생성자 자동으로 만들어줌
@AllArgsConstructor // 모든필드포함한 생성자 자동으로 만들어줌
@Builder // 빌더패턴 자동으로 만들어줌
public class UserInfo {
	private int userId;
	private String userEmail;
	private String userPassword;
	private String userProvider;
	private String userToken;
	private String userNickname;
	private String userProfileImage;
	private String userZipCode;
	private String userAddress;
	private String userDetailAddress;
	private String userPhoneNumber;
	private String userName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate userBirthDate;
	private int userGender;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate userJoinedDate;
	private int userWarningCount;
	private int userBlacklist;
	private String userAuthorityRate;
	private String userMemo;

}

package com.sumy.gamestore.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ReviewUserDto {
	private int reviewId;
	private int gameId;
	private int userId;
	private String reviewText;
	private int reviewLikeCount;
	private int reviewReportCount;
	private int reviewStarRating;
	private LocalDateTime reviewWriteDate;
	private LocalDateTime reviewUpdateDate;
	
	private String userEmail;
	private String userPassword;
	private String userNickname;
	private String userProfileImage;
	private String userZipCode;
	private String userAddress;
	private String userDetailAddress;
	private String userPhoneNumber;
	private String userName;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate userBirthDate;
	private int userGender;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate userJoinedDate;
	private int userWarningCount;
	private int userBlacklist;
	private String userAuthorityRate;
	private String userMemo;
}

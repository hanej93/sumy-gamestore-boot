package com.sumy.gamestore.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QuestionUserDto {
	private int questionId;
	private int userId;
	private String questionTitle;
	private String questionText;
	private LocalDateTime questionWriteDate;
	private int questionAnswerYn;
	private int questionReadYn;
	private String questionImage1;
	private String questionImage2;
	private String questionImage3;
	private String userEmail;
	private String userPassword;
	private String userNickname;
	private String userProfileImage;
	private String userAddress;
	private String userPhoneNumber;
	private String userName;
	private LocalDate userBirthDate;
	private int userGender;
	private LocalDate userJoinedDate;
	private int userWarningCount;
	private int userBlacklist;
	private String userAuthorityRate;
	private String userMemo;
}

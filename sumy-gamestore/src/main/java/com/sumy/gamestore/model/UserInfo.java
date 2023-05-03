package com.sumy.gamestore.model;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
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

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
public class ReportReviewUserDto {
/*	
	1. 리포트 테이블
	1) 리포트 아이디
	2) 신고한 유저 아이디
	3) 리뷰 아이디
	4) 리포트 내용
	5) 리포트 날짜
	6) 리포트 읽음 유무

	2. 유저테이블(신고자)
	1) 이름
	2) 닉네임
	3) 이메일

	3. 리포트테이블->유저
	1) 이름
	2) 닉네임
	3) 이메일
	4) 경고
	5) 아이디

	4. 리뷰테이블
	1) 리뷰내용
	2) 신고당한 횟수
*/
	
	// 리포트 테이블
	private int reportId;
	private int reportFromUserId;
	private int reviewId;
	private String reportText;
	private LocalDateTime reportWriteDate;
	private int reportReadYn;
	private int reportFromUserName;
	
	// 유저 테이블 (신고자)
	private String fromUserName;
	private String fromUserNickname;
	private String fromUserEmail;
	
	// 유저 테이블 (신고 대상)
	private String toUserName;
	private String toUserNickname;
	private String toUserEmail;
	private int toUserWarningCount;
	private int toUserId;
	
	// 리뷰 테이블
	private String reviewText;
	private int reviewReportCount;
	
}

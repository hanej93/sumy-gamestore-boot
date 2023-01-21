package com.sumy.gamestore.model;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data //getter setter tostring 자동으로 만들어줌
@NoArgsConstructor //빈생성자 자동으로 만들어줌
@AllArgsConstructor //모든 필드 포함한 생성자 자동으로 만들어줌
@Builder //빌더패턴 자동으로 만들어줌
public class NewsList {
	private int newsId;
	private String newsTitle;
	private String newsSubTitle;
	private String newsThumbImage;
	private String newsText;
	private LocalDateTime newsWriteDate;
	private LocalDateTime newsUpdateDate;
}

package com.sumy.gamestore.model;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NewsList {

	private int newsId;
	private String newsTitle;
	private String newsSubTitle;
	private String newsThumbImage;
	private String newsText;
	private LocalDateTime newsWriteDate;
	private LocalDateTime newsUpdateDate;

}

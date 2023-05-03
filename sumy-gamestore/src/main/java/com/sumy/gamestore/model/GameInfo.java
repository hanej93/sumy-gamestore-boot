package com.sumy.gamestore.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class GameInfo {

	private int gameId;
	private String gameTitle;
	private String gameDev;
	private int gamePrice;
	private int gameDiscountRate;
	private String gameSubText;
	private String gameMainText;
	private String gameRate;
	private String gameThumbImage;
	private Integer gameCategoryId1;
	private Integer gameCategoryId2;
	private Integer gameCategoryId3;
	private Integer gameCategoryId4;
	private String gameIntroImage1;
	private String gameIntroImage2;
	private String gameIntroImage3;
	private String gameIntroImage4;
	private String gameIntroImage5;
	private LocalDateTime gameReleaseDate;
	private LocalDateTime gameUpdateDate;
	private int gameSaleCount;
	private Long gameTotalEarnings;

}

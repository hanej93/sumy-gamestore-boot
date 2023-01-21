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
public class ReviewList {
	private int reviewId;
	private int gameId;
	private int userId;
	private String reviewText;
	private int reviewLikeCount;
	private int reviewReportCount;
	private int reviewStarRating;
	private LocalDateTime reviewWriteDate;
	private LocalDateTime reviewUpdateDate;
	
	
}

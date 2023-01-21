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
public class ReportList {
	private int reportId;
	private int reportFromUserId;
	private int reviewId;
	private String reportText;
	private LocalDateTime reportWriteDate;
	private int reportReadYn;
	
}

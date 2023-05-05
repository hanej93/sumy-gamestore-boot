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
public class PurchasedGameList {

	private int purchasedGameId;
	private int gameId;
	private int userId;
	private LocalDateTime purchasedWriteDate;

}

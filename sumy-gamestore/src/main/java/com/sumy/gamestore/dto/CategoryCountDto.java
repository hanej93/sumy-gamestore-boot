package com.sumy.gamestore.dto;

import lombok.Data;

@Data
public class CategoryCountDto {
	private int categoryId;
	private String categoryName;
	private int categoryCount;
}

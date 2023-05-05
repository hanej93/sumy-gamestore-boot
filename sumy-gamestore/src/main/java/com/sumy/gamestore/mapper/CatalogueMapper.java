package com.sumy.gamestore.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sumy.gamestore.dto.CategoryCountDto;
import com.sumy.gamestore.vo.CataloguePagingAndFilterVO;
import com.sumy.gamestore.model.GameInfo;



@Mapper
public interface CatalogueMapper {
	
	// =============필터 관련 쿼리문=============
	// 전체 상품 개수 조회
	public int countGameListAll();
	// 할인 상품 개수 조회
	public int countGameListDiscount();
	// 카테고리별 개수 조회
	public List<CategoryCountDto> countCategoryListGroupById();
	// ================================================
	
	public int countGameList(CataloguePagingAndFilterVO vo);
	public List<GameInfo> selectGameList(CataloguePagingAndFilterVO vo);
	
	
}

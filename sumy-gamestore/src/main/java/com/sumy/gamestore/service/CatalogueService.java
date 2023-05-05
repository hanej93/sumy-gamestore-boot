package com.sumy.gamestore.service;

import com.sumy.gamestore.dto.CategoryCountDto;
import com.sumy.gamestore.mapper.CatalogueMapper;
import com.sumy.gamestore.model.GameInfo;
import com.sumy.gamestore.vo.CataloguePagingAndFilterVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class CatalogueService {

	private final CatalogueMapper catalogueMapper;
	
	public int getCountForPaging(CataloguePagingAndFilterVO vo) {
		return catalogueMapper.countGameList(vo);
	}
	
	public List<GameInfo> findList(CataloguePagingAndFilterVO vo){
		return catalogueMapper.selectGameList(vo);
	}


	/**
	 * 필터 관련
 	 */
	// 전체 상품 개수 조회
	public int getTotalGameListCount() {
		return catalogueMapper.countGameListAll();
	}
	
	// 할인 상품 개수 조회
	public int getDiscountGameListCount() {
		return catalogueMapper.countGameListDiscount();
	}
	
	// 카테고리별 개수 조회
	public List<CategoryCountDto> findCategoryListWithCount(){
		return catalogueMapper.countCategoryListGroupById();
	}
	
}

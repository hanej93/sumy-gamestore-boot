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
	
	// 총 게임 갯수 조회
	public int 게임총개수(CataloguePagingAndFilterVO vo) {
		return catalogueMapper.countGameList(vo);
	}
	
	// 한 페이지 게임 리스트 조회
	public List<GameInfo> 한페이지게임리스트(CataloguePagingAndFilterVO vo){
		return catalogueMapper.selectGameList(vo);
	}


	/**
	 * 필터 관련
 	 */
	// 전체 상품 개수 조회
	public int 전체상품개수조회() {
		return catalogueMapper.countGameListAll();
	}
	
	// 할인 상품 개수 조회
	public int 할인상품개수조회() {
		return catalogueMapper.countGameListDiscount();
	}
	
	// 카테고리별 개수 조회
	public List<CategoryCountDto> 카테고리별개수조회(){
		return catalogueMapper.countCategoryListGroupById();
	}
	
}

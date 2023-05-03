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
	@Select("select count(*) from game_info")
	public int countGameListAll();
	// 할인 상품 개수 조회
	@Select("select count(*) from game_info where game_discount_rate > 0")
	public int countGameListDiscount();
	
	// 카테고리별 개수 조회
	@Select("select category_id, category_name, count(*) as category_count"
			+ " from game_info g"
			+ " join category_list c"
			+ " on g.game_category_id1 = c.category_id"
			+ " or g.game_category_id2 = c.category_id"
			+ " or g.game_category_id3 = c.category_id"
			+ " or g.game_category_id4 = c.category_id"
			+ " group by category_id")
	public List<CategoryCountDto> countCategoryListGroupById();
	
	// ================================================
	
	public int countGameList(CataloguePagingAndFilterVO vo);

	public List<GameInfo> selectGameList(CataloguePagingAndFilterVO vo);
	
	
}

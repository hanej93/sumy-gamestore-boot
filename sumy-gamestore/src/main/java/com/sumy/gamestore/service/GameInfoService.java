package com.sumy.gamestore.service;

import com.sumy.gamestore.dto.CategoryCountDto;
import com.sumy.gamestore.mapper.GameInfoMapper;
import com.sumy.gamestore.model.GameInfo;
import com.sumy.gamestore.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Transactional(readOnly = true)
@RequiredArgsConstructor
@Service
public class GameInfoService {

	private final GameInfoMapper gameInfoMapper;
	private final FileUploadService fileUploadService;

	// 총 게임 갯수 조회
	public int getTotalCount(PagingVO vo) {
		return gameInfoMapper.countGameList(vo);
	}
	
	// 한 페이지 게임 리스트 조회
	public List<GameInfo> findList(PagingVO vo){
		return gameInfoMapper.selectGameList(vo);
	}
	
	public GameInfo findById(int gameId) {
		GameInfo gameInfo = gameInfoMapper.selectOneByGameId(gameId);
		return gameInfo;
	}

	@Transactional
	public int save(GameInfo gameInfo, MultipartFile file, List<MultipartFile> files) {
		// 게임 썸네일 이미지 업로드
		String resourcePathname = null;
		if (!ObjectUtils.isEmpty(file)) {
			resourcePathname = fileUploadService.uploadFile(file);
		}

		// 게임 미리보기 이미지 업로드
		List<String> previewImgList = new ArrayList<String>(5);
		for (int i = 0; i < 5; i++) {
			previewImgList.add(null);
		}
		if (!ObjectUtils.isEmpty(files)) {
			int index = 0;
			for (MultipartFile previewFile : files) {
				String previewImgResourcePathname = fileUploadService.uploadFile(previewFile);
				previewImgList.set(index++, previewImgResourcePathname);
			}
		}

		GameInfo addGame =
				GameInfo.builder()
						.gameId(0)
						.gameTitle(gameInfo.getGameTitle())
						.gameDev(gameInfo.getGameDev())
						.gamePrice(gameInfo.getGamePrice())
						.gameDiscountRate(gameInfo.getGameDiscountRate())
						.gameSubText(gameInfo.getGameSubText())
						.gameMainText(gameInfo.getGameMainText())
						.gameRate(gameInfo.getGameRate())
						.gameThumbImage(resourcePathname)
						.gameCategoryId1(gameInfo.getGameCategoryId1())
						.gameCategoryId2(gameInfo.getGameCategoryId2())
						.gameCategoryId3(gameInfo.getGameCategoryId3())
						.gameCategoryId4(gameInfo.getGameCategoryId4())
						.gameIntroImage1(previewImgList.get(0))
						.gameIntroImage2(previewImgList.get(1))
						.gameIntroImage3(previewImgList.get(2))
						.gameIntroImage4(previewImgList.get(3))
						.gameIntroImage5(previewImgList.get(4))
						.gameReleaseDate(LocalDateTime.now())
						.gameUpdateDate(null)
						.gameSaleCount(0)
						.gameTotalEarnings(0L)
						.build();

		return gameInfoMapper.insertGame(addGame);
	}

	@Transactional
	public int update(GameInfo gameInfo, MultipartFile file, List<MultipartFile> files) {
		// 아이디로 데이터를 가져옴
		GameInfo oldGame = findById(gameInfo.getGameId());

		// 게임 썸네일 이미지 업로드
		String resourcePathname = null;
		if (!ObjectUtils.isEmpty(file)) {
			resourcePathname = fileUploadService.uploadFile(file);
		}

		// 게임 미리보기 이미지 업로드
		List<String> previewImgList = new ArrayList<String>(5);
		for (int i = 0; i < 5; i++) {
			previewImgList.add(null);
		}
		if (!ObjectUtils.isEmpty(files)) {
			int index = 0;
			for (MultipartFile previewFile : files) {
				String previewImgResourcePathname = fileUploadService.uploadFile(previewFile);
				previewImgList.set(index++, previewImgResourcePathname);
			}
		}

		GameInfo updateGame =
				GameInfo.builder()
						.gameId(gameInfo.getGameId())
						.gameTitle(gameInfo.getGameTitle())
						.gameDev(gameInfo.getGameDev())
						.gamePrice(gameInfo.getGamePrice())
						.gameDiscountRate(gameInfo.getGameDiscountRate())
						.gameSubText(gameInfo.getGameSubText())
						.gameMainText(gameInfo.getGameMainText())
						.gameRate(gameInfo.getGameRate())
						.gameThumbImage(resourcePathname)
						.gameCategoryId1(gameInfo.getGameCategoryId1())
						.gameCategoryId2(gameInfo.getGameCategoryId2())
						.gameCategoryId3(gameInfo.getGameCategoryId3())
						.gameCategoryId4(gameInfo.getGameCategoryId4())
						.gameIntroImage1(previewImgList.get(0))
						.gameIntroImage2(previewImgList.get(1))
						.gameIntroImage3(previewImgList.get(2))
						.gameIntroImage4(previewImgList.get(3))
						.gameIntroImage5(previewImgList.get(4))
						.gameReleaseDate(oldGame.getGameReleaseDate())
						.gameUpdateDate(LocalDateTime.now())
						.gameSaleCount(oldGame.getGameSaleCount())
						.gameTotalEarnings(oldGame.getGameTotalEarnings())
						.build();

		return gameInfoMapper.updateGame(updateGame);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int deleteById(int gameId) {
		// 1. 리뷰리스트를 게임 아이디로 조회해서 해당 리뷰아이디를 List<> 로 받아옴
		// List<Integer> deleteReviewIdList = 1번의 결과;
		List<Integer> deleteReviewIdList = gameInfoMapper.reviewIdList(gameId);
		
		// 2. 받아온 리스트에 해당 되는 리뷰 아이디를 반복해서 제거
		for(int reviewId : deleteReviewIdList){
			gameInfoMapper.deleteReportList(reviewId);
		}
		
		// -> 리포트 삭제 완료! -> 리포트 삭제가 되었으니 리뷰삭제가능하겠죠??
		gameInfoMapper.deleteReview(gameId);
		gameInfoMapper.deleteWishListGame(gameId);
		gameInfoMapper.deletePurchasedGameList(gameId);
		
		return gameInfoMapper.deleteGame(gameId);
	}
	
	public List<String> getCategoryNamesByGameId(int gameId){
		return gameInfoMapper.selectCategoryNameByCategoryId(gameId);
	}

	public List<GameInfo> selectRelativeGamesByCategoryId(int categoryId) {
		return gameInfoMapper.selectRelatedGameInfo(categoryId);
	}
	
	public List<CategoryCountDto> findAllCategoriesWithCount(){
		return gameInfoMapper.countCategoryListGroupById();
	}
}

package com.sumy.gamestore.controller.admin.api;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sumy.gamestore.dto.ResponseDto;
import com.sumy.gamestore.model.GameInfo;
import com.sumy.gamestore.model.PurchasedGameList;
import com.sumy.gamestore.model.ReviewList;
import com.sumy.gamestore.model.WishlistGame;
import com.sumy.gamestore.service.GameInfoService;
import com.sumy.gamestore.service.ReviewListService;

@RestController
public class GameInfoApiController {

	@Autowired
	private GameInfoService gameInfoService;

	@Autowired
	private ReviewListService reviewListService;
	
	@PostMapping("/admin/game/add")
	public ResponseDto<Integer> addGame(@RequestPart(value = "gameInfo") GameInfo gameInfo
			, @RequestPart(value = "file", required = false) MultipartFile file
			, @RequestPart(value = "files", required = false) List<MultipartFile> files) {
		System.out.println("===========================================");
//		System.out.println("썸머노트!!!");
//		System.out.println(gameInfo.getGameMainText());
		
		
		System.out.println("===========================================");
		System.out.println(file.getOriginalFilename());
		System.out.println("-------------------------------------------");
		for (MultipartFile multipartFile : files) {
			System.out.println(multipartFile.getOriginalFilename());
		}
		System.out.println("===========================================");
		
		// 파일 있는지 확인
		if (file == null || file.isEmpty()) {
			System.out.println("파일이 없음");
		}
		
		// 현재 날짜 조회 - ex) 2021-07-07
		String currentDate = LocalDate.now().toString();
		// 파일 저장 경로 (현재 날짜를 포함) - ex) C:/upload/2021-07-07/
		String uploadFilePath = "C:\\upload\\" + currentDate + "/";

		// 파일 확장자 ex) jpg, png ..
		String prefix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1,
				file.getOriginalFilename().length());

		// 랜덤아이디로 파일명 생성
		String filename = UUID.randomUUID().toString() + "." + prefix;

		// 폴더가 없다면 생성
		File folder = new File(uploadFilePath);
		if (!folder.isDirectory()) {
			folder.mkdirs();
		}

		// 실제 저장되는 위치
		String pathname = uploadFilePath + filename;
		// 가상 가상 파일 위치 - ex) /upload/2021-07-07/파일명.jpg
		String resourcePathname = "/upload/" + currentDate + "/" + filename;
		File dest = new File(pathname);
		try {
			file.transferTo(dest);

		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// ---------------------------------------------------------
		// 게임 미리보기 이미지 업로드
		List<String> previewImgList = new ArrayList<String>(5);
		for (int i = 0; i < 5; i++) {
			previewImgList.add(null);
		}
		int index = 0;
		for (MultipartFile previewImg : files) {
			System.out.println("단일파일(리스트)" + previewImg.getOriginalFilename());

			String previewImgPrefix = previewImg.getOriginalFilename().substring(
					previewImg.getOriginalFilename().lastIndexOf(".") + 1, previewImg.getOriginalFilename().length());
			String previewImgName = UUID.randomUUID().toString() + "." + previewImgPrefix;

			// 실제 저장되는 위치
			String previewImgPathname = uploadFilePath + previewImgName;
			// 가상 가상 파일 위치 - ex) /upload/2021-07-07/파일명.jpg
			String previewImgResourcePathname = "/upload/" + currentDate + "/" + previewImgName;

			File previewImgDest = new File(previewImgPathname);

			try {
				previewImg.transferTo(previewImgDest);
				//previewImgList.add(previewImgResourcePathname);
				previewImgList.set(index++, previewImgResourcePathname);
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("------------------------------------");
		System.out.println(previewImgList.get(0));
		System.out.println(previewImgList.get(1));
		System.out.println(previewImgList.get(2));
		System.out.println(previewImgList.get(3));
		System.out.println("------------------------------------");
		
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
		
		gameInfoService.게임추가(addGame);
		 

		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PutMapping("/admin/game/update")
	public ResponseDto<Integer> updateGame(@RequestPart(value = "gameInfo") GameInfo gameInfo
			, @RequestPart(value = "file", required = false) MultipartFile file
			, @RequestPart(value = "files", required = false) List<MultipartFile> files) {
		
		// 아이디로 데이터를 가져옴
		GameInfo oldGame = gameInfoService.게임검색(gameInfo.getGameId());
		// 수정할 것들만 반영해서 수정
		
		
		System.out.println("===========================================");
//		System.out.println("썸머노트!!!");
//		System.out.println(gameInfo.getGameMainText());
		
		
		System.out.println("===========================================");
		System.out.println(file.getOriginalFilename());
		System.out.println("-------------------------------------------");
		for (MultipartFile multipartFile : files) {
			System.out.println(multipartFile.getOriginalFilename());
		}
		System.out.println("===========================================");
		
		// 파일 있는지 확인
		if (file == null || file.isEmpty()) {
			System.out.println("파일이 없음");
		}

		// 현재 날짜 조회 - ex) 2021-07-07
		String currentDate = LocalDate.now().toString();
		// 파일 저장 경로 (현재 날짜를 포함) - ex) C:/upload/2021-07-07/
		String uploadFilePath = "C:\\upload\\" + currentDate + "/";

		// 파일 확장자 ex) jpg, png ..
		String prefix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1,
				file.getOriginalFilename().length());

		// 랜덤아이디로 파일명 생성
		String filename = UUID.randomUUID().toString() + "." + prefix;

		// 폴더가 없다면 생성
		File folder = new File(uploadFilePath);
		if (!folder.isDirectory()) {
			folder.mkdirs();
		}

		// 실제 저장되는 위치
		String pathname = uploadFilePath + filename;
		// 가상 가상 파일 위치 - ex) /upload/2021-07-07/파일명.jpg
		String resourcePathname = "/upload/" + currentDate + "/" + filename;
		File dest = new File(pathname);
		try {
			file.transferTo(dest);

		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// ---------------------------------------------------------
		// 게임 미리보기 이미지 업로드
		List<String> previewImgList = new ArrayList<String>(5);
		for (int i = 0; i < 5; i++) {
			previewImgList.add(null);
		}
		int index = 0;
		for (MultipartFile previewImg : files) {
			System.out.println("단일파일(리스트)" + previewImg.getOriginalFilename());

			String previewImgPrefix = previewImg.getOriginalFilename().substring(
					previewImg.getOriginalFilename().lastIndexOf(".") + 1, previewImg.getOriginalFilename().length());
			String previewImgName = UUID.randomUUID().toString() + "." + previewImgPrefix;

			// 실제 저장되는 위치
			String previewImgPathname = uploadFilePath + previewImgName;
			// 가상 가상 파일 위치 - ex) /upload/2021-07-07/파일명.jpg
			String previewImgResourcePathname = "/upload/" + currentDate + "/" + previewImgName;

			File previewImgDest = new File(previewImgPathname);

			try {
				previewImg.transferTo(previewImgDest);
				//previewImgList.add(previewImgResourcePathname);
				previewImgList.set(index++, previewImgResourcePathname);
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("------------------------------------");
		System.out.println(previewImgList.get(0));
		System.out.println(previewImgList.get(1));
		System.out.println(previewImgList.get(2));
		System.out.println(previewImgList.get(3));
		System.out.println("------------------------------------");
		
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
		
		gameInfoService.게임수정(updateGame);
		 

		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/admin/game/list")
	public ResponseDto<Integer> deleteGame(@RequestBody GameInfo gameInfo, ReviewList reviewList,
		WishlistGame wishlistGame, PurchasedGameList purchasedGameList) {
		
		System.out.println(gameInfo.getGameId());
		gameInfoService.게임삭제(gameInfo.getGameId());

		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
}

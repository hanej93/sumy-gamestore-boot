package com.sumy.gamestore.controller.admin.api;

import com.sumy.gamestore.dto.ResponseDto;
import com.sumy.gamestore.model.GameInfo;
import com.sumy.gamestore.service.GameInfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@RestController
@RequiredArgsConstructor
public class GameInfoApiController {

	private final GameInfoService gameInfoService;

	@PostMapping("/admin/game/add")
	public ResponseDto<Integer> addGame(@RequestPart(value = "gameInfo") GameInfo gameInfo
			, @RequestPart(value = "file", required = false) MultipartFile file
			, @RequestPart(value = "files", required = false) List<MultipartFile> files) {

		gameInfoService.save(gameInfo, file, files);

		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PutMapping("/admin/game/update")
	public ResponseDto<Integer> updateGame(@RequestPart(value = "gameInfo") GameInfo gameInfo
			, @RequestPart(value = "file", required = false) MultipartFile file
			, @RequestPart(value = "files", required = false) List<MultipartFile> files) {

		gameInfoService.update(gameInfo, file, files);

		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/admin/game/list")
	public ResponseDto<Integer> deleteGame(@RequestBody GameInfo gameInfo) {
		
		gameInfoService.deleteById(gameInfo.getGameId());

		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
}

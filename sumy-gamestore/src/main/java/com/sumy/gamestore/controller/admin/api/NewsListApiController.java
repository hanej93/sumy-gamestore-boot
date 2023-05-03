package com.sumy.gamestore.controller.admin.api;

import com.sumy.gamestore.dto.ResponseDto;
import com.sumy.gamestore.model.NewsList;
import com.sumy.gamestore.service.NewsListService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@RequiredArgsConstructor
@RestController
public class NewsListApiController {

	private final NewsListService newsListService;

	@PostMapping("/admin/news/add")
	public ResponseDto<Integer> addNews(
			@RequestPart(value = "newsList")NewsList newsList,
			@RequestPart(value = "file") MultipartFile file) {


		newsListService.save(newsList, file);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PutMapping("/admin/news/update")
	public ResponseDto<Integer> updateNews(
			@RequestPart(value = "newsList")NewsList newsList,
			@RequestPart(value = "file") MultipartFile file) {

		newsListService.update(newsList, file);
		
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@DeleteMapping("/admin/news/list")
	public ResponseDto<Integer> deleteNews(@RequestBody NewsList newsList) {
		newsListService.deleteById(newsList.getNewsId());
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
}

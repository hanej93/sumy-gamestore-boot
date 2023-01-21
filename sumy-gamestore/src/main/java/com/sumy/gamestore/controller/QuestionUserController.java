package com.sumy.gamestore.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sumy.gamestore.model.QuestionList;
import com.sumy.gamestore.service.QuestionUserService;

@Controller
public class QuestionUserController {

	@Autowired
	QuestionUserService questionUserService;

	// 메인 페이지
	@ResponseBody
	@PostMapping("/user/questionModal")
	public String test1(QuestionList questionList) {
		System.out.println("문의하기 데이터 : " + questionList);
		int row = questionUserService.questionInsert(questionList);
		return "문의하기 성공";
		// 문의 하기 설정
	}

	// 문의하기 이미지 등록
	@ResponseBody
	@PostMapping("/user/questionImgAdd")
	public String test17(@RequestPart(value = "file", required = false) MultipartFile file) {
		System.out.println("문의하기 이미지 등록 시작 : "+file.getOriginalFilename());

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
		return resourcePathname;
	}

}

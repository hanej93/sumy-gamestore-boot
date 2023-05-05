package com.sumy.gamestore.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {

	@Transactional
	public String uploadFile(MultipartFile file) {
		// 현재 날짜 조회 - ex) 2021-07-07
		String currentDate = LocalDate.now().toString();
		// 파일 저장 경로 (현재 날짜를 포함) - ex) C:/upload/2021-07-07/
		String uploadFilePath = "C:/upload/" + currentDate + "/";

		// 파일 확장자 ex) jpg, png ..
		String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1,
				file.getOriginalFilename().length());

		// 랜덤아이디로 파일명 생성
		String filename = UUID.randomUUID().toString() + "." + extension;

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
			e.printStackTrace();
			throw new RuntimeException("파일 업로드 중 에러");
		}
		return resourcePathname;
	}
	
}

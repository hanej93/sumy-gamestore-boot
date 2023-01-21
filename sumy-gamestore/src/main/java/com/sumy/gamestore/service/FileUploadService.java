package com.sumy.gamestore.service;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {
	
	public boolean saveUploadedFile(MultipartFile uploadFile) {
		// 파일을 저장하기 위해 file자료형을 사용한다.
		
		// 업로드할 폴더
		String uploadFolder = "C:/uploadfile/images";
		
		File dir = new File(uploadFolder);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		File file = new File(uploadFolder, uploadFile.getOriginalFilename());
		
		// 실제 위치에 파일을 저장
		try {
			uploadFile.transferTo(file);
			return true;
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}

package com.sumy.gamestore.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UploadFile {
	
	private String pathname;
	private String filename;
	private String originalFilename;
	private int size;
	private String contentType;
	private String resourcePathname;
}

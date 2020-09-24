package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File originFile) {
		
		//원본파일명
		String originName = originFile.getName();
		
		//수정된파일명 : 파일업로드한시간(년월일시분초) + 5자리랜덤값(10000~99999) + 기존확장자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String currentTime = sdf.format(new Date());
		
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		int dot = originName.lastIndexOf(".");
		String ext = originName.substring(dot);
		
		String fileName = currentTime + ranNum + ext;
		
		File renameFile = new File(originFile.getParent(), fileName);
		
		return renameFile;
	}

	
	
}

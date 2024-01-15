package com.smhrd.bicycle.converter;

import java.io.File;
import java.io.IOException;
import java.util.Base64;

import org.apache.commons.io.FileUtils;

public class ImageToBase64 {
	
public String convert(File f) {
		
		//1. 파일을 읽어오기 => 바이트 배열 형태로 읽어오기
		
		byte[] fileByteArray = null;
		
		try {
			fileByteArray = FileUtils.readFileToByteArray(f);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String encodeResult = Base64.getEncoder().encodeToString(fileByteArray);
		
		return encodeResult;
	}

}

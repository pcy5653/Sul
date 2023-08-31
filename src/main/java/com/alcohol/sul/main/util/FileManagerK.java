package com.alcohol.sul.main.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.alcohol.sul.main.product.review.ReviewFileDTO;


@Component
public class FileManagerK {
	
	//fileDelete
	public boolean fileDelete(ImgFileDTO fileDTO, String path, HttpSession session) throws Exception {
		//1. 삭제할 폴더의 실제 경로
		path = session.getServletContext().getRealPath(path);
		
		File file = new File(path, fileDTO.getImgName());
		
		return file.delete();
	}
	
	public boolean reviewFileDelete(ReviewFileDTO fileDTO, String path, HttpSession session) throws Exception {
		//1. 삭제할 폴더의 실제 경로
		path = session.getServletContext().getRealPath(path);
		
		File file = new File(path, fileDTO.getFileName());
		
		return file.delete();
	}
	
	//fileSave
	public String fileSave(String path, MultipartFile multipartFile, HttpSession session) throws Exception {
		//파일의 정보를 이용해서 HDD에 파일을 저장
		
		//1. 어디에 저장할 것인가?
		//String path = "/resources/upload/member/";
				
		//2. 실제 경로 알아보기
		//jsp -> application, java -> ServletContext
		String realPath = session.getServletContext().getRealPath(path);
		System.out.println(realPath);
				
		File file = new File(realPath);
		if(!file.exists()) {
				file.mkdirs();
			}
				
		//3. 어떤이름으로 저장할 것인가.?
		//1) 시간을이용
//		Calendar ca = Calendar.getInstance();
//		long result = ca.getTimeInMillis();
//		file = new File(file, result + "_" + multipartFile.getOriginalFilename());
				
		//2) API사용
		String uId = UUID.randomUUID().toString();
		uId = uId + "_" + multipartFile.getOriginalFilename();
		System.out.println(uId);
		file = new File(file, uId);
				
		//4. 파일을 저장하는 단계
		//A. Spring에서 제공하는 API FileCopyUtils copy메서드
		//FileCopyUtils.copy(multipartFile.getBytes(), file);
				
		//B. MultipartFile의 transferTo메서드
		multipartFile.transferTo(file);	
		
		return uId;
		
	}
	
}

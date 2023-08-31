package com.alcohol.sul.util;

import java.io.File;

import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.AbstractView;

import com.alcohol.sul.main.product.review.ReviewFileDTO;

@Component

public class FileManager extends AbstractView{
	
	
	
	// fileSave
	public String fileSave(String path, HttpSession session, MultipartFile multipartFile)throws Exception{
		// 1. 저장 위치 (String path)
		
		// 2. 실제 경로
		String realPath = session.getServletContext().getRealPath(path);
		System.out.println(realPath);
		
		// 3. 실제 경로 file 생성(경로가 없다면 파일을 생성)
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		// 4. 중복되지 않는 file 이름 설정 (return 할 값)
		String uId = UUID.randomUUID().toString();
		uId = uId+"_"+multipartFile.getOriginalFilename();
		file = new File(file, uId);
		
		// 5. file Save
		multipartFile.transferTo(file);
		
		return uId;
	}
	
	
	
	// fileDelete
	public boolean fileDelete (FileDTO fileDTO, String path, HttpSession session)throws Exception{
		// 1. 삭제할 파일 경로
		path = session.getServletContext().getRealPath(path);
		
		// 2. file에 경로와 fileName 넣기
		File file = new File(path, fileDTO.getFileName());
		
		// 3. file Delete [true | false]
		return file.delete();
	}

	
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	public boolean reviewFileDelete(ReviewFileDTO fileDTO, String path, HttpSession session) throws Exception {
		//1. 삭제할 폴더의 실제 경로
		path = session.getServletContext().getRealPath(path);
		
		File file = new File(path, fileDTO.getFileName());
		
		return file.delete();
	}

}

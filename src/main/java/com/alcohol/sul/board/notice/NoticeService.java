package com.alcohol.sul.board.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


import com.alcohol.sul.util.FileManager;
import com.alcohol.sul.util.Pager;
import com.alcohol.sul.util.FileDTO;
import com.alcohol.sul.board.notice.NoticeFileDTO;

@Service
public class NoticeService{
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManager fileManager;
	
	public boolean setContentsImgDelete(String path, HttpSession session)throws Exception{
		//path: /resources/upload/notice/파일명
		FileDTO fileDTO = new FileDTO();
		System.out.println(path.substring(path.lastIndexOf("/")+1));
		fileDTO.setFileName(path.substring(path.lastIndexOf("/")+1));
		
		//path = path.substring(0, path.lastIndexOf("\\")+1);
		path= "/resources/upload/notice/";
		return fileManager.fileDelete(fileDTO, path, session);
	}
	
	public String setContentsImg(MultipartFile file, HttpSession session) throws Exception {
		String path="/resources/upload/notice/";
		String fileName = fileManager.fileSave(path, session, file);
		return path+fileName;
	}
	
	//List
	
	public List<NoticeDTO> getList(Pager pager) throws Exception {
		pager.makeRowNum();
		pager.makePageNum(noticeDAO.getTotal(pager));
		return noticeDAO.getList(pager);
	}

	//Detail
	
	public NoticeDTO getDetail(NoticeDTO noticeDTO) throws Exception {
		
		return noticeDAO.getDetail(noticeDTO);
	}
	
	//Add
	
	public int setAdd(NoticeDTO noticeDTO, MultipartFile[] files, HttpSession session) throws Exception {
		String path="/resources/upload/notice/";
		
		int result = noticeDAO.setAdd(noticeDTO);
		
		for(MultipartFile file:files) {
			if(!file.isEmpty()) {
				String fileName=fileManager.fileSave(path, session, file);
				
				NoticeFileDTO noticeFileDTO = new NoticeFileDTO();
				noticeFileDTO.setNoticeNum(noticeDTO.getNoticeNum());
				noticeFileDTO.setFileName(fileName);
				noticeFileDTO.setOriginalName(file.getOriginalFilename());
				result=noticeDAO.setFileAdd(noticeFileDTO);
			}
		}
		
		
		return result;
	}

	//Update
	
	
	public int setUpdate(NoticeDTO noticeDTO, MultipartFile[] files, HttpSession session) throws Exception {

		return noticeDAO.setUpdate(noticeDTO);
	}

	public int setHitCount(NoticeDTO noticeDTO)throws Exception{
		return noticeDAO.setHitUpdate(noticeDTO);
	}
	
	//Delete
	
	public int setDelete(NoticeDTO noticeDTO) throws Exception {

		return noticeDAO.setDelete(noticeDTO);
	}
	
}

package com.alcohol.sul.board.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alcohol.sul.board.BoardDTO;
import com.alcohol.sul.board.BoardService;
import com.alcohol.sul.util.FileManager;
import com.alcohol.sul.util.Pager;
import com.alcohol.sul.board.notice.NoticeFileDTO;

@Service
public class NoticeService implements BoardService{
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManager fileManager;
	
	
	//List
	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		pager.makeRowNum();
		pager.makePageNum(noticeDAO.getTotal(pager));
		return noticeDAO.getList(pager);
	}

	//Detail
	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		
		return noticeDAO.getDetail(boardDTO);
	}
	
	//Add
	@Override
	public int setAdd(BoardDTO boardDTO, MultipartFile[] files, HttpSession session) throws Exception {
		String path="/resources/upload/notice/";
		
		int result = noticeDAO.setAdd(boardDTO);
		
		for(MultipartFile file:files) {
			if(!file.isEmpty()) {
				String fileName=fileManager.fileSave(path, file, session);
				
				NoticeFileDTO noticeFileDTO = new NoticeFileDTO();
				noticeFileDTO.setNoticeNum(boardDTO.getNum());
				noticeFileDTO.setFileName(fileName);
				noticeFileDTO.setOriginalName(file.getOriginalFilename());
				result=noticeDAO.setFileAdd(noticeFileDTO);
			}
		}
		
		
		return result;
	}

	//Update
	
	@Override
	public int setUpdate(BoardDTO boardDTO, MultipartFile[] photos, HttpSession session) throws Exception {
		int result = noticeDAO.setUpdate(boardDTO);
		String path="/resources/upload/notice/";
		for(MultipartFile file:photos) {
			if(!file.isEmpty()) {
				String fileName = fileManager.fileSave(path, file, session);
				
				NoticeFileDTO noticeFileDTO = new NoticeFileDTO();
				noticeFileDTO.setNoticeNum(boardDTO.getNum());
				noticeFileDTO.setFileName(fileName);
				noticeFileDTO.setOriginalName(file.getOriginalFilename());
				result=noticeDAO.setFileAdd(noticeFileDTO);
			}
		}
		return result;
	}

	//Delete
	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		
		return noticeDAO.setDelete(boardDTO);
	}
	
	//File Delete
		public int setFileDelete(NoticeFileDTO noticeFileDTO, HttpSession session)throws Exception{
			noticeFileDTO = noticeDAO.getFileDetail(noticeFileDTO);
			boolean flag = fileManager.fileDelete(noticeFileDTO, "/resources/upload/notice/", session);
			
			if(flag) {
				return noticeDAO.setFileDelete(noticeFileDTO);
			}
			
			return 0;
		}

}

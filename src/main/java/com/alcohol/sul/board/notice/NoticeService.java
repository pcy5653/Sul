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

@Service
public class NoticeService implements BoardService{
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	//List
	@Override
	public List<BoardDTO> getList() throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		return noticeDAO.getList();
	}

	//Detail
	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		
		return noticeDAO.getDetail(boardDTO);
	}
	
	//Add
	@Override
	public int setAdd(BoardDTO boardDTO, MultipartFile[] photos, HttpSession session) throws Exception {
		
		int result = noticeDAO.setAdd(boardDTO);
		
		return result;
	}

	@Override
	public int setUpdate(BoardDTO boardDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = noticeDAO.setUpdate(boardDTO);
		
		return result;
	}

	//Delete
	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		
		return noticeDAO.setDelete(boardDTO);
	}
	
	

}

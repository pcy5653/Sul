package com.alcohol.sul.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface BoardService {

	//list
	public List<BoardDTO> getList(BoardDTO boardDTO)throws Exception;
	
	//detail
	public BoardDTO getDetail(BoardDTO boardDTO)throws Exception;
	
	//add
	public int setAdd(BoardDTO boardDTO, MultipartFile[] files, HttpSession session)throws Exception;

	//update
	public int setUpdate(BoardDTO boardDTO, MultipartFile [] files, HttpSession session)throws Exception;
	
	//delete
	public int setDelete(BoardDTO boardDTO)throws Exception;
	// , HttpSession session
}

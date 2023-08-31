package com.alcohol.sul.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.alcohol.sul.board.qna.QnaDTO;
import com.alcohol.sul.board.qna.QnaFileDTO;
import com.alcohol.sul.member.MemberDTO;
import com.alcohol.sul.board.qna.QnaFileDTO;
import com.alcohol.sul.util.Pager;

public interface BoardService {

	//list
	public List<BoardDTO> getList(Pager pager, QnaDTO qnaDTO)throws Exception;
	
	//detail
	public BoardDTO getDetail(BoardDTO boardDTO)throws Exception;
	
	//add
	public int setAdd(BoardDTO boardDTO, MultipartFile[] files, HttpSession session)throws Exception;

	//update
	public int setUpdate(BoardDTO boardDTO, MultipartFile [] files, HttpSession session)throws Exception;
	
	//delete
	public int setDelete(BoardDTO boardDTO, HttpSession session)throws Exception;

	
	
	// 관리자 List
	public List<BoardDTO> getManagerList(Pager pager)throws Exception;
}

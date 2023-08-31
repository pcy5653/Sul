package com.alcohol.sul.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.alcohol.sul.board.qna.QnaDTO;
import com.alcohol.sul.util.Pager;

public interface BoardDAO {

	//List
	public List<BoardDTO> getList(Map<String, Object> map)throws Exception;
	
	//Detail
	public BoardDTO getDetail(BoardDTO boardDTO)throws Exception;
	
	//Add
	public int setAdd(BoardDTO boardDTO)throws Exception;
	
	//Update
	public int setUpdate(BoardDTO boardDTO)throws Exception;
	
	//Delete
	public int setDelete(BoardDTO boardDTO)throws Exception;
	
	//totalCount
	public Long getTotal(Pager pager, QnaDTO qnaDTO)throws Exception;	
	
	public int setHitUpdate(BoardDTO boardDTO)throws Exception;
	

	
	// 관리자 List
	public List<BoardDTO> getManagerList(Pager pager)throws Exception;
	// 관리자 List Total
	public Long getManagerTotal(Pager pager)throws Exception;	
	
}

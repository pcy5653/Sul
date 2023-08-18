package com.alcohol.sul.board;

import java.util.List;

import com.alcohol.sul.board.notice.NoticeDTO;

public interface BoardDAO {

	//List
	public List<BoardDTO> getList()throws Exception;
	
	//Detail
	public BoardDTO getDetail(BoardDTO boardDTO)throws Exception;
	
	//Add
	public int setAdd(BoardDTO boardDTO)throws Exception;
	
	//Update
	public int setUpdate(BoardDTO boardDTO)throws Exception;
	
	//Delete
	public int setDelete(BoardDTO boardDTO)throws Exception;
	
	//totalCount
	public Long getTotal()throws Exception;
	
	//hit update
	public int setHitUpdate(BoardDTO boardDTO)throws Exception;

	
}

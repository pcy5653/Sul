package com.alcohol.sul.board;

import java.util.List;
import java.util.Map;

import com.alcohol.sul.board.notice.NoticeDTO;
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
	
	//hit update
	public int setHitUpdate(BoardDTO boardDTO)throws Exception;

	
}

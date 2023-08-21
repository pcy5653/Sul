package com.alcohol.sul.board.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alcohol.sul.board.BoardDTO;
import com.alcohol.sul.board.BoardService;

@Service
public class QnaService implements BoardService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	
	
	@Override
	public List<BoardDTO> getList(BoardDTO boardDTO) throws Exception {
		List<BoardDTO> ar = qnaDAO.getList(boardDTO);
		return qnaDAO.getList(boardDTO);
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		return qnaDAO.getDetail(boardDTO);
	}

	@Override
	public int setAdd(BoardDTO boardDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = qnaDAO.setAdd(boardDTO);
		
		return result;
	}

	@Override
	public int setUpdate(BoardDTO boardDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = qnaDAO.setUpdate(boardDTO);
		
		return result;
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}

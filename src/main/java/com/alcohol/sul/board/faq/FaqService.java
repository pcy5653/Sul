package com.alcohol.sul.board.faq;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alcohol.sul.board.BoardDTO;
import com.alcohol.sul.board.BoardService;
import com.alcohol.sul.board.qna.QnaDTO;
import com.alcohol.sul.util.Pager;

@Service
public class FaqService implements BoardService {
	
	@Autowired
	private FaqDAO faqDAO;

	@Override
	public List<BoardDTO> getList(Pager pager, QnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	// List
	public List<BoardDTO> getList(FaqDTO faqDTO) throws Exception {
		return faqDAO.getList(faqDTO);
	}
	
	// DetailOperate
	public List<BoardDTO> getDetailOperate(FaqDTO faqDTO) throws Exception {
		return faqDAO.getDetailOperate(faqDTO);
	}
	// DetailOperate
	public List<BoardDTO> getDetailMember(FaqDTO faqDTO) throws Exception {
		return faqDAO.getDetailMember(faqDTO);
	}
	// DetailOperate
	public List<BoardDTO> getDetailBuy(FaqDTO faqDTO) throws Exception {
		return faqDAO.getDetailBuy(faqDTO);
	}
	// DetailOperate
	public List<BoardDTO> getDetailRefund(FaqDTO faqDTO) throws Exception {
		return faqDAO.getDetailRefund(faqDTO);
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setAdd(BoardDTO boardDTO, MultipartFile[] files, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	// insert
	public int setAdd(BoardDTO boardDTO) throws Exception {
		return faqDAO.setAdd(boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO, MultipartFile[] files, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	// update
	public int setUpdate(BoardDTO boardDTO, HttpSession session) throws Exception {
		return faqDAO.setUpdate(boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO, HttpSession session) throws Exception {
		return faqDAO.setDelete(boardDTO);
	}

	@Override
	public List<BoardDTO> getManagerList(Pager pager) throws Exception {

		return null;
	}
	
	
	
	
}

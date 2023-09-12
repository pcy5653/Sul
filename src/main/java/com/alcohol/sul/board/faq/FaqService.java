package com.alcohol.sul.board.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alcohol.sul.board.BoardDTO;
import com.alcohol.sul.board.BoardService;
import com.alcohol.sul.board.qna.QnaDTO;
import com.alcohol.sul.util.FaqPage;
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
	public List<BoardDTO> getList(FaqPage faqPage) throws Exception {
		faqPage.makeRowNum();
		Long total = faqDAO.getTotal(faqPage);
		faqPage.makePageNum(total);
		
		return faqDAO.getList(faqPage);
	}
	
	// DetailOperate
	public List<BoardDTO> getDetailOperate(FaqDTO faqDTO, FaqPage faqPage) throws Exception {
		faqPage.makeRowNum();
		Long total = faqDAO.getTotalOp(faqPage);
		faqPage.makePageNum(total);
		
		return faqDAO.getDetailOperate(faqDTO);
	}
	// DetailMember
	public List<BoardDTO> getDetailMember(FaqDTO faqDTO, FaqPage faqPage) throws Exception {
		faqPage.makeRowNum();
		Long total = faqDAO.getTotalMe(faqPage);
		faqPage.makePageNum(total);
		
		return faqDAO.getDetailMember(faqDTO);
	}
	// DetailBuy
	public List<BoardDTO> getDetailBuy(FaqDTO faqDTO, FaqPage faqPage) throws Exception {
		faqPage.makeRowNum();
		Long total = faqDAO.getTotalBuy(faqPage);
		faqPage.makePageNum(total);
		
		return faqDAO.getDetailBuy(faqDTO);
	}
	// DetailRefund
	public List<BoardDTO> getDetailRefund(FaqDTO faqDTO, FaqPage faqPage) throws Exception {
		faqPage.makeRowNum();
		Long total = faqDAO.getTotalRe(faqPage);
		faqPage.makePageNum(total);
		
		return faqDAO.getDetailRefund(faqDTO);
	}
	
	
	// Total
	
	//ListTotal
//	public Long getTotal(Pager pager)

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		return faqDAO.getDetail(boardDTO);
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

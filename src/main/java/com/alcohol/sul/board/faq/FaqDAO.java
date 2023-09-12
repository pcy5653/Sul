package com.alcohol.sul.board.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alcohol.sul.board.BoardDAO;
import com.alcohol.sul.board.BoardDTO;
import com.alcohol.sul.board.qna.QnaDTO;
import com.alcohol.sul.util.FaqPage;
import com.alcohol.sul.util.Pager;

@Repository
public class FaqDAO implements BoardDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE ="com.alcohol.sul.board.faq.FaqDAO.";

	
	
	@Override
	public List<BoardDTO> getList(Map<String, Object> map) throws Exception {
		
		return null;
	}
	
	// List
	public List<BoardDTO> getList(FaqPage faqPage) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", faqPage);
	}
	// DetailOperate
	public List<BoardDTO> getDetailOperate(FaqDTO faqDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getDetailOperate", faqDTO);
	}
	// DetailOperate
	public List<BoardDTO> getDetailMember(FaqDTO faqDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getDetailMember", faqDTO);
	}
	// DetailOperate
	public List<BoardDTO> getDetailBuy(FaqDTO faqDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getDetailBuy", faqDTO);
	}
	// DetailOperate
	public List<BoardDTO> getDetailRefund(FaqDTO faqDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getDetailRefund", faqDTO);
	}
	
	// Total
	
	// ListTotal
	public Long getTotal(FaqPage faqPage) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotal", faqPage);
	}
	
	// operateTotal
	public Long getTotalOp(FaqPage faqPage) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalOp", faqPage);
	}
	// operateTotal
	public Long getTotalMe(FaqPage faqPage) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalMe", faqPage);
	}
	// operateTotal
	public Long getTotalBuy(FaqPage faqPage) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalBuy", faqPage);
	}
	// operateTotal
	public Long getTotalRe(FaqPage faqPage) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalRe", faqPage);
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getDetail", boardDTO);
	}

	@Override
	public int setAdd(BoardDTO boardDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setAdd", boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setUpdate", boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setDelete", boardDTO);
	}

	@Override
	public Long getTotal(Pager pager, QnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setHitUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardDTO> getManagerList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long getManagerTotal(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
}

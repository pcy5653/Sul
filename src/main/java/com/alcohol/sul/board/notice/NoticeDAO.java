package com.alcohol.sul.board.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alcohol.sul.board.BoardDAO;
import com.alcohol.sul.board.BoardDTO;
import com.alcohol.sul.board.notice.NoticeFileDTO;
import com.alcohol.sul.util.Pager;

@Repository
public class NoticeDAO implements BoardDAO{

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.alcohol.sul.board.notice.NoticeDAO.";

	public NoticeFileDTO getFileDetail(NoticeFileDTO noticeFileDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getFileDetail", noticeFileDTO);
	}
	
	public int setFileDelete(NoticeFileDTO noticeFileDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setFileDelete", noticeFileDTO);
	}
	
	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getDetail", boardDTO);
	}
	
	public NoticeFileDTO getFileDetai1(NoticeFileDTO noticeFileDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getFileDetail", noticeFileDTO);
	}
	
	@Override
	public int setAdd(BoardDTO boardDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"setAdd", boardDTO);
	}
	
	public int setFileAdd(NoticeFileDTO noticeFileDTO)throws Exception{
		
		return sqlSession.insert(NAMESPACE+"setFileAdd", noticeFileDTO);
	}
	
	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"setUpdate", boardDTO);
	}
	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"setDelete", boardDTO);
	}
	@Override
	public Long getTotal(Pager pager) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getTotal", pager);
	}
	@Override
	public int setHitUpdate(BoardDTO boardDTO) throws Exception {
	
		return sqlSession.update(NAMESPACE+"setHitCount", boardDTO);
	}

	

}

package com.alcohol.sul.board.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alcohol.sul.board.notice.NoticeFileDTO;
import com.alcohol.sul.util.Pager;

@Repository
public class NoticeDAO{

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.alcohol.sul.board.notice.NoticeDAO.";

	public NoticeFileDTO getFileDetail(NoticeFileDTO noticeFileDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getFileDetail", noticeFileDTO);
	}
	
	public int setFileDelete(NoticeFileDTO noticeFileDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setFileDelete", noticeFileDTO);
	}
	
	
	public List<NoticeDTO> getList(Pager pager) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	
	public NoticeDTO getDetail(NoticeDTO noticeDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getDetail", noticeDTO);
	}

	
	public int setAdd(NoticeDTO noticeDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"setAdd", noticeDTO);
	}
	
	public int setFileAdd(NoticeFileDTO noticeFileDTO)throws Exception{
		
		return sqlSession.insert(NAMESPACE+"setFileAdd", noticeFileDTO);
	}
	
	
	public int setUpdate(NoticeDTO noticeDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"setUpdate", noticeDTO);
	}
	
	
	public int setDelete(NoticeDTO noticeDTO) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"setDelete", noticeDTO);
	}
	
	public Long getTotal(Pager pager) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getTotal", pager);
	}

	
	public int setHitUpdate(NoticeDTO noticeDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"setHitCount", noticeDTO);
	}
	
	

	
	
	
}

package com.alcohol.sul.board.qna;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alcohol.sul.board.BoardDAO;
import com.alcohol.sul.board.BoardDTO;
import com.alcohol.sul.util.Pager;

@Repository
public class QnaDAO implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.alcohol.sul.board.qna.QnaDAO.";

	
	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getDetail", boardDTO);
	}

	@Override
	public int setAdd(BoardDTO boardDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setAdd", boardDTO);
	}
	// fileSave
	public int setFileAdd(QnaFileDTO qnaFileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setFileAdd", qnaFileDTO);
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
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	// <<수정 시 파일 삭제>>
	// 1. 폴더 내용(파일) 삭제
	public QnaFileDTO getFileDetail(QnaFileDTO qnaFileDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getFileDetail", qnaFileDTO);
	}
	// 2. DB 내용(파일) 삭제
	public int setFileDelete(QnaFileDTO qnaFileDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setFileDelete", qnaFileDTO);
	}
}

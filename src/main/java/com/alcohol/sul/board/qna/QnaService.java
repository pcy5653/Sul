package com.alcohol.sul.board.qna;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alcohol.sul.board.BoardDTO;
import com.alcohol.sul.board.BoardService;
import com.alcohol.sul.member.MemberDTO;
import com.alcohol.sul.util.FileManager;
import com.alcohol.sul.util.Pager;

@Service
public class QnaService implements BoardService {
	
	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private FileManager fileManager;
	
	
	
	@Override
	public List<BoardDTO> getList(Pager pager, QnaDTO qnaDTO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		pager.makeRowNum();
		Long total = qnaDAO.getTotal(pager, qnaDTO);
		pager.makePageNum(total);
		map.put("pager", pager);
		map.put("member",qnaDTO);
		
		return qnaDAO.getList(map);
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		return qnaDAO.getDetail(boardDTO);
	}

	@Override
	public int setAdd(BoardDTO boardDTO, MultipartFile[] files, HttpSession session) throws Exception {		
		// file Save
		String path = "/resources/upload/qna/";

		int result = qnaDAO.setAdd(boardDTO);
		
		for(MultipartFile file: files) {
			if(file.isEmpty()) {
				continue;
			}
			
			// fileManager에서 리턴 값
			String fileName = fileManager.fileSave(path, session, file);
			
			QnaFileDTO qnaFileDTO = new QnaFileDTO();
			qnaFileDTO.setFileName(fileName);
			qnaFileDTO.setNum(boardDTO.getNum());
			qnaFileDTO.setOriginalName(file.getOriginalFilename());
			
			result = qnaDAO.setFileAdd(qnaFileDTO);
		}
		return result;
	}

	@Override
	public int setUpdate(BoardDTO boardDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = qnaDAO.setUpdate(boardDTO);
		
		// file Save
		String path = "/resources/upload/qna/";
		
		for(MultipartFile multipartFile: files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			
			// fileManager에서 리턴 값
			String fileName = fileManager.fileSave(path, session, multipartFile);
			
			QnaFileDTO qnaFileDTO = new QnaFileDTO();
			qnaFileDTO.setFileName(fileName);
			qnaFileDTO.setNum(boardDTO.getNum());
			qnaFileDTO.setOriginalName(multipartFile.getOriginalFilename());
			
			result = qnaDAO.setFileAdd(qnaFileDTO);
		}
		return result;
	}

	@Override
	public int setDelete(BoardDTO boardDTO, HttpSession session) throws Exception {
		return qnaDAO.setDelete(boardDTO);
	}

	
	// << 수정 중 파일 삭제 >>
	public int setFileDelete (QnaFileDTO qnaFileDTO, HttpSession session)throws Exception{
		// 1. 폴더 파일 삭제
		qnaFileDTO = qnaDAO.getFileDetail(qnaFileDTO);
		boolean check = fileManager.fileDelete(qnaFileDTO, "/resources/upload/qna/", session);
		
		if(check) {
			// 2. DB 파일 삭제
			return qnaDAO.setFileDelete(qnaFileDTO);
		}
		return 0;	// false
	}
	
	
	// << Reply >>
	public int setReplyAdd(QnaDTO qnaDTO, HttpSession session)throws Exception{
		BoardDTO pDTO = new BoardDTO();
		pDTO.setNum(qnaDTO.getNum());	// 부모num 받기
		
		pDTO = qnaDAO.getDetail(pDTO);
		QnaDTO p = (QnaDTO)pDTO;
		qnaDTO.setRef(p.getRef());
		qnaDTO.setStep(p.getStep()+1);
		qnaDTO.setDepth(p.getDepth()+1);
		
		int result = qnaDAO.setStepUpdate(qnaDTO);	// step 증가
		result = qnaDAO.setReplyAdd(qnaDTO);		// reply 대입
		
		return result;
	}
}

package com.alcohol.sul.board.qna;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.maven.model.Parent;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alcohol.sul.board.BoardDTO;
import com.alcohol.sul.board.BoardService;
import com.alcohol.sul.member.MemberDTO;
import com.alcohol.sul.util.FileManager;
import com.alcohol.sul.util.Pager;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

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
	
	public List<QnaFileDTO> getReplyDetailFiles (QnaDTO qnaDTO)throws Exception{
		return qnaDAO.getReplyDetailFiles(qnaDTO); 
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

	// << list 갯수 >>
	public Long getTotalNum(BoardDTO boardDTO)throws Exception{
		return qnaDAO.getTotalNum(boardDTO);
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
		
		
		// << SMS체크 휴대폰번호 입력 시, 답변달리면 문자전송 >>
		// 글의 sms가 '1'이면 진행하기
		if(p.getSms() == 1) {
			String userId = p.getName(); // 작성자 아이디를 가져온다.
			// 회원 테이블에서 작성자 휴대폰 번호 조회
			String userPhone = getUserPhoneNumber(userId); // 작성자 아이디를 기반으로 이름을 가져온다.
			
			sendSMS(userPhone, p.getSubject());
		}
	    
		return result;
	}
	
	private String getUserPhoneNumber(String userId) throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(userId);
		memberDTO = qnaDAO.getPhoneNumber(memberDTO);
		
		String result = memberDTO.getPhone();
		
	    return result; // 가상의 이름 반환
	}
	
	
	// SMS API
	public void sendSMS(String userPhoneNumber, String subject){
		String api_key = "NCS6Z2IHA0RLQUS1"; //쿨 sms api
	    String api_secret = "MK0T5L21VZO4FXLBLRMQJBYHJIRAVOZC"; //쿨 sms 시크릿api
	    Message coolsms = new Message(api_key, api_secret);
	    
	 // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // 수신전화번호
	    params.put("from", "01091957075");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "고객님의 "+"<"+subject+">"+" 질문에 답글이 달렸습니다. 확인해보세요!"); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	}
	
	
	
	// 관리자 List
	@Override
	public List<BoardDTO> getManagerList(Pager pager) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		pager.makeRowNum();
		Long total = qnaDAO.getManagerTotal(pager);
		pager.makePageNum(total);
		
		return qnaDAO.getManagerList(pager);
	}

	
}

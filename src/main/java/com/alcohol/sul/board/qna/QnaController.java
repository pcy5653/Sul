package com.alcohol.sul.board.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alcohol.sul.board.BoardDTO;
import com.alcohol.sul.member.MemberDTO;
import com.alcohol.sul.util.Pager;

@Controller
@RequestMapping(value = "/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	
	
	// List
	@RequestMapping(value="list",method=RequestMethod.GET)
	public String getList(QnaDTO qnaDTO, Pager pager, HttpSession session, Model model)throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		qnaDTO.setName(memberDTO.getId());
		
		// 관리자(1), 회원(0)
		if(memberDTO.getRoleNum() == 1) {
			List<BoardDTO> ar = qnaService.getManagerList(pager);
			model.addAttribute("list", ar);
			model.addAttribute("pager", pager);
		}else {
			List<BoardDTO> ar = qnaService.getList(pager, qnaDTO);
			Long tn = qnaService.getTotalNum(qnaDTO);

			model.addAttribute("list", ar);
			model.addAttribute("pager", pager);
			model.addAttribute("total", tn);
		}
		return "/qna/list";
	}
	
	// Detail
	@RequestMapping(value="detail",method=RequestMethod.GET)
	public String getDetail(QnaDTO qnaDTO, Model model)throws Exception{
		qnaDTO = (QnaDTO)qnaService.getDetail(qnaDTO);
		
		// null여부에 따른 return 경로
		if(qnaDTO != null) {
			
			if(qnaDTO.getStep() == 1) {
				QnaDTO pDTO = new QnaDTO(); 
				pDTO.setNum(qnaDTO.getRef());

				// 부모글의 내용 (파일)
				List<QnaFileDTO> files = qnaService.getReplyDetailFiles(pDTO);
				
				model.addAttribute("files", files);
			
			}
			model.addAttribute("dto",qnaDTO);
			return "qna/detail";
		}else {
			model.addAttribute("message", "존재하지 않는 글 입니다.");
			model.addAttribute("url", "list");
			return "commons/result";
		}
		
	}
	
	// Add
	@RequestMapping(value="add",method=RequestMethod.GET)
	public String setAdd()throws Exception{
		return "/qna/add";
	}
	@RequestMapping(value="add",method=RequestMethod.POST)
	public String setAdd(QnaDTO qnaDTO, MultipartFile [] photos, HttpSession session, Model model)throws Exception{
		int result = qnaService.setAdd(qnaDTO, photos, session);
		
		String message = "등록에 실패하였습니다.";
		if(result>0) {
			message="등록이 완료되었습니다.";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", "list");
		
		return "commons/result";
	}
	
	// Update
	@RequestMapping(value = "update", method=RequestMethod.GET)
	public String setUpdate(QnaDTO qnaDTO, Model model)throws Exception{
		qnaDTO = (QnaDTO)qnaService.getDetail(qnaDTO);
		model.addAttribute("dto", qnaDTO);
		
		return "/qna/update";
	}
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String setUpdate(QnaDTO qnaDTO, MultipartFile [] photos, HttpSession session)throws Exception{
		int result = qnaService.setUpdate(qnaDTO, photos, session);
		
		return "redirect:./detail?num="+qnaDTO.getNum();
	}
	
	// Delete
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String setDelete(QnaDTO qnaDTO, HttpSession session)throws Exception{
		int result = qnaService.setDelete(qnaDTO, session);
		
		return "redirect:./list";
	}
	
	
	// <<수정 중 파일 삭제>>
	@GetMapping("fileDelete")
	public String setFileDelete(QnaFileDTO qnaFileDTO, HttpSession session, Model model)throws Exception{
		int result = qnaService.setFileDelete(qnaFileDTO,session);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	
	// << Reply >>
	@GetMapping("reply")
	public String setReplyAdd(Long num, Model model)throws Exception{
		model.addAttribute("num", num);
		
		return "/qna/reply";
	}
	@PostMapping("reply")
	public String setReplyAdd(QnaDTO qnaDTO, HttpSession session)throws Exception{
		int result = qnaService.setReplyAdd(qnaDTO, session);
		
		return "redirect:./list";
	}
	
	
	// << SMS체크 휴대폰번호 입력 시, 답변달리면 문자전송 >>
	@RequestMapping(value="/smsCheck", method = RequestMethod.GET)
	public void sendSMS(@RequestParam("phone") String userPhoneNumber,@RequestParam("subject") String subject) {
		qnaService.sendSMS(userPhoneNumber, subject);
	}
}

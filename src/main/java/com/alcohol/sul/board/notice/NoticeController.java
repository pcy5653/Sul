package com.alcohol.sul.board.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.alcohol.sul.board.BoardDTO;

@Controller

@RequestMapping("/board/*")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	// List 
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String getList(Model model) throws Exception{
		List<BoardDTO> ar = noticeService.getList();
		model.addAttribute("list",ar);
		return "board/list";
	}
	
	// Add
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String setAdd() throws Exception{
		return "board/add";
	}
	
	@RequestMapping(value="add", method = RequestMethod.POST)
	public String setAdd(NoticeDTO noticeDTO, MultipartFile[] photos, HttpSession session, Model model) throws Exception{
		int result = noticeService.setAdd(noticeDTO, photos, session);
		
		String message="등록 실패";
		
		if(result>0) {
			message="등록 성공";
		}
		
		model.addAttribute("message",message);
		model.addAttribute("url", "list");
		
		return "commons/result";
	}
	
	// Detail
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String getDetail(NoticeDTO noticeDTO, Model model) throws Exception{
		BoardDTO boardDTO= noticeService.getDetail(noticeDTO);
		if(boardDTO != null) {
			
			model.addAttribute("dto", boardDTO);
			return "board/detail";	
		}else {
			model.addAttribute("message", "글이 없습니다.");
			model.addAttribute("url", "list");
			return "commons/result";
		}
	}
	
	// Update
	
	@RequestMapping(value="update", method = RequestMethod.GET)
	public String setUpdate(BoardDTO boardDTO, Model model) throws Exception{
		boardDTO = noticeService.getDetail(boardDTO);
		model.addAttribute("dto", boardDTO);
		return "board/update";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String setUpdate(BoardDTO boardDTO, MultipartFile[] photos, HttpSession session)throws Exception{
		int result = noticeService.setUpdate(boardDTO, photos, session);
		return "redirect:./list";
	}

	
	// Delete
	
	@RequestMapping(value="delete", method = RequestMethod.POST)
	public String setDelete (BoardDTO boardDTO) throws Exception{
		int result = noticeService.setDelete(boardDTO);
		return "redirect:./list";
	}
	
}

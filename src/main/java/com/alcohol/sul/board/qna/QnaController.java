package com.alcohol.sul.board.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.alcohol.sul.board.BoardDTO;

@Controller
@RequestMapping(value = "/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	
	@ModelAttribute("board")
	public String getBoardName() {
		return "QNA";
	}
	
	
	
	// List
	@GetMapping("list")
	public String getList(QnaDTO qnaDTO, Model model)throws Exception{
		List<BoardDTO> ar = qnaService.getList(qnaDTO);
		model.addAttribute("list", ar);
		
		return "board/list";
	}
	
	// Detail
	@GetMapping("detail")
	public String getDetail(QnaDTO qnaDTO, Model model)throws Exception{
		qnaDTO = (QnaDTO)qnaService.getDetail(qnaDTO);
		model.addAttribute("dto",qnaDTO);
		
		return "board/detail";
	}
	
	// Add
	@GetMapping("add")
	public String setAdd()throws Exception{
		return "board/add";
	}
	@PostMapping("add")
	public String setAdd(QnaDTO qnaDTO, MultipartFile [] photos, HttpSession session)throws Exception{
		int result = qnaService.setAdd(qnaDTO, photos, session);
		
		return "redirect:./list";
	}
	
	// Update
	//@GetMapping("update")
	
}

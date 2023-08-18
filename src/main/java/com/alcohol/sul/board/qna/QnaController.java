package com.alcohol.sul.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alcohol.sul.board.BoardDTO;

@Controller
@RequestMapping(value = "/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	
	@ModelAttribute("board")
	public String getBoardName() {
		return "qna";
	}
	
	
	
	@GetMapping("list")
	public String getList(QnaDTO qnaDTO, Model model)throws Exception{
		List<BoardDTO> ar = qnaService.getList(qnaDTO);
		model.addAttribute("list", ar);
		
		return "board/list";
	}
}

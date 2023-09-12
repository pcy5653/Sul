package com.alcohol.sul.board.faq;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.alcohol.sul.board.BoardDTO;
import com.alcohol.sul.board.qna.QnaDTO;
import com.alcohol.sul.util.FaqPage;
import com.alcohol.sul.util.Pager;

@Controller
@RequestMapping("/faq/*")
public class FaqController {

	@Autowired
	private FaqService faqService; 
	
	
	// List
	@GetMapping("list")
	public String getList(FaqDTO faqDTO, FaqPage faqPage, Model model)throws Exception{
		List<BoardDTO> ar = faqService.getList(faqPage);
		model.addAttribute("list", ar);
		model.addAttribute("pager", faqPage);
		
		return "/faq/list";
	}
	
	// ListDetail
	@GetMapping("detail/operate")
	public String getDetailOperate(FaqDTO faqDTO,FaqPage faqPage, Model model)throws Exception{
		List<BoardDTO> ar = faqService.getDetailOperate(faqDTO, faqPage);
		model.addAttribute("list", ar);
		model.addAttribute("pager", faqPage);
				
		return "/faq/list";
	}
	// ListDetail
	@GetMapping("detail/member")
	public String getDetailMember(FaqDTO faqDTO,FaqPage faqPage, Model model)throws Exception{
		List<BoardDTO> ar = faqService.getDetailMember(faqDTO, faqPage);
		model.addAttribute("list", ar);
		model.addAttribute("pager", faqPage);
				
		return "/faq/list";
	}
	// ListDetail
	@GetMapping("detail/buy")
	public String getDetailBuy(FaqDTO faqDTO,FaqPage faqPage, Model model)throws Exception{
		List<BoardDTO> ar = faqService.getDetailBuy(faqDTO, faqPage);
		model.addAttribute("list", ar);
		model.addAttribute("pager", faqPage);
				
		return "/faq/list";
	}
	// ListDetail
	@GetMapping("detail/refund")
	public String getDetailRefund(FaqDTO faqDTO, FaqPage faqPage, Model model)throws Exception{
		List<BoardDTO> ar = faqService.getDetailRefund(faqDTO, faqPage);
		model.addAttribute("list", ar);
		model.addAttribute("pager", faqPage);
				
		return "/faq/list";
	}
		
	
	// insert
	@GetMapping("add")
	public String setAdd()throws Exception{	
		return "/faq/add";
	}
	@PostMapping("add")
	public String setAdd(FaqDTO faqDTO, Model model)throws Exception{
		int result = faqService.setAdd(faqDTO);
		
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
	public String setUpdate(FaqDTO faqDTO, Model model)throws Exception{
		faqDTO = (FaqDTO)faqService.getDetail(faqDTO);
		model.addAttribute("dto", faqDTO);
		
		return "/faq/update";
	}
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String setUpdate(FaqDTO faqDTO, HttpSession session)throws Exception{
		int result = faqService.setUpdate(faqDTO, session);
		
		return "redirect:./list";
	}
	
	
	// Delete
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String setDelete(QnaDTO qnaDTO, HttpSession session)throws Exception{
		int result = faqService.setDelete(qnaDTO, session);
		
		return "redirect:./list";
	}
}

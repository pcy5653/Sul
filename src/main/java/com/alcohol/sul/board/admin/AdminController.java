package com.alcohol.sul.board.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alcohol.sul.member.MemberDTO;
import com.alcohol.sul.member.MemberService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberService memberService;
	
	@GetMapping(value = "main")
	public void getMain(MemberDTO memberDTO,Model model,HttpSession session) throws Exception{
		memberDTO = (MemberDTO)session.getAttribute("member");
		List<MemberDTO> ar = adminService.getMemberList(memberDTO);
		model.addAttribute("list", ar);	
	}
	
	@GetMapping(value="memberManagement")
	public void memberManagement(MemberDTO memberDTO,Model model,HttpSession session) throws Exception{
		memberDTO = (MemberDTO)session.getAttribute("member");
		List<MemberDTO> ar = adminService.getMemberList(memberDTO);
		model.addAttribute("list", ar);	
	}
	
	@GetMapping(value="adminMemberDelete")
	public String adminMemberDelete(@RequestParam("id") String id,Model model,MemberDTO memberDTO) throws Exception{
		memberDTO.setId(id);
		int result = memberService.deleteMember(memberDTO);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}
	
}

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

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@GetMapping(value = "main")
	public void getMain(MemberDTO memberDTO,Model model) throws Exception{
		List<MemberDTO> ar = adminService.getMemberList();
		model.addAttribute("list", ar);	
	}
	
	@GetMapping(value="memberManagement")
	public void memberManagement(MemberDTO memberDTO,Model model) throws Exception{
		List<MemberDTO> ar = adminService.getMemberList();
		model.addAttribute("list", ar);	
	}
	
}

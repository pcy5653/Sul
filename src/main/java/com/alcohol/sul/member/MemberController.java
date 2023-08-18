package com.alcohol.sul.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	//회원가입
	@GetMapping(value = "join")
	public void setJoin() throws Exception{
		
	}
	@PostMapping(value = "join")
	public void setJoin(MemberDTO memberDTO) throws Exception{
		int result = memberService.setJoin(memberDTO);
		
	}
	//로그인
	@GetMapping(value = "login")
	public void getLogin() throws Exception{
		
	}
	@PostMapping(value = "login")
	public String getLogin(MemberDTO memberDTO,HttpSession session) throws Exception{
		memberDTO = memberService.getLogin(memberDTO);
		
		if(memberDTO != null) {
			session.setAttribute("member", memberDTO);
		}
		return "redirect:../"; 
	}
	
	//마이페이지
	@GetMapping(value="mypage")
	public void getMypage() throws Exception{
		
	}
	
	//로그아웃
	@GetMapping(value="logout")
	public String getLogout(HttpSession session) throws Exception{
		session.invalidate();
			
		return "redirect:../"; 
	}
	
	//아이디 중복체크
	@GetMapping(value="idCheck")
	public String getIdCheck(MemberDTO memberDTO,Model model) throws Exception{
		int result = memberService.getIdCheck(memberDTO);
		model.addAttribute("result", result);
		 
		return "/commons/ajaxResult";
	 }
}

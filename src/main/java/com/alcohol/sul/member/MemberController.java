package com.alcohol.sul.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
		int randomNumber = (int) ((Math.random() * (9999 - 1000 + 1)) + 1000);// 난수 생성

		memberService.certifiedPhoneNumber(userPhoneNumber, randomNumber);

		return Integer.toString(randomNumber);
	}

	// 회원가입
	@GetMapping(value = "join")
	public void setJoin() throws Exception {

	}

	@PostMapping(value = "join")
	public String setJoin(MemberDTO memberDTO) throws Exception {
		int result = memberService.setJoin(memberDTO);
		return "redirect:../";
	}

	// 로그인
	@GetMapping(value = "login")
	public void getLogin() throws Exception {

	}

	@PostMapping(value = "login")
	public String getLogin(MemberDTO memberDTO, HttpSession session, Model model) throws Exception {
		memberDTO = memberService.getLogin(memberDTO);

		if (memberDTO != null) {
			session.setAttribute("member", memberDTO);
			return "redirect:../";
		}
		model.addAttribute("result", 0);
		return "commons/ajaxResult";
	}

	// 회원정보
	@GetMapping(value = "info")
	public void getMypage(MemberDTO memberDTO, HttpSession session) throws Exception {
		memberDTO = (MemberDTO) session.getAttribute("member");
		session.setAttribute("member", memberService.myPageReset(memberDTO));
	}

	// 로그아웃
	@GetMapping(value = "logout")
	public String getLogout(HttpSession session) throws Exception {
		session.invalidate();

		return "redirect:../";
	}
	//마이페이지
	@GetMapping(value = "mypage")
	public void getMypage() throws Exception{
		
	}
	
	// 아이디 중복체크
	@GetMapping(value = "idCheck")
	public String getIdCheck(MemberDTO memberDTO, Model model) throws Exception {
		int result = memberService.getIdCheck(memberDTO);
		model.addAttribute("result", result);

		return "commons/ajaxResult";
	}

	// 폰번호중복체크
	@GetMapping(value = "getPhoneCheck")
	public String getPhoneCheck(MemberDTO memberDTO, Model model) throws Exception {
		int result = memberService.getPhoneCheck(memberDTO);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}

	@PostMapping(value = "updateInfo")
	public String setInfoUpdate(MemberDTO memberDTO, HttpSession session) throws Exception {
		int result = memberService.setInfoUpdate(memberDTO);

		return "redirect:./info";
	}

	@PostMapping(value = "updatePw")
	public String setPwUpdate(MemberDTO memberDTO, HttpSession session) throws Exception {
		int result = memberService.setPwUpdate(memberDTO);
		session.invalidate();
		return "redirect:./login";
	}

	@GetMapping(value = "findId")
	public void findId() throws Exception {

	}

	@PostMapping(value = "findId")
	public void findId(MemberDTO memberDTO, Model model) throws Exception {
		memberDTO = memberService.findId(memberDTO);

		if (memberDTO == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("id", memberDTO.getId());
		}
	}

	@GetMapping(value = "findPw")
	public void findPw() throws Exception {

	}

	@PostMapping(value = "findPw")
	public void findPw(MemberDTO memberDTO, Model model) throws Exception {
		memberDTO = memberService.findPw(memberDTO);

		if (memberDTO == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("pw", memberDTO.getPw());
		}
	}
	

}

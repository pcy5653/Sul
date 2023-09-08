package com.alcohol.sul.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alcohol.sul.member.MemberDTO;
import com.alcohol.sul.member.MemberService;
import com.google.gson.Gson;

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
		model.addAttribute("member", memberDTO);
		model.addAttribute("list", ar);	
	}
	
	@GetMapping(value = "salesRevenue")
	public void salesRevenue(Model model) throws Exception {
		int[] salesRevenue = new int[12 + 1]; // 1 ~ 12월을 편하게 관리하기 위해 좀 그렇지만... 첫 번째 index(0)은 사용하지 않음.
		List<SalesRevenueDTO> salesRevenues = adminService.getSalesRevenue();
		for(SalesRevenueDTO salesRevenueDTO : salesRevenues) {
			String s_month = salesRevenueDTO.getMonth(); // 2023-09
			int i_month = Integer.parseInt(s_month.substring(s_month.indexOf('-') + 1));
			
			salesRevenue[i_month] = salesRevenueDTO.getSalesRevenue();
		}
		
		/*
			List<OrderDTO> orders = adminService.getSalesRevenue();
			for(OrderDTO orderDTO : orders) {
				int month = orderDTO.getOrderDate().toLocalDate().getMonthValue();
				for(OrderProductDTO orderProductDTO : orderDTO.getOrderProducts()) {
					ProductDTO productDTO = orderProductDTO.getProductDTO();
					salesRevenue[month] += productDTO.getPrice() * orderProductDTO.getOrderCount();
				}
			}
		*/
		
		model.addAttribute("salesRevenue", new Gson().toJson(salesRevenue));
	}
	
	
	@GetMapping(value="memberManagement")
	public void memberManagement(MemberDTO memberDTO,Model model,HttpSession session) throws Exception{
		memberDTO = (MemberDTO)session.getAttribute("member");
		List<MemberDTO> ar = adminService.getMemberList(memberDTO);
		List<MemberDTO> cr = adminService.getSmsCheckList(memberDTO);
		model.addAttribute("member",memberDTO);
		model.addAttribute("list", ar);
		model.addAttribute("checkList", cr);
	}
	
	
	//회원삭제
	@GetMapping(value="adminMemberDelete")
	public String adminMemberDelete(@RequestParam("id") String id,Model model,MemberDTO memberDTO) throws Exception{
		memberDTO.setId(id);
		int result = memberService.deleteMember(memberDTO);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}
	
	//포인트
	@GetMapping("pointAdd")
	public String pointAdd(Long point,String id,MemberDTO memberDTO,Model model) throws Exception{
		memberDTO.setId(id);
		memberDTO = adminService.getPoint(memberDTO);
		memberDTO.setPoint(memberDTO.getPoint()+point);
		int result = adminService.pointAdd(memberDTO);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}
	
	//단체문자
	@RequestMapping(value = "/groupSMS", method = RequestMethod.GET)
	public void phoneFw(@RequestParam("phone") String userPhoneNumber,String smsContents) throws Exception { // 휴대폰 문자보내기
		
		adminService.certifiedPhoneNumber(userPhoneNumber, smsContents);
		
	}
}
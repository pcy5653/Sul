package com.alcohol.sul;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alcohol.sul.member.MemberDTO;

@Controller
public class IndexController {
	@RequestMapping(value = "/settingOrderTestData")
	public String settingOrderTestData(HttpSession session) {
		/*
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId("hello00700");
			memberDTO.setRoleNum(1);
			memberDTO.setPw("00700");
			memberDTO.setName("김민진");
			memberDTO.setPhone("010-0000-0000");
			memberDTO.setAddress("인천광역시 부평구");
			memberDTO.setBirth(Date.valueOf("1995-07-28"));
			memberDTO.setMemberDate(new Date(System.currentTimeMillis()));
			memberDTO.setPoint(100L);
			
			session.setAttribute("member", memberDTO);
		*/
		return "settingOrderTestData";
	}
}
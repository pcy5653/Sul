package com.alcohol.sul;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping(value = "/setting")
	public String settingOrderTestData(HttpSession session) {
		return "setting";
	}
}
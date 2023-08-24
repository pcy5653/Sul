package com.alcohol.sul.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

@RequestMapping("/cart/*")
public class CartController {

	@Autowired
	private CartService cartService;
	
	@RequestMapping(value="list", method = RequestMethod.GET)
	public String getList(Model model)throws Exception{
		List<CartDTO> ar = cartService.getList();
		model.addAttribute("list", ar);
		return "cart/list";
	}
	
}

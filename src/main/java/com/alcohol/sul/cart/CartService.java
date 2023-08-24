package com.alcohol.sul.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {
	
	@Autowired
	private CartDAO cartDAO;

	
	public List<CartDTO> getList()throws Exception{
		return cartDAO.getList();
	}
}

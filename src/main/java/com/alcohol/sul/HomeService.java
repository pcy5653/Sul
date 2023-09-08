package com.alcohol.sul;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alcohol.sul.main.product.ProductDTO;

@Service
public class HomeService {
	
	@Autowired
	private HomeDAO homeDAO;

	// best 상품(리뷰기준)
	public List<ProductDTO> getBestReview ()throws Exception{
		return homeDAO.getBestReview();
	}
}

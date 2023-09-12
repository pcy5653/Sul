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
	
	public ProductDTO p46 () throws Exception{
		return homeDAO.p46();
	}	
	public Long p46r() throws Exception {
		return homeDAO.p46r();
	}
	
	public ProductDTO p47 () throws Exception{
		return homeDAO.p47();
	}	
	public Long p47r() throws Exception {
		return homeDAO.p47r();
	}
	
	public ProductDTO p48 () throws Exception{
		return homeDAO.p48();
	}	
	public Long p48r() throws Exception {
		return homeDAO.p48r();
	}
	
	public ProductDTO p49 () throws Exception{
		return homeDAO.p49();
	}	
	public Long p49r() throws Exception {
		return homeDAO.p49r();
	}
	
	public ProductDTO p45 () throws Exception{
		return homeDAO.p45();
	}	
	public Long p45r() throws Exception {
		return homeDAO.p45r();
	}
	
	public ProductDTO p63 () throws Exception{
		return homeDAO.p63();
	}	
	public Long p63r() throws Exception {
		return homeDAO.p63r();
	}
	
	public ProductDTO p66 () throws Exception{
		return homeDAO.p66();
	}	
	public Long p66r() throws Exception {
		return homeDAO.p66r();
	}
	
	public ProductDTO p72 () throws Exception{
		return homeDAO.p72();
	}	
	public Long p72r() throws Exception {
		return homeDAO.p72r();
	}
}

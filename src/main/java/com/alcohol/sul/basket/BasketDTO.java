package com.alcohol.sul.basket;

import com.alcohol.sul.main.util.ImgFileDTO;

public class BasketDTO extends ImgFileDTO{

	private Long basketNum;
	private String id;
	private Long productNum;
	private Long productCount;
	
	// product
	
	private String productName;
	private Long price;


	public Long getBasketNum() {
		return basketNum;
	}
	public void setBasketNum(Long basketNum) {
		this.basketNum = basketNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public Long getProductCount() {
		return productCount;
	}
	public void setProductCount(Long productCount) {
		this.productCount = productCount;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}

	
}

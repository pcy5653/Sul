package com.alcohol.sul.basket;

public class BasketDTO {

	private Long basketNum;
	private String id;
	private Long productNum;
	private int productCount;
	
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
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
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

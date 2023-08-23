package com.alcohol.sul.cart;

import java.sql.Date;

public class CartDTO {
	
	private Long cartNum;
	private String id;
	private Long cartPrice;
	private Date orderdate;
	private Long productNum;
	private Long productCount;
	private Long productPrice;
	private Integer isBuy;
	private String productName;
	private Long price;
	private Long savePoint;
	
	
	public Long getSavePoint() {
		return savePoint;
	}
	public void setSavePoint(Long savePoint) {
		this.savePoint = savePoint;
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
	public Long getCartNum() {
		return cartNum;
	}
	public void setCartNum(Long cartNum) {
		this.cartNum = cartNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Long getCartPrice() {
		return cartPrice;
	}
	public void setCartPrice(Long cartPrice) {
		this.cartPrice = cartPrice;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
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
	public Long getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Long productPrice) {
		this.productPrice = productPrice;
	}
	public Integer getIsBuy() {
		return isBuy;
	}
	public void setIsBuy(Integer isBuy) {
		this.isBuy = isBuy;
	}
	
	
	
}

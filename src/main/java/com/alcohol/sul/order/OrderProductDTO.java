package com.alcohol.sul.order;

import com.alcohol.sul.main.product.ProductDTO;

public class OrderProductDTO {
	private Long orderProductNum;
	private String orderNum;
	private Long productNum;
	private Integer orderCount;
	private Integer isCanceled;
	private ProductDTO productDTO;
	
	public Long getOrderProductNum() {
		return orderProductNum;
	}
	
	public String getOrderNum() {
		return orderNum;
	}
	
	public Long getProductNum() {
		return productNum;
	}
	
	public Integer getOrderCount() {
		return orderCount;
	}
	
	public Integer getIsCanceled() {
		return isCanceled;
	}
	
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	
	public void setOrderProductNum(Long orderProductNum) {
		this.orderProductNum = orderProductNum;
	}
	
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	
	public void setOrderCount(Integer orderCount) {
		this.orderCount = orderCount;
	}
	
	public void setIsCanceled(Integer isCanceled) {
		this.isCanceled = isCanceled;
	}
	
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
}
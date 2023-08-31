package com.alcohol.sul.order;

public class CancelInfoDTO {
	private Long cancelNum;
	private Long orderProductNum;
	private OrderProductDTO orderProductDTO;
	
	public Long getCancelNum() {
		return cancelNum;
	}
	
	public Long getOrderProductNum() {
		return orderProductNum;
	}	
	
	public OrderProductDTO getOrderProductDTO() {
		return orderProductDTO;
	}

	public void setCancelNum(Long cancelNum) {
		this.cancelNum = cancelNum;
	}
	
	public void setOrderProductNum(Long orderProductNum) {
		this.orderProductNum = orderProductNum;
	}
	
	public void setOrderProductDTO(OrderProductDTO orderProductDTO) {
		this.orderProductDTO = orderProductDTO;
	}
}
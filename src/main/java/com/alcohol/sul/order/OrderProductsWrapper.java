package com.alcohol.sul.order;

import java.util.List;

public class OrderProductsWrapper {
	private List<OrderProductDTO> orderProducts;

	public List<OrderProductDTO> getOrderProducts() {
		return orderProducts;
	}

	public void setOrderProducts(List<OrderProductDTO> orderProducts) {
		this.orderProducts = orderProducts;
	}
}
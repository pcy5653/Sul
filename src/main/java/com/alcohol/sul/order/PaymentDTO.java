package com.alcohol.sul.order;

import java.sql.Date;

public class PaymentDTO {
	private Long payNum;
	private String orderNum;
	private Integer pay;
	private String payWay;
	private Date payDate;
	
	public Long getPayNum() {
		return payNum;
	}
	
	public String getOrderNum() {
		return orderNum;
	}
	
	public Integer getPay() {
		return pay;
	}
	
	public String getPayWay() {
		return payWay;
	}
	
	public Date getPayDate() {
		return payDate;
	}
	
	public void setPayNum(Long payNum) {
		this.payNum = payNum;
	}
	
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	
	public void setPay(Integer pay) {
		this.pay = pay;
	}
	
	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}
	
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
}
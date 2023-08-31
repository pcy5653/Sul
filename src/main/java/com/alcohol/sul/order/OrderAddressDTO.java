package com.alcohol.sul.order;

public class OrderAddressDTO {
	private String orderNum;
	private String recipient;
	private String recipientPhone;
	private String recipientAddress;
	
	public String getOrderNum() {
		return orderNum;
	}
	
	public String getRecipient() {
		return recipient;
	}
	
	public String getRecipientPhone() {
		return recipientPhone;
	}
	
	public String getRecipientAddress() {
		return recipientAddress;
	}
	
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	
	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}
	
	public void setRecipientAddress(String recipientAddress) {
		this.recipientAddress = recipientAddress;
	}
}
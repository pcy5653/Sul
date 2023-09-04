package com.alcohol.sul.order;

public class OtherAddressDTO {
	private Long addressNum;
	private String id;
	private String recipient;
	private String recipientPhone;
	private String recipientAddress;
	
	public Long getAddressNum() {
		return addressNum;
	}
	
	public String getId() {
		return id;
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
	
	public void setAddressNum(Long addressNum) {
		this.addressNum = addressNum;
	}
	
	public void setId(String id) {
		this.id = id;
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
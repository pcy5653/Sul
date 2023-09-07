package com.alcohol.sul.order;

import java.sql.Date;
import java.util.List;

import com.alcohol.sul.member.MemberDTO;

public class OrderDTO {
	private String orderNum;
	private String id;
	private Integer total;
	private Integer orderFee;
	private String orderComment;
	private Integer usedPoint;
	private Date orderDate;
	private List<OrderProductDTO> orderProducts;
	private OrderAddressDTO orderAddressDTO;
	private PaymentDTO paymentDTO;
	
	private MemberDTO memberDTO;
	private List<CancelDTO> cancels;
	
	public String getOrderNum() {
		return orderNum;
	}
	
	public String getId() {
		return id;
	}
	
	public Integer getTotal() {
		return total;
	}
	
	public Integer getOrderFee() {
		return orderFee;
	}
	
	public String getOrderComment() {
		return orderComment;
	}
	
	public Integer getUsedPoint() {
		return usedPoint;
	}
	
	public Date getOrderDate() {
		return orderDate;
	}
	
	public List<OrderProductDTO> getOrderProducts() {
		return orderProducts;
	}
	
	public OrderAddressDTO getOrderAddressDTO() {
		return orderAddressDTO;
	}
	
	public PaymentDTO getPaymentDTO() {
		return paymentDTO;
	}
	
	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	
	public List<CancelDTO> getCancels() {
		return cancels;
	}
	
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public void setTotal(Integer total) {
		this.total = total;
	}
	
	public void setOrderFee(Integer orderFee) {
		this.orderFee = orderFee;
	}
	
	public void setOrderComment(String orderComment) {
		this.orderComment = orderComment;
	}
	
	public void setUsedPoint(Integer usedPoint) {
		this.usedPoint = usedPoint;
	}
	
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	public void setOrderProducts(List<OrderProductDTO> orderProducts) {
		this.orderProducts = orderProducts;
	}
	
	public void setOrderAddressDTO(OrderAddressDTO orderAddressDTO) {
		this.orderAddressDTO = orderAddressDTO;
	}
	
	public void setPaymentDTO(PaymentDTO paymentDTO) {
		this.paymentDTO = paymentDTO;
	}
	
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	
	public void setCancels(List<CancelDTO> cancels) {
		this.cancels = cancels;
	}
}
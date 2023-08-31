package com.alcohol.sul.order;

import java.sql.Date;
import java.util.List;

public class CancelDTO {
	private Long cancelNum;
	private String orderNum;
	private Integer cancelAmount;
	private Integer cancelPoint;
	private Integer cancelOrderFee;
	private String cancelReason;
	private String cancelState;
	private Date cancelDate;
	private List<CancelInfoDTO> cancelInfos;
	
	public Long getCancelNum() {
		return cancelNum;
	}
	
	public String getOrderNum() {
		return orderNum;
	}
	
	public Integer getCancelAmount() {
		return cancelAmount;
	}
	
	public Integer getCancelPoint() {
		return cancelPoint;
	}

	public Integer getCancelOrderFee() {
		return cancelOrderFee;
	}
	
	public String getCancelReason() {
		return cancelReason;
	}
	
	public String getCancelState() {
		return cancelState;
	}
	
	public Date getCancelDate() {
		return cancelDate;
	}
	
	public List<CancelInfoDTO> getCancelInfos() {
		return cancelInfos;
	}
	
	public void setCancelNum(Long cancelNum) {
		this.cancelNum = cancelNum;
	}
	
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	
	public void setCancelAmount(Integer cancelAmount) {
		this.cancelAmount = cancelAmount;
	}
	
	public void setCancelPoint(Integer cancelPoint) {
		this.cancelPoint = cancelPoint;
	}

	public void setCancelOrderFee(Integer cancelOrderFee) {
		this.cancelOrderFee = cancelOrderFee;
	}
	
	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
	}
	
	public void setCancelState(String cancelState) {
		this.cancelState = cancelState;
	}
	
	public void setCancelDate(Date cancelDate) {
		this.cancelDate = cancelDate;
	}
	
	public void setCancelInfos(List<CancelInfoDTO> cancelInfos) {
		this.cancelInfos = cancelInfos;
	}
}
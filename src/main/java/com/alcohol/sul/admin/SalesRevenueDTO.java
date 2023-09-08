package com.alcohol.sul.admin;

public class SalesRevenueDTO {
	private String month;
	private Integer salesRevenue;
	
	public String getMonth() {
		return month;
	}
	
	public Integer getSalesRevenue() {
		return salesRevenue;
	}
	
	public void setMonth(String month) {
		this.month = month;
	}
	
	public void setSalesRevenue(Integer salesRevenue) {
		this.salesRevenue = salesRevenue;
	}
}
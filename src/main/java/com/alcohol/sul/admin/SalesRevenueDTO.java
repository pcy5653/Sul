package com.alcohol.sul.admin;

import java.time.LocalDate;

public class SalesRevenueDTO {
	private String month;
	private Integer salesRevenue;
	private Integer day;
	private Integer year;
	private Integer month2;
	public Integer getMonth2() {
		
		return month2;
	}

	public void setMonth2(Integer month2) {
		this.month2 = month2;
	}

	public Integer getYear() {
		
		return year;
	}
	
	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getDay() {
		return day;
	}

	public void setDay(Integer day) {
		this.day = day;
	}

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
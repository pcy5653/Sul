package com.alcohol.sul.member;

import java.sql.Date;

public class MemberDTO {

	private String id;
	private Integer roleNum;
	private String pw;
	private String name;
	private String phone;
	private String address;
	private Date birth;
	private Date memberDate;
	private Long point;
	private Integer sms;
	
	public Integer getSms() {
		return sms;
	}
	public void setSms(Integer sms) {
		this.sms = sms;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getRoleNum() {
		return roleNum;
	}
	public void setRoleNum(Integer roleNum) {
		this.roleNum = roleNum;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public Date getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(Date memberDate) {
		this.memberDate = memberDate;
	}
	public Long getPoint() {
		return point;
	}
	public void setPoint(Long point) {
		this.point = point;
	}
}

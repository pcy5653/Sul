package com.alcohol.sul.util;

public class DefaultMessageDTO {
	private String objType;
	private String headerTitle;
	private String text;
	private String webUrl;
	private String mobileUrl;
	private String btnTitle;
	
	public String getObjType() {
		return objType;
	}
	
	public String getHeaderTitle() {
		return headerTitle;
	}
	
	public String getText() {
		return text;
	}
	
	public String getWebUrl() {
		return webUrl;
	}
	
	public String getMobileUrl() {
		return mobileUrl;
	}
	
	public String getBtnTitle() {
		return btnTitle;
	}
	
	public void setObjType(String objType) {
		this.objType = objType;
	}
	
	public void setHeaderTitle(String headerTitle) {
		this.headerTitle = headerTitle;
	}
	
	public void setText(String text) {
		this.text = text;
	}
	
	public void setWebUrl(String webUrl) {
		this.webUrl = webUrl;
	}
	
	public void setMobileUrl(String mobileUrl) {
		this.mobileUrl = mobileUrl;
	}
	
	public void setBtnTitle(String btnTitle) {
		this.btnTitle = btnTitle;
	}
}
package com.alcohol.sul.order;

public class KakaoRefreshTokenDTO {
	private String id;
	private String refreshToken;
	
	public String getId() {
		return id;
	}
	
	public String getRefreshToken() {
		return refreshToken;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}	
}
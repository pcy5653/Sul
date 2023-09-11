package com.alcohol.sul.util;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

@Service
public class AuthService extends HttpCallService {
	private String CLIENT_ID = "bea6fb109d4f653a33311d67686f57b0";
	private String CLIENT_SECRET = "nMmY4I28fegtpi1sCwxYYGuKZDkERrY5";
	
	private static final String AUTH_URL = "https://kauth.kakao.com/oauth/token";
	public static String authToken;
	
	public boolean getKakaoAuthToken(String code) throws Exception {
		HttpHeaders headers = new HttpHeaders();
		String accessToken = "";
		String refrashToken = "";
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		
		headers.set("Content-Type", APP_TYPE_URL_ENCODED);
		
		params.add("code", code);
		params.add("grant_type", "authorization_code");
		params.add("client_id", CLIENT_ID);
		params.add("redirect_url", "http://localhost:8080/order/kakaoAlarmTest");
		params.add("client_secret", CLIENT_SECRET);
		
		HttpEntity<?> requestEntity = httpClientEntity(headers, params);
		
		ResponseEntity<String> response = httpRequest(AUTH_URL, HttpMethod.POST, requestEntity);
		JSONParser parser = new JSONParser();
		JSONObject json = (JSONObject)parser.parse(response.getBody());
		
		accessToken = json.get("access_token").toString();
		refrashToken = json.get("refresh_token").toString();
		if(accessToken.isEmpty() || refrashToken.isEmpty()) {
			System.out.println("토큰 발급 실패");
			return false;
		}else {
			System.out.println("토큰 발급 성공");
			authToken = accessToken;
			return true;
		}
	}
}
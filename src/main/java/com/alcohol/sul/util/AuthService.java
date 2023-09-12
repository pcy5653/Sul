package com.alcohol.sul.util;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;

import com.alcohol.sul.order.KakaoRefreshTokenDTO;
import com.alcohol.sul.order.OrderDAO;

@Service
public class AuthService extends HttpCallService {
	@Autowired
	private OrderDAO orderDAO;
	
	private String CLIENT_ID = "d904cac31b9fc17c41fc6bcb88454c07";
	private String CLIENT_SECRET = "4EhbJjajFLzZr3u2hPHTxZKf1Tc00uJh";
	
	private static final String AUTH_URL = "https://kauth.kakao.com/oauth/token";
	public static String accessToken;
	
	public String getKakaoAuthToken(String code) throws Exception {
		HttpHeaders headers = new HttpHeaders();
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		
		headers.set("Content-Type", APP_TYPE_URL_ENCODED);
		
		params.add("code", code);
		params.add("grant_type", "authorization_code");
		params.add("client_id", CLIENT_ID);
		params.add("redirect_url", "http://localhost:8080/order/kakaoAuth");
		params.add("client_secret", CLIENT_SECRET);
		
		HttpEntity<?> requestEntity = httpClientEntity(headers, params);
		
		ResponseEntity<String> response = httpRequest(AUTH_URL, HttpMethod.POST, requestEntity);
		JSONParser parser = new JSONParser();
		JSONObject json = (JSONObject)parser.parse(response.getBody());
		
		String accessToken = json.get("access_token").toString();
		String refrashToken = json.get("refresh_token").toString();
		
		if(accessToken.isEmpty() || refrashToken.isEmpty()) {
			System.out.println("토큰 발급 실패");
			return null;
		}else {
			System.out.println("토큰 발급 성공");
			AuthService.accessToken = accessToken;
			return refrashToken;
		}
	}
	
	public boolean revalidateAccessToken(KakaoRefreshTokenDTO kakaoRefreshTokenDTO) throws Exception {
		boolean result = false;
		
		HttpHeaders headers = new HttpHeaders();
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		
		headers.set("Content-Type", APP_TYPE_URL_ENCODED);
		
		params.add("grant_type", "refresh_token");
		params.add("client_id", CLIENT_ID);
		params.add("refresh_token", kakaoRefreshTokenDTO.getRefreshToken());
		
		try {
			HttpEntity<?> requestEntity = httpClientEntity(headers, params);
			
			ResponseEntity<String> response = httpRequest(AUTH_URL, HttpMethod.POST, requestEntity);
			JSONParser parser = new JSONParser();
			JSONObject json = (JSONObject)parser.parse(response.getBody());
			
			System.out.println("테스트 : " + json.toString());
			
			String accessToken = json.get("access_token").toString();
			
			if(accessToken.isEmpty()) {
				System.out.println("토큰 재발급 실패");
			}else {
				System.out.println("토큰 재발급 성공");
				AuthService.accessToken = accessToken;
				System.out.println("재발급 토큰 : " + AuthService.accessToken);
				result = true;
			}
		}catch(HttpClientErrorException e) {
			System.out.println("Refresh Token 만료");
			orderDAO.deleteKakaoRefreshToken(kakaoRefreshTokenDTO.getId());
		}
		
		return result;
	}
}
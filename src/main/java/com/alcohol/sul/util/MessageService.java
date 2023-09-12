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
public class MessageService extends HttpCallService {
	private static final String MSG_SEND_SERVICE_URL = "https://kapi.kakao.com/v2/api/talk/memo/default/send";
	private static final String SEND_SUCCESS_MSG = "메시지 전송 성공";
	private static final String SEND_FAIL_MSG = "메시지 전송 실패";
	private static final String SUCCESS_CODE = "0";
	
	@SuppressWarnings("unchecked")
	public boolean sendMessage(String accessToken, DefaultMessageDTO defaultMessageDTO) throws Exception {
		JSONObject linkObj = new JSONObject();
		linkObj.put("web_url", defaultMessageDTO.getWebUrl());
		linkObj.put("mobile_web_url", defaultMessageDTO.getMobileUrl());
		
		JSONObject templateObj = new JSONObject();
		templateObj.put("object_type", defaultMessageDTO.getObjType());
		templateObj.put("header_title", defaultMessageDTO.getHeaderTitle());
		templateObj.put("text", defaultMessageDTO.getText());
		templateObj.put("link", linkObj);
		templateObj.put("button_title", defaultMessageDTO.getBtnTitle());
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Content-Type", APP_TYPE_URL_ENCODED);
		headers.set("Authorization", "Bearer " + accessToken);
		
		System.out.println(templateObj.toString());
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("template_object", templateObj.toString());
		
		HttpEntity<?> messageRequestEntity = httpClientEntity(headers, params);
		
		String resultCode = "";
		ResponseEntity<String> response = httpRequest(MSG_SEND_SERVICE_URL, HttpMethod.POST, messageRequestEntity);
		JSONParser parser = new JSONParser();
		JSONObject json = (JSONObject)parser.parse(response.getBody());
		resultCode = json.get("result_code").toString();
		
		return successCheck(resultCode);
	}
	
	public boolean successCheck(String resultCode) {
		if(resultCode.equals(SUCCESS_CODE)) {
			System.out.println(SEND_SUCCESS_MSG);
			return true;
		}else {
			System.out.println(SEND_FAIL_MSG);
			return false;
		}
	}
}
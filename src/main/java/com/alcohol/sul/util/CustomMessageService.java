package com.alcohol.sul.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomMessageService {
	@Autowired
	private MessageService messageService;
	
	public boolean sendMyMessage() throws Exception {
		DefaultMessageDTO defaultMessageDTO = new DefaultMessageDTO();
		defaultMessageDTO.setBtnTitle("바로가기 버튼");
		defaultMessageDTO.setMobileUrl("http://localhost:8080/");
		defaultMessageDTO.setObjType("text");
		defaultMessageDTO.setWebUrl("http://localhost:8080/");
		defaultMessageDTO.setText("술담화 서비스를 이용해주셔서 감사합니다.\n해당 제품의 구매가 완료되었습니다.");
		
		String accessToken = AuthService.authToken;
		return messageService.sendMessage(accessToken, defaultMessageDTO);
	}
}
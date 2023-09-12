package com.alcohol.sul.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alcohol.sul.main.product.ProductDTO;
import com.alcohol.sul.order.OrderDTO;
import com.alcohol.sul.order.OrderProductDTO;

@Service
public class CustomMessageService {
	@Autowired
	private MessageService messageService;
	
	public boolean sendMyMessage(OrderDTO orderDTO) throws Exception {
		String msg = "술담화 서비스를 이용해주셔서 감사합니다 :)\n\n";
		
		for(OrderProductDTO orderProductDTO : orderDTO.getOrderProducts()) {
			ProductDTO productDTO = orderProductDTO.getProductDTO();
			msg += "[" + productDTO.getProductName() + " : " + orderProductDTO.getOrderCount() + "개]\n\n";
		}
		
		msg += "주문이 완료되었습니다!";
		
		DefaultMessageDTO defaultMessageDTO = new DefaultMessageDTO();
		defaultMessageDTO.setBtnTitle("주문 내역");
		defaultMessageDTO.setMobileUrl("");
		defaultMessageDTO.setObjType("text");
		defaultMessageDTO.setHeaderTitle("주문 완료");
		defaultMessageDTO.setWebUrl("");
		defaultMessageDTO.setText(msg);
		
		return messageService.sendMessage(AuthService.accessToken, defaultMessageDTO);
	}
}
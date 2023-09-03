package com.alcohol.sul.order;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alcohol.sul.exception.PaymentAmountException;
import com.alcohol.sul.exception.OverUsablePointException;
import com.alcohol.sul.main.product.ProductDTO;
import com.alcohol.sul.member.MemberDTO;
import com.alcohol.sul.util.PayService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Service
public class OrderService {
	@Autowired
	private OrderDAO orderDAO;
	
	private final String REST_API_KEY = "8272147228821717";
	private final String REST_API_SECRET = "raWFWttbu9k2sYz06jlNs6xw7VBFSQCoUNrD4rzGgHwQMrdEUbcDntrFAdIaxfWJHiAZYqVPI3HOX4sZ";
	
	public ProductDTO getProduct(Long productNum){
		return orderDAO.getProduct(productNum);
	}
	
	public List<OtherAddressDTO> getOtherAddress(String id){
		return orderDAO.getOtherAddress(id);
	}
	
	public Long addOtherAddress(OtherAddressDTO otherAddressDTO){
		return orderDAO.addOtherAddress(otherAddressDTO);
	}
	
	public int deleteOtherAddress(Long addressNum){
		return orderDAO.deleteOtherAddress(addressNum);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public String paymentSuccess(OrderDTO orderDTO, MemberDTO memberDTO) throws Exception {
		if(orderDTO.getUsedPoint() > memberDTO.getPoint()) {
			throw new OverUsablePointException("사용 가능 포인트 초과");
		}
		
		Long totalProductAmount = 0L;
		List<OrderProductDTO> orderProducts = orderDTO.getOrderProducts();
		for(OrderProductDTO orderProductDTO : orderProducts) {
			totalProductAmount += orderProductDTO.getProductDTO().getPrice() * orderProductDTO.getOrderCount();
		}
		
		PayService payService = new PayService();
		String access_token = payService.getToken(REST_API_KEY, REST_API_SECRET);
		Map<String, String> paymentInfo = payService.paymentInfo(access_token, orderDTO.getOrderNum());
		
		int amountPaid = Integer.parseInt(paymentInfo.get("amount"));
		long totalPay = totalProductAmount + orderDTO.getOrderFee() - orderDTO.getUsedPoint(); // 실제 계산되어야 할 금액
		
		System.out.println("ID : " + memberDTO.getId());
		System.out.println("결제 금액 : " + amountPaid);
		System.out.println("결제해야 할 금액 : " + totalPay + "\n");
		
		if(amountPaid != totalPay) { // 검증 실패(결제된 금액과 실제 계산되어야 할 금액이 다른 경우)
			throw new PaymentAmountException("결제 금액 오류");
		}else { // 검증 성공
			Date curDate = new Date(System.currentTimeMillis());
			
			// order
			orderDTO.setId(memberDTO.getId());
			orderDTO.setTotal(amountPaid + orderDTO.getUsedPoint());
			orderDTO.setOrderDate(curDate);
			
			// orderProduct
			for(OrderProductDTO orderProductDTO : orderProducts) {
				orderProductDTO.setOrderNum(orderDTO.getOrderNum());
			}
			
			// payment
			PaymentDTO paymentDTO = new PaymentDTO();
			paymentDTO.setOrderNum(orderDTO.getOrderNum());
			paymentDTO.setPay(amountPaid);
			paymentDTO.setPayWay(paymentInfo.get("pay_method"));
			paymentDTO.setPayDate(curDate);
			orderDTO.setPaymentDTO(paymentDTO);
			
			orderDAO.paymentSuccess(orderDTO);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("member", memberDTO);
			map.put("order", orderDTO);
			
			/*
				- Jackson -
				ObjectMapper objectMapper = new ObjectMapper();
				
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS");
		        objectMapper.setDateFormat(dateFormat);
		        
				return objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(map); // Map to JSON String
			*/
			
			// - Gson -
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").create();
			return gson.toJson(map); // Map to JSON String
			
			// 장바구니 삭제...
		}
	}
	
	public OrderDTO getOrderOne(Map<String, String> map){
		return orderDAO.getOrderOne(map);
	}
	
	public List<OrderDTO> getOrderAll(Map<String, String> map){
		return orderDAO.getOrderAll(map);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public Long cancel(CancelDTO cancelDTO, OrderDTO orderDTO) throws Exception {
		PayService payService = new PayService();
		String access_token = payService.getToken(REST_API_KEY, REST_API_SECRET);
		
		int result = payService.paymentCancel(access_token, cancelDTO.getOrderNum(), String.valueOf(cancelDTO.getCancelCash()), cancelDTO.getCancelReason());
		if(cancelDTO.getCancelNum() != -1) {
			if(result > 0) {
				cancelDTO.setCancelState("complete");
				cancelDTO.setCancelDate(new Date(System.currentTimeMillis()));
				orderDTO.setUsedPoint(cancelDTO.getCancelPoint());
				
				orderDAO.cancel(cancelDTO, orderDTO);
				return cancelDTO.getCancelNum();
			}else {
				cancelDTO.setCancelState("fail"); // 취소 실패
				orderDAO.cancel(cancelDTO, orderDTO);
				return 0L;
			}
		}else {
			return Long.valueOf(result);
		}
	}
	
	public CancelDTO getCancelOne(Map<String, String> map) {
		return orderDAO.getCancelOne(map);
	}
	
	public List<CancelDTO> getCancelAll(Map<String, String> map) {
		return orderDAO.getCancelAll(map);
	}
}
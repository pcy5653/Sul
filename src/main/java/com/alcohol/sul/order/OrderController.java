package com.alcohol.sul.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alcohol.sul.main.product.ProductDTO;
import com.alcohol.sul.member.MemberDTO;
import com.alcohol.sul.member.MemberService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/order/")
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String order(OrderProductsWrapper orderProductsWrapper, HttpSession session, Model model) {
		List<OrderProductDTO> orderProducts = orderProductsWrapper.getOrderProducts();
		for(OrderProductDTO orderProductDTO : orderProducts) {
			ProductDTO productDTO = orderService.getProduct(orderProductDTO.getProductNum());
			orderProductDTO.setProductDTO(productDTO);
		}
		
		session.setAttribute("orderProducts", orderProductsWrapper.getOrderProducts());
		model.addAttribute("orderProducts", orderProductsWrapper.getOrderProducts());
		
		return "order/order";
	}
	
	@RequestMapping(value = "getOtherAddress", method = RequestMethod.POST)
	@ResponseBody
	public List<OtherAddressDTO> getOtherAddress(@RequestParam String id) {
		return orderService.getOtherAddress(id);
	}
	
	@RequestMapping(value = "addOtherAddress", method = RequestMethod.POST)
	@ResponseBody
	public Long addOtherAddress(OtherAddressDTO otherAddressDTO) {
		return orderService.addOtherAddress(otherAddressDTO);
	}
	
	@RequestMapping(value = "deleteOtherAddress", method = RequestMethod.POST)
	@ResponseBody
	public int deleteOtherAddress(@RequestParam Long addressNum) {
		return orderService.deleteOtherAddress(addressNum);
	}
	
	@RequestMapping(value = "paymentSuccess", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String paymentSuccess(@RequestBody OrderDTO orderDTO, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		@SuppressWarnings("unchecked")
		List<OrderProductDTO> orderProducts = (List<OrderProductDTO>)session.getAttribute("orderProducts");
		orderDTO.setOrderProducts(orderProducts);
		
		return orderService.paymentSuccess(memberDTO, orderDTO);
	}
	
	@RequestMapping(value = "paymentComplete")
	// @ResponseBody
	public String paymentComplete(@RequestParam String paymentInfo, Model model) throws Exception {
		JSONParser parser = new JSONParser();
		JSONObject json = (JSONObject)parser.parse(paymentInfo); // JSON String to JSON
		
		ObjectMapper mapper = new ObjectMapper();
		// MemberDTO memberDTO = mapper.readValue(json.get("member").toString(), MemberDTO.class); // JSON String to MemberDTO
		OrderDTO orderDTO = mapper.readValue(json.get("order").toString(), OrderDTO.class); // JSON String to OrderDTO
		/*
			// List<OrderProductDTO> orderProducts = mapper.readValue(json.get("orderProducts").toString(), List.class);
			List<OrderProductDTO> orderProducts = mapper.readValue(json.get("orderProducts").toString(), new TypeReference<List<OrderProductDTO>>(){});
			
			PaymentDTO paymentDTO = mapper.readValue(json.get("payment").toString(), PaymentDTO.class);
		*/
		
		// model.addAttribute("member", memberDTO);
		model.addAttribute("order", orderDTO);
		/*
			model.addAttribute("orderProducts", orderProducts);
			model.addAttribute("payment", paymentDTO);
		*/
		
		return "order/paymentComplete";
	}
	
	@RequestMapping(value = "orderDetail")
	public String orderDetail(String orderNum, Model model) {
		OrderDTO orderDTO = orderService.getOrderOne(createQueryParameter("target", orderNum));
		orderDTO.setMemberDTO(memberService.getMember(orderDTO.getId()));
		orderDTO.setCancels(orderService.getCancelAll(createQueryParameter("all", orderDTO.getOrderNum())));
		
		model.addAttribute("order", orderDTO);
		return "order/orderDetail";
	}
	
	@RequestMapping(value = "list")
	public String list(Model model, HttpSession session) {
		List<OrderDTO> orders = orderService.getOrderAll(createQueryParameter("all", ((MemberDTO)session.getAttribute("member")).getId()));
		for(OrderDTO orderDTO : orders) {
			orderDTO.setMemberDTO(memberService.getMember(orderDTO.getId()));
			orderDTO.setCancels(orderService.getCancelAll(createQueryParameter("all", orderDTO.getOrderNum())));
		}
		
		model.addAttribute("orders", orders);
		return "order/list";
	}
	
	@RequestMapping(value = "cancel")
	public String cancel(@RequestParam String orderNum, Model model) {
		OrderDTO orderDTO = orderService.getOrderOne(createQueryParameter("target", orderNum));
		model.addAttribute("order", orderDTO);
		
		return "order/cancel";
	}
	
	@RequestMapping(value = "cancel", method = RequestMethod.POST)
	@ResponseBody
	public Long cancel(@RequestBody CancelDTO cancelDTO) throws Exception {
		OrderDTO orderDTO = orderService.getOrderOne(createQueryParameter("target", cancelDTO.getOrderNum()));
		return orderService.cancel(cancelDTO, orderDTO);
	}
	
	@RequestMapping(value = "cancelDetail")
	public String cancelDetail(@RequestParam String cancelNum, Model model) {
		CancelDTO cancelDTO = orderService.getCancelOne(createQueryParameter("target", cancelNum));
		OrderDTO orderDTO = orderService.getOrderOne(createQueryParameter("target", cancelDTO.getOrderNum()));
		MemberDTO memberDTO = memberService.getMember(orderDTO.getId());
		
		model.addAttribute("cancel", cancelDTO);
		model.addAttribute("member", memberDTO);
		return "order/cancelDetail";
	}
	
	@RequestMapping(value = "tracking")
	public String tracking() {
		return "order/tracking";
	}
	
	private Map<String, String> createQueryParameter(String kind, String value){
		Map<String, String> map = new HashMap<String, String>();
		map.put("kind", kind);
		map.put("value", value);
		return map;
	}
}
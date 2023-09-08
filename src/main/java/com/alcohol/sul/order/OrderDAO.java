package com.alcohol.sul.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alcohol.sul.main.product.ProductDTO;

@Repository
public class OrderDAO {
	@Autowired
	private SqlSession sqlSession; // SqlSessionTemplate extends SqlSession
	private final String NAMESPACE = "com.alcohol.sul.order.OrderDAO.";
	
	public ProductDTO getProduct(Long productNum){
		return sqlSession.selectOne(NAMESPACE + "getProduct", productNum);
	}
	
	public List<OtherAddressDTO> getOtherAddress(String id){
		return sqlSession.selectList(NAMESPACE + "getOtherAddress", id);
	}
	
	public Long addOtherAddress(OtherAddressDTO otherAddressDTO){
		sqlSession.insert(NAMESPACE + "addOtherAddress", otherAddressDTO);
		return otherAddressDTO.getAddressNum();
	}
	
	public int deleteOtherAddress(Long addressNum){
		return sqlSession.insert(NAMESPACE + "deleteOtherAddress", addressNum);
	}
	
	public void paymentSuccess(OrderDTO orderDTO, boolean isBasket) {
		sqlSession.insert(NAMESPACE + "addOrder", orderDTO);
		
		// sqlSession.insert(NAMESPACE + "addOrderProducts", orderDTO.getOrderProducts());
		for(OrderProductDTO orderProductDTO : orderDTO.getOrderProducts()) {
			sqlSession.insert(NAMESPACE + "addOrderProduct", orderProductDTO);
		}
		
		sqlSession.insert(NAMESPACE + "addOrderAddress", orderDTO.getOrderAddressDTO());
		sqlSession.insert(NAMESPACE + "addPayment", orderDTO.getPaymentDTO());
		sqlSession.update(NAMESPACE + "subMemberPoint", orderDTO);
		
		if(isBasket) sqlSession.delete(NAMESPACE + "deleteBasket", orderDTO.getId());
	}
	
	public OrderDTO getOrderOne(Map<String, String> map) {
		return sqlSession.selectOne(NAMESPACE + "getOrder", map);
	}
	
	public List<OrderDTO> getOrderAll(Map<String, String> map) {
		return sqlSession.selectList(NAMESPACE + "getOrder", map);
	}
	
	 public void cancel(CancelDTO cancelDTO, OrderDTO orderDTO) {
		sqlSession.insert(NAMESPACE + "addCancel", cancelDTO);
		if(cancelDTO.getCancelState().equalsIgnoreCase("complete")) {
			List<CancelInfoDTO> cancelInfos = cancelDTO.getCancelInfos();
			for(CancelInfoDTO cancelInfoDTO : cancelInfos) {
				cancelInfoDTO.setCancelNum(cancelDTO.getCancelNum());
			}
			
			sqlSession.insert(NAMESPACE + "addCancelInfo", cancelDTO.getCancelInfos());
			
			for(OrderProductDTO orderProductDTO : orderDTO.getOrderProducts()) {
				for(CancelInfoDTO cancelInfoDTO : cancelDTO.getCancelInfos()) {
					if(orderProductDTO.getOrderProductNum() == cancelInfoDTO.getOrderProductNum()) {
						sqlSession.update(NAMESPACE + "updateOrderProductIsCanceled", orderProductDTO.getOrderProductNum());
						break;
					}
				}
			}
			
			sqlSession.update(NAMESPACE + "addMemberPoint", orderDTO);
		}
	}
	
	public CancelDTO getCancelOne(Map<String, String> map){
		return sqlSession.selectOne(NAMESPACE + "getCancel", map);
	}
	
	public List<CancelDTO> getCancelAll(Map<String, String> map) {
		return sqlSession.selectList(NAMESPACE + "getCancel", map);
	}
}
package com.alcohol.sul.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.alcohol.sul.cart.CartDAO.";
	
	public List<CartDTO> getList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList");
	}
}

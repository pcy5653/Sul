package com.alcohol.sul.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alcohol.sul.member.MemberDTO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.alcohol.sul.admin.AdminDAO.";
	
	public List<MemberDTO> getMemberList(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getMemberList",memberDTO);
	}
	
	public int pointAdd(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"pointAdd", memberDTO);
	}
	
	public MemberDTO getPoint(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getPoint", memberDTO);
	}
	
	public List<MemberDTO> getSmsCheckList(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getSmsCheckList", memberDTO);
	}
	
	
	public List<SalesRevenueDTO> getSalesRevenue() {
		return sqlSession.selectList(NAMESPACE+"getSalesRevenue");
	}
	
	public List<SalesRevenueDTO> dailySales(SalesRevenueDTO salesDTO){
		return sqlSession.selectList(NAMESPACE+"dailySales",salesDTO);
	}
	


}
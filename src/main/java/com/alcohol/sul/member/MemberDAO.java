package com.alcohol.sul.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.alcohol.sul.member.MemberDAO.";
	
	//회원가입
	public int setJoin(MemberDTO memberDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setJoin", memberDTO);
	}
	
	//로그인
	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getLogin", memberDTO);
	}
	
	//아이디중복체크
	public MemberDTO getIdCheck(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getIdCheck", memberDTO);
	}
	
	//폰번호중복체크
	public MemberDTO getPhoneCheck(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getPhoneCheck",memberDTO);
	}
	
	public int setInfoUpdate(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setInfoUpdate", memberDTO);
	}
	
	public int setPwUpdate(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setPwUpdate",memberDTO);
	}
	
	public MemberDTO findId(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"findId", memberDTO);
	}
	
	public MemberDTO findPw(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"findPw", memberDTO);
	}
	
}

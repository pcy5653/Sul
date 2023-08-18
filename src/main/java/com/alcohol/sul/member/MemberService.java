package com.alcohol.sul.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public int setJoin(MemberDTO memberDTO) throws Exception{
		return memberDAO.setJoin(memberDTO);
	}
	
	public MemberDTO getLogin(MemberDTO memberDTO) throws Exception{
		return memberDAO.getLogin(memberDTO);
		
	}
	
	public int getIdCheck(MemberDTO memberDTO) throws Exception{
		memberDTO = memberDAO.getIdCheck(memberDTO);
		
		int result=0;  //중복
		if(memberDTO == null) {
			result=1; //중복x
		}
		return result;
	}
}


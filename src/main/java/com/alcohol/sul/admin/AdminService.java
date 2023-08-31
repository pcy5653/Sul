package com.alcohol.sul.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alcohol.sul.member.MemberDTO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;
	
	public List<MemberDTO> getMemberList(MemberDTO memberDTO)throws Exception{
		return adminDAO.getMemberList(memberDTO);
	}
	
	
	public int pointAdd(MemberDTO memberDTO) throws Exception{
		return adminDAO.pointAdd(memberDTO);
	}
	
	
	public MemberDTO getPoint(MemberDTO memberDTO) throws Exception{
		return adminDAO.getPoint(memberDTO);
	}
}
